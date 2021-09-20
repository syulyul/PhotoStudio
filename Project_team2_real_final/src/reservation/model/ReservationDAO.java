package reservation.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class ReservationDAO {
	String id = "scott";
	String pass = "tiger";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	// 데이터 베이스 연결
	public void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 예약 정보 입력
	public void insertReservation(ReservationBean rbean) {

		try {
			getConnection();
			String sql = "insert into reservation values(num_seq.nextval,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rbean.getId());
			pstmt.setString(2, rbean.getName());
			pstmt.setString(3, rbean.getPhone());
			pstmt.setString(4, rbean.getRdate().toString());
			pstmt.setString(5, rbean.getTime().toString());
			pstmt.setString(6, rbean.getPeople());
			pstmt.setString(7, rbean.getPlace());
			pstmt.setString(8, rbean.getService());
			pstmt.setString(9, rbean.getInfo());

			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	// 전체 예약 리스트_관리자용
	public List allSelectReservation(ReservationBean reservationVO) {
        List<ReservationBean> reservationList = new ArrayList<ReservationBean>();
        String rname = reservationVO.getName();
        String rphone = reservationVO.getPhone();
        
        getConnection();
        
        try {
           
        	String sql = "SELECT num,id,name,SUBSTR(phone, 1, 3) || '-' || SUBSTR(phone, 4, 4) || '-' || SUBSTR(phone, 8) as phone,rdate,time,people,place,service,info FROM reservation order by rdate asc";
        	
			if ((rname != null && rname.length() != 0 && rphone != null && rphone.length() != 0)) {
				sql = "SELECT num,id,name,SUBSTR(phone, 1, 3) || '-' || SUBSTR(phone, 4, 4) || '-' || SUBSTR(phone, 8) as phone,rdate,time,people,place,service,info FROM reservation where name=? and phone=? order by rdate asc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, rname);
				pstmt.setString(2, rphone);
            }else {
                pstmt = conn.prepareStatement(sql);
            }
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
            	int num = rs.getInt("num");
            	String id = rs.getString("id");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String rdate = rs.getString("rdate");
				String time = rs.getString("time");
				String people = rs.getString("people");
				String place = rs.getString("place");
				String service = rs.getString("service");
				String info = rs.getString("info");
            	
            	ReservationBean vo = new ReservationBean();
            	vo.setNum(num);
            	vo.setId(id);
				vo.setName(name);
				vo.setPhone(phone);
				vo.setRdate(rdate);
				vo.setTime(time);
				vo.setPeople(people);
				vo.setPlace(place);
				vo.setService(service);
				vo.setInfo(info);
				
				reservationList.add(vo);
            }
            rs.close();
            pstmt.close();
            conn.close();
            
        }catch (Exception e) {
            e.printStackTrace();
        }
        return reservationList;
    }

	
	
	
	// 예약 조회_고객용
	// 전화번호 입력 > sql에서 맞는값을 조회 후 List 값으로 출력
	// (일치하는 전화번호 없을 시 값이 없는 것으로 입출력되기에, 페이지에서는 공백으로 출력)
	public List listReservation(ReservationBean reservationVO) {
		List<ReservationBean> reservationList = new ArrayList<ReservationBean>();
		String rname = reservationVO.getName();
		String rphone = reservationVO.getPhone();
		
		try {
			getConnection();
			// sql 조회시 폰번호(xxx-xxxx-xxxx형태로 출력 > 컬럼명을 phone로 치환)
			String sql = "SELECT num,name,SUBSTR(phone, 1, 3) || '-' || SUBSTR(phone, 4, 4) || '-' || SUBSTR(phone, 8) as phone,rdate,time,people,place,service,info FROM reservation where name=? and phone=? order by rdate asc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rname);
			pstmt.setString(2, rphone);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String rdate = rs.getString("rdate");
				String time = rs.getString("time");
				String people = rs.getString("people");
				String place = rs.getString("place");
				String service = rs.getString("service");
				String info = rs.getString("info");

				ReservationBean vo = new ReservationBean();
				vo.setNum(num);
				vo.setName(name);
				vo.setPhone(phone);
				vo.setRdate(rdate);
				vo.setTime(time);
				vo.setPeople(people);
				vo.setPlace(place);
				vo.setService(service);
				vo.setInfo(info);
				
				reservationList.add(vo);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return reservationList;
	}
	
	
	
	// id(고유값)을 활용하여 정보 출력 : 마이페이지에서 활용
	public List idSelectReservation(ReservationBean reservationVO) {
		List<ReservationBean> reservationList = new ArrayList<ReservationBean>();
		String id = reservationVO.getId();
							
		try {
			getConnection();
			// sql 조회시 폰번호(xxx-xxxx-xxxx형태로 출력 > 컬럼명을 phone로 치환)
			String sql = "SELECT num,name,SUBSTR(phone, 1, 3) || '-' || SUBSTR(phone, 4, 4) || '-' || SUBSTR(phone, 8) as phone,rdate,time,people,place,service,info FROM reservation where id=? order by rdate asc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String rdate = rs.getString("rdate");
				String time = rs.getString("time");
				String people = rs.getString("people");
				String place = rs.getString("place");
				String service = rs.getString("service");
				String info = rs.getString("info");

				ReservationBean vo = new ReservationBean();
				vo.setNum(num);
				vo.setName(name);
				vo.setPhone(phone);
				vo.setRdate(rdate);
				vo.setTime(time);
				vo.setPeople(people);
				vo.setPlace(place);
				vo.setService(service);
				vo.setInfo(info);
					
				reservationList.add(vo);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return reservationList;
	}
	
	
	
	
	
	// num(고유값)을 활용하여 정보 출력
	public ReservationBean oneSelectReservation(int num) {
		ReservationBean rbean=new ReservationBean();
						
		try {
			getConnection();
			String sql="select * from reservation where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				rbean.setNum(rs.getInt(1));
				rbean.setId(rs.getString(2));
				rbean.setName(rs.getString(3));
				rbean.setPhone(rs.getString(4));
				rbean.setRdate(rs.getString(5));
				rbean.setTime(rs.getString(6));
				rbean.setPeople(rs.getString(7));
				rbean.setPlace(rs.getString(8));
				rbean.setService(rs.getString(9));
				rbean.setInfo(rs.getString(10));
			}
			
			//conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return rbean;
	}
	
	
	// num(고유값)을 활용하여 정보 출력
	// 전화번호 출력시 - 추가
	public ReservationBean oneSelectReservation1(int num) {
		ReservationBean rbean=new ReservationBean();
							
		try {
			getConnection();
			String sql="SELECT num,name,SUBSTR(phone, 1, 3) || '-' || SUBSTR(phone, 4, 4) || '-' || SUBSTR(phone, 8) as phone,rdate,time,people,place,service,info FROM reservation where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
				
			if(rs.next()) {
				rbean.setNum(rs.getInt(1));
				rbean.setName(rs.getString(2));
				rbean.setPhone(rs.getString(3));
				rbean.setRdate(rs.getString(4));
				rbean.setTime(rs.getString(5));
				rbean.setPeople(rs.getString(6));
				rbean.setPlace(rs.getString(7));
				rbean.setService(rs.getString(8));
				rbean.setInfo(rs.getString(9));
			}
				
				//conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
			
			return rbean;
		}
		
		
		
	
	// 예약 수정 : num 값을 비교하여 일치하는 데이터 수정
	public void updateReservation(ReservationBean rbean1) {
		
		try {
			getConnection();
			String sql="update reservation set name=?,phone=?,rdate=?,time=?,people=?,place=?,service=?,info=? where num=?";
			pstmt = conn.prepareStatement(sql);				
			
			pstmt.setString(1, rbean1.getName());
			pstmt.setString(2, rbean1.getPhone());
			pstmt.setString(3, rbean1.getRdate().toString());
			pstmt.setString(4, rbean1.getTime().toString());
			pstmt.setString(5, rbean1.getPeople());
			pstmt.setString(6, rbean1.getPlace());
			pstmt.setString(7, rbean1.getService());
			pstmt.setString(8, rbean1.getInfo());
			
			pstmt.setInt(9, rbean1.getNum());
	
			pstmt.executeUpdate();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

		
	// 예약 삭제 : num 값을 비교하여 일치하는 데이터 삭제
	public void deleteReservation(ReservationBean rbean1) {
			
		try {
			getConnection();
			String sql="delete reservation where num=? and name=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rbean1.getNum());
			pstmt.setString(2, rbean1.getName());
			pstmt.setString(3, rbean1.getPhone());
	
			pstmt.executeUpdate();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 글 여러개 삭제 : 체크박스 형태
	public int multiDelete(String[] num) {
		getConnection();
		PreparedStatement pstmt=null;
		int res=0;
		int[] cnt=null;
		
		try {			
			
			String sql="delete reservation where num=?";
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<num.length; i++) {
				pstmt.setString(1, num[i]);
				
				// 쿼리문 pstmt에 모두 쌓아 한번에 처리
				pstmt.addBatch();
			}
			
			cnt=pstmt.executeBatch();
			
			//쿼리 성공 : -2			
			for(int i=0; i<cnt.length; i++) {
				if(cnt[i]==-2) {
					res++;
				}
			}
			
			//모아둔 쿼리 실행 끝나면 커밋
			if(num.length==res) {
				conn.commit();
			}else {
				conn.rollback();
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return res;
		
	}
	
	
	// 예약 수정, 삭제를 위한 예약 된 정보 체크 (num(고유값)과  예약자 정보 확인)
	public ReservationBean getReservationVO(int num, String name, String phone) {		
		ReservationBean rbean1=new ReservationBean();
						
		try {
			getConnection();
			String sql="select num,name,phone from reservation where num=? and name=? and phone=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			
			rs=pstmt.executeQuery();
			if(rs.next()){					
				rbean1.setNum(rs.getInt(1));
				rbean1.setName(rs.getString(2));
					rbean1.setPhone(rs.getString(3));
			}
			
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rbean1;
			
			
	}
	
/*
	// 삭제를 위한 예약 된 정보 체크 (날짜, 시간을 비교하여 삭제)
	// num(고유값), 이름, 전화번호로 비교하는 메서드를 사용하여 지금 사용 안함
	public ReservationBean getReservationVO1(String rdate, String time) {		
		ReservationBean rbean1=new ReservationBean();
					
		try {
			getConnection();
			String sql="select name,SUBSTR(phone, 1, 3) || '-' || SUBSTR(phone, 4, 4) || '-' || SUBSTR(phone, 8) as phone,rdate,time from reservation where rdate=? and time=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rdate);
			pstmt.setString(2, time);
			
			rs=pstmt.executeQuery();
	
			if(rs.next()){											
				rbean1.setName(rs.getString(1));
				rbean1.setPhone(rs.getString(2));
				rbean1.setRdate(rs.getString(3));
				rbean1.setTime(rs.getString(4));
			}
			
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rbean1;				
	}
*/	
	
	
	
	
	
	
	
	
	/*	
	// 예약 수정, 삭제를 위한 예약 된 정보 체크 (시간, 인원을 통한 예약자 정보 확인)
		// 날짜,시간의 PK값을 안준다면 다른사람의 결과도 나올 수 있으니, 이름, 전화번호를 추가할 것((String name, String phone)
		// sql에서의 조회 부분도 name=? and phone=? 추가
		public ReservationBean getReservationVO( String name, String phone, String rdate, String time) {		
				ReservationBean rbean1=new ReservationBean();
							
				try {
					getConnection();
					String sql="select name,SUBSTR(phone, 1, 3) || '-' || SUBSTR(phone, 4, 4) || '-' || SUBSTR(phone, 8) as phone,rdate,time from reservation where rdate=? and time=?";
					pstmt = conn.prepareStatement(sql);
					//pstmt.setString(1, name);
					//pstmt.setString(2, phone);
					pstmt.setString(1, rdate);
					pstmt.setString(2, time);
					
					rs=pstmt.executeQuery();
			
					if(rs.next()){							
						//rbean1.setName(name);
						rbean1.setName(rs.getString(1));
						rbean1.setPhone(rs.getString(2));
						rbean1.setRdate(rs.getString(3));
						rbean1.setTime(rs.getString(4));
					}
					
					conn.close();
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				return rbean1;				
			}
*/
	


/*
	// 전화번호 입력 > 전체 예약 현황 확인
	public List listReservation(ReservationBean reservationVO) {
		List<ReservationBean> reservationList = new ArrayList<ReservationBean>();
		String rphone = reservationVO.getPhone();

		try {
			getConnection();
			String sql = "select * from reservation";
			if ((rphone != null && rphone.length() != 0)) {
				sql += " where phone=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, rphone);
			} else {
				pstmt = conn.prepareStatement(sql);
			}
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String rdate = rs.getString("rdate");
				String time = rs.getString("time");
				String people = rs.getString("people");
				String place = rs.getString("place");
				String service = rs.getString("service");
				String info = rs.getString("info");

				ReservationBean vo = new ReservationBean();
				vo.setName(name);
				vo.setPhone(phone);
				vo.setRdate(rdate);
				vo.setTime(time);
				vo.setPeople(people);
				vo.setPlace(place);
				vo.setService(service);
				vo.setInfo(info);
				
				reservationList.add(vo);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return reservationList;
	}
*/
	
	
}
