package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdatTest44 {

	public static void main(String[] args) {
		DeptVo5 vo = new DeptVo5();
		vo.setNo(2L);
		vo.setName("시스템개발");
		
		boolean result = update(vo);
		System.out.println(result ? "성공" : "실패");
	}

	private static boolean update(DeptVo5 deptVo) {
		boolean result = false;
		Connection conn = null;  
		PreparedStatement pstmt = null;

		try {
			// 1. JDBC Driver Class Loading (not using new, using class code)
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");

			// 3. Statement 준비
			String sql = "update dept set name = ? where no = ?";
			pstmt = conn.prepareStatement(sql);

			//4. Binding
			pstmt.setString(1, deptVo.getName());
			pstmt.setLong(2, deptVo.getNo());
			
			//5. SQL 실행
			int count = pstmt.executeUpdate();
		
			//6. 결과처리
			result = count == 1;

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		} catch (SQLException e) {
			System.out.println("Error: " + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
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
