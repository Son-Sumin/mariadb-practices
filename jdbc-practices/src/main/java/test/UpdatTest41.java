package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdatTest41 {

	public static void main(String[] args) {
		DeptVo5 vo = new DeptVo5();
		vo.setNo(1L);
		vo.setName("경영지원");
		
		boolean result = update(vo);
		System.out.println(result ? "성공" : "실패");
	}

	private static boolean update(DeptVo5 deptVo) {
		boolean result = false;
		Connection conn = null;  
		Statement stmt = null;

		try {
			// 1. JDBC Driver Class Loading (not using new, using class code)
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");

			// 3. Statement 생성
			stmt = conn.createStatement();

			// 4. SQL 실행
			String sql = 
					 "update dept" + 
					 " set name = '" + deptVo.getName() + "'" + 
					 " where no = " + deptVo.getNo();
			
			// 결과 확인
			int count = stmt.executeUpdate(sql);
			result = count == 1;

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
