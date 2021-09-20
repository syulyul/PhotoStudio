package member.dao;

import java.sql.Connection;
/*import java.sql.DriverManager;*/
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
//import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.dto.MemVO;
import member.dto.MemVO_admin;


public class MemDAO_admin {
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

	private MemDAO_admin() {// 생성자도 private -> 외부에서 객체 생성 할 수 없음

	}

	// (singleton) // 자기 자신을 클래스 안에서 객체화 시킨다
	private static MemDAO_admin instance = new MemDAO_admin(); // MemberDAO를 객체생성 //근데 private

	public static MemDAO_admin getInstance() { // MemberDAO->반환타입 //얘를 호출함으로 인해서 MemberDAO라는 객체를 받을 수 있음 / 얘가 반환하는 값으로
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

	public int userCheck(String id, String pass) {

		int result = -1;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getCon();

			String sql = "select password from admin_account where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("password") != null && rs.getString("password").equals(pass)) {
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
	
	/*
	public int confirmID(String id) { // 아이디 확인
		int result = -1;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getCon();
			String sql = "select id from admin_account where id=?";
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
	*/
	
	public MemVO_admin getMember(String id) { // VO:Value Object,DTO:Data Transfer Object
		MemVO_admin mvo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getCon();

			String sql = "select * from admin_account where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				mvo = new MemVO_admin();
				mvo.setId(rs.getString("id"));
				mvo.setPassword(rs.getString("password"));
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

	/*
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
	*/
	
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
	 
	/*
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
	*/
	/*
	public void deleteMember(String id) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getCon();
			String sql = "delete from memberho where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/
	
	public ArrayList<MemVO> allSelectMember(HashMap<String, Object> listOpt) { // 전체 회원 출력

		// int result = -1;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 가변길이로 데이터를 저장
		// Vector<MemberBean> v=new Vector<MemberBean>();
		ArrayList<MemVO> list = new ArrayList<>(); // 생략 가능

		String opt = (String) listOpt.get("opt"); // 검색옵션(제목, 내용, 글쓴이 등..)
		String condition = (String) listOpt.get("condition"); // 검색내용
		int start = (Integer) listOpt.get("start"); // 현재 페이지번호

		try {
			conn = getCon();

			String sql = null;
			if (opt == null) {

				sql = "select * from (select A.*,Rownum Rnum from (select id,password1,name,email,phone from memberho)A)" 
						+ "where Rnum >= ? and Rnum <= ? order by Rnum desc";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, start + 9);

			} else if (opt.equals("0")) { // 아이디로 검색
				sql = "select * from (select A.*,Rownum Rnum from(select id,password1,name,email,phone from memberho where id like ?)A)"
						+ "where Rnum >= ? and Rnum <= ? order by Rnum desc";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + condition + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, start + 9);

			} else if (opt.equals("1")) { // 이름으로 검색
				sql = "select * from (select A.*,Rownum Rnum from(select id,password1,name,email,phone from memberho where name like ?)A)"
						+ "where Rnum >= ? and Rnum <= ? order by Rnum desc";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + condition + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, start + 9);

			} else if (opt.equals("2")) { // 이메일으로 검색
				sql = "select * from (select A.*,Rownum Rnum from(select id,password1,name,email,phone from memberho where email like ?)A)"
						+ "where Rnum >= ? and Rnum <= ? order by Rnum desc";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + condition + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, start + 9);

			} else if (opt.equals("3")) { // 전화번호로 검색
				sql = "select * from (select A.*,Rownum Rnum from(select id,password1,name,email,phone from memberho where phone like ?)A)"
						+ "where Rnum >= ? and Rnum <= ? order by Rnum desc";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + condition + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, start + 9);
			}

			rs = pstmt.executeQuery();

			while (rs.next()) { // rs는 true라는 값을 반환
				MemVO mbean = new MemVO(); // rs에 있는 정보를 MemberBean으로 옮기기 위해서
				mbean.setId(rs.getString(1));
				mbean.setPassword1(rs.getString(2));
				mbean.setName(rs.getString(3));
				mbean.setEmail(rs.getString(4));
				mbean.setPhone(rs.getString(5));

				list.add(mbean);
			}

			conn.close();

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

		return list;
	}
	
	public int getMemberListCount(HashMap<String, Object> listOpt){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
        int result = 0;
        String opt = (String)listOpt.get("opt"); // 검색옵션(아이디,이름,이메일,전화번호)
        String condition = (String)listOpt.get("condition"); // 검색내용
        
        try {
			conn = getCon();

			String sql = null;
            
            if(opt == null)    // 전체글의 개수
            {
                sql="select count(*) from memberho";
                pstmt = conn.prepareStatement(sql);
                
            }else if(opt.equals("0")) { // 아이디로 검색한 글의 개수
            
                sql="select count(*) from memberho where id like ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, '%'+condition+'%');
                
            }else if(opt.equals("1")) { // 이름으로 검색한 글의 개수
            
                sql="select count(*) from memberho where name like ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, '%'+condition+'%');
               
            }
            else if(opt.equals("2")) // 이메일으로 검색한 글의 개수
            {
                sql="select count(*) from memberho where email like ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, '%'+condition+'%');
                
            }
            
            else if(opt.equals("3")) // 전화번호로 검색한 글의 개수
            {
                sql="select count(*) from memberho where phone like ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, '%'+condition+'%');
               
            }
            
            
            rs = pstmt.executeQuery();
            if(rs.next())    
            	result = rs.getInt(1);
            
            conn.close();
            
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
    } // end getBoardListCount
	
	// 글 여러개 삭제 : 체크박스 형태
	public int multiDelete(String[] id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		//ResultSet rs = null;
		
		int res = 0;
		int[] cnt = null;

		try {
				
			conn = getCon();
			
			String sql = "delete memberho where id=?";
			pstmt = conn.prepareStatement(sql);

			for (int i = 0; i < id.length; i++) {
				pstmt.setString(1, id[i]);

				// 쿼리문 pstmt에 모두 쌓아 한번에 처리
				pstmt.addBatch();
			}

			cnt = pstmt.executeBatch();

			// 쿼리 성공 : -2
			for (int i = 0; i < cnt.length; i++) {
				if (cnt[i] == -2) {
					res++;
				}
			}

			// 모아둔 쿼리 실행 끝나면 커밋
			if (id.length == res) {
				conn.commit();
			} else {
				conn.rollback();
			}

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

		return res;

	}
			
}
	
				


