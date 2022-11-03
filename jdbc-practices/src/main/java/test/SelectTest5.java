package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectTest5 {

	public static void main(String[] args) {
		search("pat");
	}

	private static void search(String keyword) {
		Connection conn = null;  
		Statement stmt = null;  // database 자원 정리 필수, close는 역순으로 기입
		ResultSet rs = null;

		try {
			// 1. JDBC Driver Class Loading (not using new, using class code)
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/employees?charset=utf8";
			conn = DriverManager.getConnection(url, "hr", "hr");

			// 3. Statement 생성
			stmt = conn.createStatement();

			// 4. SQL 실행
			String sql = 
					"select emp_no, first_name" + 
					" from employees" + 
					" where first_name like '%" + keyword + "%'";
			
			??rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				Long empNo = rs.getLong(1); // database는 1부터 시작, 1대신 "emp_no" 기입 가능
				String firstName = rs.getString(2);

				System.out.println(empNo + ":" + firstName);
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

	}
}
