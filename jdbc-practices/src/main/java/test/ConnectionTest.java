/*
 * Maven Project로 jdbc-practices 만들기
 * pom, ignore 수정
 * 
 * 
 */

package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionTest {

	public static void main(String[] args) {
		Connection conn = null;
		try {
			// 1. JDBC Driver Class Loading (not using new, using class code)
			Class.forName("org.mariadb.jdbc.Driver"); // 해당 ""은 알아야 한다. googling

			// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8"; // "" 알아한다. 프로그램마다 url 다름. url 기억해야함
			conn = DriverManager.getConnection(url, "webdb", "webdb");

			System.out.println("sussess!");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		} catch (SQLException e) {
			System.out.println("Error: " + e);
		} finally {
			try {
				if(conn != null)
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		// 3.

	}

}
