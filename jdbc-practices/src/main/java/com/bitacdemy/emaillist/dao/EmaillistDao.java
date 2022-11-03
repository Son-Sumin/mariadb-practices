package com.bitacdemy.emaillist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.bitacdemy.emaillist.vo.EmaillistVo;

// DAO-CRUD / IO-데이터베이스 row를 담는 객체 -> single responsibility

public class EmaillistDao {
	
//	public List<EmaillistVo> findAll() {
//		List<EmaillistVo> result = new ArrayList<>();
//	public static void main(String[] args) {
//		List<String> list = new LinkedList<>();

	
	public List<EmaillistVo> insert(first_name, last_name, email) {
		List<EmaillistVo> result = new LinkedList<>();
		
		boolean result = false;
		Connection conn = null;
		Statement stmt = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
			stmt = conn.createStatement();
			
			String sql = 
				" insert" + 
				" into emaillist" +
				" values(null, '"+ first_name + "', " + last_name + "," + email + "')";
			
			int count = stmt.executeUpdate(sql);
			result = count == 1;
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public Boolean deleteByEmail(String email) {
		return false;
	}

	public List<EmaillistVo> findAll() {
		List<EmaillistVo> result = new ArrayList<>();

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			Class.forName("org.mariadb.jdbc.Driver");

			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");

			stmt = conn.createStatement();

			String sql = 
					"select first_name, last_name, email" + 
					" from emaillist" + 
					" order by no desc";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				String firstName = rs.getString(1);
				String lastName = rs.getString(2);
				String email = rs.getString(3);

				EmaillistVo vo = new EmaillistVo();
				vo.setFirstName(firstName);
				vo.setLastName(lastName);
				vo.setEmail(email);

				result.add(vo);
			}

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		} catch (SQLException e) {
			System.out.println("Error: " + e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
