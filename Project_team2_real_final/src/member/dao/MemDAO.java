package member.dao;

import java.sql.Connection;
/*import java.sql.DriverManager;*/
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/*import java.util.ArrayList;
import java.util.List;*/

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.dto.MemVO;






public class MemDAO {
	/*
	 * String id="scott"; String pass="tiger"; String
	 * url="jdbc:oracle:thin:@localhost:1521:xe";
	 * 
	 * Connection conn; PreparedStatement pstmt; ResultSet rs;
	 * 
	 * public void getCon() { try {
	 * Class.forName("oracle.jdbc.driver.OracleDriver");
	 * conn=DriverManager.getConnection(url, id, pass); }catch(Exception e) {
	 * e.printStackTrace(); } }
	 * 
	 * private static MemDAO instance=new MemDAO();
	 * 
	 * public static MemDAO getInstance() {
	 * 
	 * return instance; }
	 */

	private MemDAO() {// 생성자도 private -> 외부에서 객체 생성 할 수 없음

	}

	// (singleton) // 자기 자신을 클래스 안에서 객체화 시킨다
	private static MemDAO instance = new MemDAO(); // MemberDAO를 객체생성 //근데 private

	public static MemDAO getInstance() { // MemberDAO->반환타입 //얘를 호출함으로 인해서 MemberDAO라는 객체를 받을 수 있음 / 얘가 반환하는 값으로
		return instance; // 주소값 반환
	}

	public Connection getCon() throws Exception {
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/Oracle11g");
		conn = ds.getConnection();

		return conn;

	}

	public int userCheck(String id, String pass1) {

		int result = -1;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getCon();

			String sql = "select password1 from memberho where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("password1") != null && rs.getString("password1").equals(pass1)) {
					result = 1; // 아이디 패스워드 일치
				} else {
					result = 0; // 아이디 패스워드 불일치
				}
			} else {
				result = -1; // 아이디 없음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public int confirmID(String id) { // 아이디 확인
		int result = -1;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getCon();
			String sql = "select id from memberho where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = 1;
			} else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public MemVO getMember(String id) { // VO:Value Object,DTO:Data Transfer Object
		MemVO mvo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getCon();

			String sql = "select * from memberho where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				mvo = new MemVO();
				mvo.setId(rs.getString("id"));
				mvo.setPassword1(rs.getString("password1"));
				mvo.setPassword1(rs.getString("password2"));
				mvo.setName(rs.getString("name"));
				mvo.setEmail(rs.getString("email"));
				mvo.setPhone(rs.getString("phone"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return mvo;
	}

	public int insertMember(MemVO mbean) {
		int result = -1;

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getCon();
			String sql = "insert into memberho values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPassword1());
			pstmt.setString(3, mbean.getPassword2());
			pstmt.setString(4, mbean.getName());
			pstmt.setString(5, mbean.getEmail());
			pstmt.setString(6, mbean.getPhone());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;

	}

	
	/*
	 * public MemVO findMembers(String id) { // 아이디로 회원정보 찾기 MemVO mbean=new
	 * MemVO();
	 * 
	 * getCon(); try {
	 * 
	 * String sql="select * from memberho where id=?";
	 * pstmt=conn.prepareStatement(sql); pstmt.setString(1, id);
	 * rs=pstmt.executeQuery();
	 * 
	 * if(rs.next()) { mbean.setId(rs.getString(1));
	 * mbean.setPassword1(rs.getString(2)); mbean.setPassword2(rs.getString(3));
	 * mbean.setName(rs.getString(4)); mbean.setEmail(rs.getString(5));
	 * mbean.setPhone(rs.getString(6));
	 * 
	 * 
	 * 
	 * conn.close(); }catch(Exception e) { e.printStackTrace(); }
	 * 
	 * return mbean; }
	 * 
	 * 
	 * 
	 * public boolean checkId(String id) { boolean check = false; }
	 * 
	 * Connection conn=null; PreparedStatement pstmt=null; ResultSet rs=null;
	 * 
	 * try { conn=getCon();
	 * 
	 * String sql = "select id from memberho where id=?"; pstmt =
	 * conn.prepareStatement(sql); pstmt.setString(1, id); rs =
	 * pstmt.executeQuery(); check = rs.next(); }catch(Exception e) {
	 * e.printStackTrace(); } return check; }
	 */
	 

	public int updateMember(MemVO mvo) {
		int result = -1;

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getCon();

			String sql = "update memberho set password1=?,password2=?,name=?,email=?,phone=? where id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mvo.getPassword1());
			pstmt.setString(2, mvo.getPassword2());
			pstmt.setString(3, mvo.getName());
			pstmt.setString(4, mvo.getEmail());
			pstmt.setString(5, mvo.getPhone());
			pstmt.setString(6, mvo.getId());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;

	}

//	public void deleteMember(String id) {
//
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//
//		try {
//			conn = getCon();
//			String sql = "delete from memberho where id=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, id);
//
//			pstmt.executeUpdate();
//
//			conn.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	public int deleteMember(String id) {

		int result = -1;

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getCon();

			String sql = "delete from memberho where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}
}
	
				


