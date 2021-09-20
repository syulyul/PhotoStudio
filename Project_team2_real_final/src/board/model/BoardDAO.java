package board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
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

	// 하나의 새로운 게시글이 넘어와서 DB에 저장되는 메서드
	public void insertBoard(BoardBean bean) {
		getCon();
		// 빈 클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 한다
		int ref = 0; // 글 그룹을 의미 = 쿼리를 실행시켜 가장 큰 ref값을 가져온 후 +1을 더해준다
		int re_step = 1; // 새글이기에 = 부모 글이기에
		int re_level = 1;

		try {
			// 가장큰 ref값을 읽어오는 쿼리 준비
			String refsql = "select max(ref) from board";
			// 쿼리 실행 객체
			pstmt = conn.prepareStatement(refsql);
			// 쿼리를 실행 후 결과를 리턴
			rs = pstmt.executeQuery();

			if (rs.next()) { // 결과 값이 있다면
				ref = rs.getInt(1) + 1; // 최대값에 +1을 더해서 글 그룹을 설정
			}
			// 실제로 게시글 전체값을 테이블에 저장
			String sql = "insert into board values(board_seq.nextval,?,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);

			// ?의 값을 맵핑
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getWriter());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getSubject());
			pstmt.setString(5, bean.getPassword());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, bean.getContent());
			// 쿼리를 실행
			pstmt.executeUpdate();
			// 자원 반납
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * // 모든 게시글을 리턴해 주는 메서드 public Vector<BoardBean> getAllBoard(int start, int
	 * end) { // 이전 이후 카운터 // public Vector<BoardBean> getAllBoard() {
	 * 
	 * // 리턴할 객체 선언 Vector<BoardBean> vec = new Vector<>(); getCon();
	 * 
	 * try { // 쿼리 준비 // ref --- 1차 정렬 // re_step 2차 정렬
	 * 
	 * String sql =
	 * "select * from (select A.*,Rownum Rnum from(select * from board order by ref desc,re_step asc)A)"
	 * + "where Rnum >= ? and Rnum <= ?"; // String
	 * sql="select * from board order by ref desc,re_step asc";
	 * 
	 * // 쿼리 실행 객체 pstmt = conn.prepareStatement(sql); pstmt.setInt(1, start);
	 * pstmt.setInt(2, end); // 10개 기준
	 * 
	 * // 쿼리를 실행 후 결과를 저장 rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) { BoardBean bean = new BoardBean();
	 * bean.setNum(rs.getInt(1)); bean.setWriter(rs.getString(2));
	 * bean.setEmail(rs.getString(3)); bean.setSubject(rs.getString(4));
	 * bean.setPassword(rs.getString(5));
	 * bean.setReg_date(rs.getDate(6).toString()); bean.setRef(rs.getInt(7));
	 * bean.setRe_step(rs.getInt(8)); bean.setRe_level(rs.getInt(9));
	 * bean.setReadcount(rs.getInt(10)); bean.setContent(rs.getString(11));
	 * 
	 * vec.add(bean); // 패키징한 데이터를 벡터에 저장 } conn.close(); } catch (Exception e) {
	 * e.printStackTrace(); }
	 * 
	 * return vec; }
	 */

	// BoardInfo일 때 : 하나의 게시글을 리턴하는 메서드
	public BoardBean getOneBoard(int num) {
		// 리턴타입 선언
		BoardBean bean = new BoardBean();
		getCon();

		try {
			// 조회수 증가 커리
			String readsql = "update board set readcount=readcount+1 where num=?";
			pstmt = conn.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			// 쿼리 준비
			String sql = "select * from board where num=?";

			// 쿼리 실행 객체
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			// 쿼리 실행 후 결과를 리턴
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setWriter(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setSubject(rs.getString(5));
				bean.setPassword(rs.getString(6));
				bean.setReg_date(rs.getDate(7).toString());
				bean.setRef(rs.getInt(8));
				bean.setRe_step(rs.getInt(9));
				bean.setRe_level(rs.getInt(10));
				bean.setReadcount(rs.getInt(11));
				bean.setContent(rs.getString(12));

			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

	// 작성글을 바로 보기 위한 메서드
	public void getOneBoard1(BoardBean bean) {
		getCon();

		try {
			// 고유값num을 받아오기 위한 작업
			String sql = "select num, subject, ref from board where writer=? and password=? and subject=? order by num desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getSubject());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setSubject(rs.getString(2));
				bean.setRef(rs.getInt(3));

			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 답변글이 저장되는 메서드
	public void reWriteBoard(BoardBean bean) {
		// 부모글 그룹과 글레벨 글스텝 읽어들임
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();

		getCon();

		try {
			// 핵심 코드
			// 부모글 보다 큰 re_step의 값을 전부 1씩 증가시켜줌
			// 기존 글변경
			String levelsql = "update board set re_step=re_step+1 where ref=? and re_step > ?";
			// 쿼리 삽입 객체 선언
			pstmt = conn.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			// pstmt.setInt(2, re_level);
			pstmt.setInt(2, re_step);
			// 쿼리 실행
			pstmt.executeUpdate();
			// 답변글 데이터를 저장
			String sql = "insert into board values(board_seq.nextval,?,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);
			// ?에 값을 대입
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getWriter());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getSubject());
			pstmt.setString(5, bean.getPassword());
			pstmt.setInt(6, ref); // 부모의 ref값을 넣어줌
			pstmt.setInt(7, re_step + 1); // 답글이기에 부모글 re_step에 1을 넣어줌
			pstmt.setInt(8, re_level + 1);
			pstmt.setString(9, bean.getContent());

			// 쿼리를 실행
			pstmt.executeUpdate();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Boardupdate용 하나의 게시글을 리턴
	// Boardupdate용 delete시 하나의 게시글을 리턴
	public BoardBean getOneUpdateBoard(int num) {
		// 리턴타입 선언
		BoardBean bean = new BoardBean();
		getCon();

		try {
			// 쿼리 준비
			String sql = "select * from board where num=?";
			// 쿼리 실행 객체
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 쿼리 실행 후 결과를 리턴
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setWriter(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setSubject(rs.getString(5));
				bean.setPassword(rs.getString(6));
				bean.setReg_date(rs.getDate(7).toString());
				bean.setRef(rs.getInt(8));
				bean.setRe_step(rs.getInt(9));
				bean.setRe_level(rs.getInt(10));
				bean.setReadcount(rs.getInt(11));
				bean.setContent(rs.getString(12));
			}

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

	// update와 delete시 필요한 패스워드 값을 리턴해 주는 메서드
	public String getPass(int num) {
		// 리턴할 변수 객체 선언
		String pass = "";
		getCon();

		try {
			// 쿼리 준비
			String sql = "select password from board where num=?";
			// 쿼리 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 쿼리 실행후 결과를 리턴
			rs = pstmt.executeQuery();
			// 패스워드 값을 저장
			if (rs.next()) {
				pass = rs.getString(1);
			}
			// rs.getString() - getString함수는 해당 순서의 열에 있는 데이터를 String형으로 받아온다
			// 예를 들어 rs.getString(2)를 하게되면 2번째 열에 있는 데이터를 가져오게 된다.

			// 자원 반납
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pass;
	}

	// 하나의 게시글을 수정하는 메서드
	public void updateBoard(BoardBean bean) {
		getCon();

		try {
			// 쿼리 준비
			String sql = "update board set subject=?, content=? where num=?";

			// 쿼리 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());

			// 쿼리 실행후 결과를 리턴
			pstmt.executeUpdate();

			// 자원 반납
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 하나의 게시글을 삭제하는 메서드
	public void deleteBoard(int num) {
		getCon();

		try {
			// 쿼리 준비
			String sql = "delete from board where num=?";
			// 쿼리 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);
			// ?
			pstmt.setInt(1, num);
			// 쿼리 실행
			pstmt.executeUpdate();
			// 자원 반납
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * // 전체 글의 갯수를 리턴하는 메서드 public int getAllCount() { getCon(); // 게시글 전체수를 저장하는
	 * 변수 int count = 0;
	 * 
	 * try { // 쿼리 준비 String sql = "select count(*) from board"; // 쿼리 실행할 객체 선언
	 * pstmt = conn.prepareStatement(sql); // 쿼리 실행후 결과 리턴 rs =
	 * pstmt.executeQuery(); if (rs.next()) { count = rs.getInt(1); } // 자원 반납
	 * conn.close(); } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return count; }
	 */

		public ArrayList<BoardBean> getBoardList(HashMap<String, Object> listOpt) {
		getCon();

		ArrayList<BoardBean> list = new ArrayList<BoardBean>();

		String opt = (String) listOpt.get("opt"); // 검색옵션(제목, 내용, 글쓴이 등..)
		String condition = (String) listOpt.get("condition"); // 검색내용
		int start = (Integer) listOpt.get("start"); // 현재 페이지번호

		try {

			String sql = null;

			// 글목록 전체를 보여줄 때
			if (opt == null) {
				// ref(그룹번호)의 내림차순 정렬 후 동일한 그룹번호일 때는
				// re_step(답변글 순서)의 오름차순으로 정렬 한 후에
				// 10개의 글을 한 화면에 보여주는(start번째 부터 start+9까지) 쿼리
				// desc : 내림차순, asc : 오름차순 ( 생략 가능 )
				sql = "select * from (select A.*,Rownum Rnum from(select * from board order by ref desc,re_step asc)A)"
						+ "where Rnum >= ? and Rnum <= ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, start + 9);

			} else if (opt.equals("0")) // 제목으로 검색
			{
				sql = "select * from (select A.*,Rownum Rnum from(select * from board where subject like ? "
						+ "order by ref desc,re_step asc)A)" + "where Rnum >= ? and Rnum <= ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + condition + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, start + 9);

			} else if (opt.equals("1")) // 내용으로 검색
			{
				sql = "select * from (select A.*,Rownum Rnum from(select * from board where content like ? "
						+ "order by ref desc,re_step asc)A)" + "where Rnum >= ? and Rnum <= ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + condition + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, start + 9);

			} else if (opt.equals("2")) // 제목+내용으로 검색
			{
				sql = "select * from (select A.*,Rownum Rnum from(select * from board where subject like ? or content like ? "
						+ "order by ref desc,re_step asc)A)" + "where Rnum >= ? and Rnum <= ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + condition + "%");
				pstmt.setString(2, "%" + condition + "%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, start + 9);

			} else if (opt.equals("3")) // 글쓴이로 검색
			{
				sql = "select * from (select A.*,Rownum Rnum from(select * from board where writer like ? "
						+ "order by ref desc,re_step asc)A)" + "where Rnum >= ? and Rnum <= ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + condition + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, start + 9);

			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setWriter(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setSubject(rs.getString(5));
				bean.setPassword(rs.getString(6));
				bean.setReg_date(rs.getDate(7).toString());
				bean.setRef(rs.getInt(8));
				bean.setRe_step(rs.getInt(9));
				bean.setRe_level(rs.getInt(10));
				bean.setReadcount(rs.getInt(11));
				bean.setContent(rs.getString(12));

				list.add(bean); // 패키징한 데이터를 리스트에 저장
			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	} // end getBoardList
/*
	
	public ArrayList<BoardBean> getBoardList(HashMap<String, Object> listOpt) {
		getCon();

		ArrayList<BoardBean> list = new ArrayList<BoardBean>();

		String opt = (String) listOpt.get("opt"); // 검색옵션(제목, 내용, 글쓴이 등..)
		String condition = (String) listOpt.get("condition"); // 검색내용
		int start = (Integer) listOpt.get("start"); // 현재 페이지번호

		try {

			String sql = null;

			// 글목록 전체를 보여줄 때
			if (opt == null) {
				// ref(그룹번호)의 내림차순 정렬 후 동일한 그룹번호일 때는
				// re_step(답변글 순서)의 오름차순으로 정렬 한 후에
				// 10개의 글을 한 화면에 보여주는(start번째 부터 start+9까지) 쿼리
				// desc : 내림차순, asc : 오름차순 ( 생략 가능 )
				sql = "select * from (select A.*,Rownum Rnum from(select num,id,subject,writer,reg_date,readcount "
						+ "from board order by ref desc,re_step asc)A)"
						+ "where Rnum >= ? and Rnum <= ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, start + 9);

			} else if (opt.equals("0")) // 제목으로 검색
			{
				sql = "select * from (select A.*,Rownum Rnum from(select num,id,subject,writer,reg_date,readcount"
						+ " from board where subject like ? order by ref desc,re_step asc)A)" 
						+ "where Rnum >= ? and Rnum <= ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + condition + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, start + 9);

			} else if (opt.equals("1")) // 내용으로 검색
			{
				sql = "select * from (select A.*,Rownum Rnum from(select num,id,subject,writer,reg_date,readcount"
						+ " from board where content like ? order by ref desc,re_step asc)A)" 
						+ "where Rnum >= ? and Rnum <= ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + condition + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, start + 9);

			} else if (opt.equals("2")) // 제목+내용으로 검색
			{
				sql = "select * from (select A.*,Rownum Rnum from(select num,id,subject,writer,reg_date,readcount"
						+ " from board where subject like ? or content like ? order by ref desc,re_step asc)A)" 
						+ "where Rnum >= ? and Rnum <= ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + condition + "%");
				pstmt.setString(2, "%" + condition + "%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, start + 9);

			} else if (opt.equals("3")) // 글쓴이로 검색
			{
				sql = "select * from (select A.*,Rownum Rnum from(select num,id,subject,writer,reg_date,readcount"
						+ " from board where writer like ? order by ref desc,re_step asc)A)" 
						+ "where Rnum >= ? and Rnum <= ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + condition + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, start + 9);

			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setSubject(rs.getString(3));
				bean.setWriter(rs.getString(4));
				bean.setReg_date(rs.getDate(5).toString());
				bean.setReadcount(rs.getInt(6));
				

				list.add(bean); // 패키징한 데이터를 리스트에 저장
			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	} // end getBoardList
	
*/
	// 회원의 문의내역
	public ArrayList<BoardBean> getBoardMemberList(HashMap<String, Object> listOpt){
		getCon();
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		
        String id = (String)listOpt.get("id");
        int start = (Integer)listOpt.get("start");
        	
        	String sql = null;
        	
    	try {
    		if (id != null) {
    			/*
    			sql = "select * from (select A.*,Rownum Rnum from(select num,subject, writer, reg_date from board where id= ?"
    					+ "order by num desc)A) where Rnum >= ? and Rnum <= ?";
    			*/
    			
    			
    			sql = "select * from (select A.*,Rownum Rnum from(select num,subject,writer,reg_date from board a ," 
    					+ "(select ref from board where id = ?) b " 
    					+ "where a.ref = b.ref order by a.ref desc,re_step)A ) where Rnum >= ? and Rnum <= ?";
    			
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setString(1, id);
    			pstmt.setInt(2, start);
    			pstmt.setInt(3, start + 9);

			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setSubject(rs.getString(2));
				bean.setWriter(rs.getString(3));
				bean.setReg_date(rs.getDate(4).toString());
				  
							

				list.add(bean);
			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	} // end getBoardList
	
	
	// 회원의 문의내역2
		public ArrayList<BoardBean> getBoardMemberList2(HashMap<String, Object> listOpt){
			getCon();
			ArrayList<BoardBean> list = new ArrayList<BoardBean>();
			
	        String id = (String)listOpt.get("id");
	        int start = (Integer)listOpt.get("start");
	        	
	        	String sql = null;
	        	
	    	try {
	    		if (id != null) {
	    			
	    			sql = "select * from (select A.*,Rownum Rnum from(select num,id,writer,email,subject,password,reg_date,a.ref,re_step,re_level,readcount,content from board a ," 
	    					+ "(select ref from board where id = ?) b " 
	    					+ "where a.ref = b.ref order by a.ref desc,re_step)A ) where Rnum >= ? and Rnum <= ?";
	    			
	    			pstmt = conn.prepareStatement(sql);
	    			pstmt.setString(1, id);
	    			pstmt.setInt(2, start);
	    			pstmt.setInt(3, start + 9);

				}

				rs = pstmt.executeQuery();
				while (rs.next()) {
					BoardBean bean = new BoardBean();
					bean.setNum(rs.getInt(1));
					bean.setId(rs.getString(2));
					bean.setWriter(rs.getString(3));
					bean.setEmail(rs.getString(4));
					bean.setSubject(rs.getString(5));
					bean.setPassword(rs.getString(6));
					bean.setReg_date(rs.getDate(7).toString());
					bean.setRef(rs.getInt(8));
					bean.setRe_step(rs.getInt(9));
					bean.setRe_level(rs.getInt(10));
					bean.setReadcount(rs.getInt(11));
					bean.setContent(rs.getString(12));
					
					list.add(bean);
				}

				conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

			return list;
		} // end getBoardList
	

	public int getBoardListCount(HashMap<String, Object> listOpt) {
		getCon();

		int result = 0;
		String opt = (String) listOpt.get("opt"); // 검색옵션(제목, 내용, 글쓴이 등..)
		String condition = (String) listOpt.get("condition"); // 검색내용

		try {
			String sql = null;

			if (opt == null) // 전체글의 개수
			{
				sql = "select count(*) from board";
				pstmt = conn.prepareStatement(sql);

			} else if (opt.equals("0")) { // 제목으로 검색한 글의 개수

				sql = "select count(*) from board where subject like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + condition + '%');

			} else if (opt.equals("1")) { // 내용으로 검색한 글의 개수

				sql = "select count(*) from board where content like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + condition + '%');

			} else if (opt.equals("2")) // 제목+내용으로 검색한 글의 개수
			{
				sql = "select count(*) from board where subject like ? or content like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + condition + '%');
				pstmt.setString(2, '%' + condition + '%');

			} else if (opt.equals("3")) // 글쓴이로 검색한 글의 개수
			{
				sql = "select count(*) from board where writer like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + condition + '%');

			}

			rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt(1);

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	} // end getBoardListCount
	
	public int getBoardListCount2(HashMap<String, Object> listOpt) {
		getCon();

		int result = 0;
		
		String id=(String) listOpt.get("id");

		try {
				String sql = null;

				sql = "select count(*) from board where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				if (rs.next())
					result = rs.getInt(1);

				conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return result;
	} // end getBoardListCount

	// 글 여러개 삭제 : 체크박스 형태
	public int multiDelete(String[] num) {
		getCon();
		PreparedStatement pstmt = null;
		int res = 0;
		int[] cnt = null;

		try {

			String sql = "delete board where num=?";
			pstmt = conn.prepareStatement(sql);

			for (int i = 0; i < num.length; i++) {
				pstmt.setString(1, num[i]);

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
			if (num.length == res) {
				conn.commit();
			} else {
				conn.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return res;

	}

}
