/*
 * Maven Project로 jdbc-practices 만들기
 * JDBC; 자바 프로그램 내에서 SQL문을 실행하기 위한 자바API(Java Library Interface)
 * insert, delete, update, select는 여러 드라이버 설치 시 이용
 * executeUpdate -> insert, delete, update
 * executeQuery -> select
 *    -> ResultSet rs = stmt.executeQuery(SQL); while(rs.next()); sysout ~
 * 
 * pom; <properties></properties> <dependencies><dependency></dependency></dependencies> <build></build> 수정
 * <dependency></dependency>은 MariaDB Java Client googling -> 원하는 버전 copy&paste
 * ignore 이클립스, 파이참 등 사용 언어 관련 기본 파일 확장자 적기
 * __pycache__ .vscode .idea venv target/ .classpath .project .settings
 */

package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionTest1 {

	public static void main(String[] args) {
		Connection conn = null;
		// try블락 지역변수 -> try블락 에러 시 finally에서 close()할 수 있도록 밖으로 빼기
		
		try {
			// 1. JDBC Driver Class Loading (not using new, using class code)
			// 해당 ""은 알아야 한다. googling~
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8"; // "" 알아한다. 프로그램마다 url 다름. url 기억해야함
			conn = DriverManager.getConnection(url, "webdb", "webdb");  //(url, "name", "password")

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

	}

}
