package test;

//PreparedStatement 사용

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertTest22 {

	public static void main(String[] args) {
		insert("시스템2");
		insert("마케팅2");
		insert("운영2");
	}

	private static boolean insert(String name) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;    // database 자원 정리 필수, close는 역순으로 기입
		
		try {
			//1. JDBC Driver Class Loading
			Class.forName("org.mariadb.jdbc.Driver");
			
			//2. 연결한다(connection 객체 생성)
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
			//3. Statement 준비
			String sql = 
					" insert" +
					" into dept" +
					" values (null, ?)";
			pstmt = conn.prepareStatement(sql);
			
			//4. Binding
			pstmt.setString(1, name);
			
			//5. SQL 실행
			int count = pstmt.executeUpdate(sql);
			
			//6. 결과처리
			result = count == 1;
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("Error:" + e);
		} finally { 
			try {
				if(pstmt != null) {
					pstmt.close();
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
}
