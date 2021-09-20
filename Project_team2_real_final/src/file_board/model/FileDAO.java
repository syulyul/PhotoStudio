package file_board.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FileDAO {
	ResultSet rs; // 데이터 베이스 테이블의 결과를 리턴 받아 저장해 주는 객체
	Connection conn; // 데이터 베이스에 접근 할 수 있도록 설정
	PreparedStatement pstmt; // 데이터 베이스에서 쿼리를 실행시켜 주는 객체
	
	// 데이터 베이스의 커넥션풀을 사용하도록 설정하는 메서드
	public void getCon() {
			/*
			 * try { String dburl="jdbc:oracle:thin:@localhost:1521:xe"; String
			 * dbID="scott"; String dbPassword="tiger";
			 * Class.forName("oracle.jdbc.driver.OracleDriver");
			 * conn=DriverManager.getConnection(dburl,dbID,dbPassword); }catch(Exception e)
			 * { e.printStackTrace(); }
			 */

			/*
			 * jdbc:oracle:thin ==> 드라이버 레지스트리에 등록된 Oracle JDBC Driver의 명칭 localhost ==>
			 * Datbase가 설치된 PC 1521 ==> Database가 점유하고 있는 포트번호 xe ==> Database의 식별자
			 */

		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	public int upload(String fileName, String fileRealName) {
		String SQL = "INSERT INTO bbs_file VALUES (?,?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			
			return pstmt.executeUpdate();
		} catch (Exception e) { 
			
		}
		return -1;
		
	}
	
	public int getNewNext() {
		
		ResultSet rs;
		
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}