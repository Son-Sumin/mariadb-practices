package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertTest {

	public static void main(String[] args) {
		insert("시스템");
		insert("마케팅");
		insert("운영");
	}

	private static boolean insert(String name) {
		boolean result = false;
		
		Connection conn = null;  
		Statement stmt = null;  // database 자원 정리 필수, close는 역순으로 기입

		try {
			// 1. JDBC Driver Class Loading (not using new, using class code)
			Class.forName("org.mariadb.jdbc.Driver"); // 해당 ""은 알아야 한다. googling

			// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8"; // "" 알아한다. 프로그램마다 url 다름. url 기억해야함
			conn = DriverManager.getConnection(url, "webdb", "webdb");  //(url, "name", "password")

			// 3. Statement 생성
			stmt = conn.createStatement();

			// 4. SQL 실행
			String sql = 
					"insert" + 
					" into dept" + 
					"values('" + null + name + "')"; // ' 맨마지막 ; 붙이기 말기!!!
			int count = stmt.executeUpdate(sql);
			
			return result = count == 1;

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		} catch (SQLException e) {
			System.out.println("Error: " + e);
		} finally {
			try {
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
