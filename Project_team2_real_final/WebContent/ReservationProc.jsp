<%@page import="reservation.model.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReservationProc(예약 완료 페이지)</title>
<style type="text/css">

.content{
	max-width:1200px;
	min-height: 850px;
	height:auto;
	/* margin : 상, 좌우, 하 */
	margin : 30px auto 150px;	
	padding-top: 100px;
}

.content > h2 {
	font-size: 25px;
	color: #494949;
}

table td {
	border: 1px solid;	
	border-color: #c8c8c8;
	font-size: 14px;
}

</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String rdate=request.getParameter("rdate");
	String time=request.getParameter("time");
	String people=request.getParameter("people");
	String place=request.getParameter("place");
	String info=request.getParameter("info");
	
	// textarea 방식에서 줄바꿈 적용
	info=info.replace("\r\n","<br>");

	String[] service=request.getParameterValues("service");
	
	// 배열에 있는 내용을 하나의 String으로 저장
	String textservice="";	
	
	for(int i=0; i<service.length; i++){
		textservice+=service[i]+",";
	}
	
	// 배열의 마지막 특문(,) 제거하여 다시 rservice에 저장
	String rservice=textservice.replaceAll(",$", "");
%>	

<jsp:useBean id="rbean" class="reservation.model.ReservationBean">
	<jsp:setProperty name="rbean" property="*"/>
</jsp:useBean>


<%	
	rbean.setService(rservice);
	ReservationDAO rdao=new ReservationDAO();
	rdao.insertReservation(rbean);
	
%>
<!-- 최상단 : include(Header)  -->
<jsp:include page="include/userHeader.jsp" />

<!-- 예약 완료 후 예약 내용 출력 -->
<div class="content" align="center">
<h2><%out.println(name); %>님의 예약 내용</h2><br>
	<table width="1150">
		<tr height="50" style="background-color: #F2F2F2; font-weight: 700;">
			<td width="150" align="center">이름</td>
			<td width="250" align="center">전화번호</td>
			<td width="150" align="center">날짜</td>
			<td width="150" align="center">시간</td>
			<td width="150" align="center">인원</td>
			<td width="150" align="center">촬영장소</td>
			<td width="150" align="center">촬영방식</td>
			<td width="300" align="center">메모</td>
		</tr>
		<tr height="50" align="center">
			<td><%out.println(name); %></td>			
			<td><%out.println(phone); %></td>			
			<td><%out.println(rdate); %></td>			
			<td><%out.println(time); %></td>			
			<td><%out.println(people); %></td>			
			<td><%out.println(place); %></td>			
			<td><%out.println(rservice); %></td>
			<td><%out.println(info); %></td>		
		</tr>
		<tr height="80">
			<td align="center" colspan="8" style="border:none;">
				<input type="button" value="확인" onclick="location.href='main.jsp'">
			</td>
		</tr>
	</table>
</div>
<!-- 최하단 : include(Footer)  -->
<jsp:include page="include/userFooter.jsp" />

</body>
</html>