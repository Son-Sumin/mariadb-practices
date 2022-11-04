package test;

// PreparedStatement 사용
// 객체와 sql binding한다 표현
// 값과 sql mapping한다 표현

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectTest55 {

	public static void main(String[] args) {
		search("pat");
	}

	private static void search(String keyword) {
		Connection conn = null;  
		PreparedStatement pstmt = null;  // database 자원 정리 필수, close는 역순으로 기입
		ResultSet rs = null;

		try {
			// 1. JDBC Driver Class Loading (not using new, using class code)
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/employees?charset=utf8";
			conn = DriverManager.getConnection(url, "hr", "hr");

			// 3. Statement 준비
			String sql = 
					"select emp_no, first_name" + 
					" from employees" + 
					" where first_name like ?";  // '?' 아니니까 주의!!!
			pstmt = conn.prepareStatement(sql);
			
			// 4. Binding
			pstmt.setString(1, '%' + keyword + '%');  // like query 때문에 % 이용

			// 5. SQL 실행
			rs = pstmt.executeQuery();  //(sql) 아님 주의!!
			
			// 6. 결과(ResultSet; 결과를 담고있는 객체) 처리
			while (rs.next()) {
				Long empNo = rs.getLong(1); // database는 1부터 시작, 1대신 "emp_no" 기입 가능
				String firstName = rs.getString(2);

				System.out.println(empNo + ":" + firstName);  // column이름이나 index 활용
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
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
}
