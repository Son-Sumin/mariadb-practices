package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertTest2 {

	public static void main(String[] args) {
		insert("시스템");
		insert("마케팅");
		insert("운영");
	}

	private static boolean insert(String name) {
		boolean result = false;
		Connection conn = null;
		Statement stmt = null;    // database 자원 정리 필수, close는 역순으로 기입
		
		try {
			//1. JDBC Driver Class Loading
			Class.forName("org.mariadb.jdbc.Driver");
			
			//2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
			//3. Statement 생성
			stmt = conn.createStatement();
			
			//4. SQL 실행
			String sql = 
				" insert" +
				" into dept" +
				" values (null, '" + name + "')";
			
			// 결과 확인; [성공]count==1 / [실패]count==0  -> 워크벤치에서 확인
			int count = stmt.executeUpdate(sql);
			??result = count == 1;
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally {  // 자원 정리
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
		//System.out.println(result ? "성공" : "실패");
		return result;
	}
}
