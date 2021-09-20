package reservation.model;


public class ReservationBean {
	private int num; // 번호 : 예약 시 자동으로 num값 증가
	private String id; // 아이디
	private String name; // 예약자
	private String phone; // 핸드폰
	private String rdate; // 예약 날짜
	private String time; // 예약 시간
	private String people;// 인원 수
	private String place; // 촬영 장소 : 실내 or 야외
	private String service; // 촬영 방식 : 인물, 동물, 사물 등등
	private String info;
	
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getRdate() {
		return rdate;
	}
	
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
		
	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPeople() {
		return people;
	}
	
	public void setPeople(String people) {
		this.people = people;
	}
	
		
	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getService() {
		return service;
	}
	
	public void setService(String service) {
		this.service = service;
	}
	
	public String getInfo() {
		return info;
	}
	
	public void setInfo(String info) {
		this.info = info;
	}
	
	
}
