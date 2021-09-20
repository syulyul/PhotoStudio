<%@page import="reservation.model.ReservationBean"%>
<%@page import="reservation.model.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReservationUpdateResult(예약 변경 결과 표시)</title>
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

	// 넘겨받은 날짜, 시간 정보를 이용. oneSelectReservation를 활용해 모든 예약 정보 출력
	int num = Integer.parseInt(request.getParameter("num"));
	
	
	ReservationDAO rdao = new ReservationDAO();
	ReservationBean rbean = rdao.oneSelectReservation1(num);
	
	/* int rnum=rbean.getNum();
	String rname=rbean.getName();
	String rphone=rbean.getPhone(); */
	
%>
<div class="wrap">

<!-- 최상단 : include(Header)  -->
<jsp:include page="include/userHeader.jsp" />

<div class="content" align="center">
	<h2>변경된 예약 확인하기</h2><br>
<form action="ReservationForm.jsp" method="post">
	<table width="500">
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">이름</td>
			<td width="350" align="center"><%=rbean.getName() %></td>		
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">전화번호</td>
			<td width="350" align="center"><%=rbean.getPhone() %></td>
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">날짜</td>
			<td width="350" align="center"><%=rbean.getRdate() %></td>	
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">시간</td>
			<td width="350" align="center"><%=rbean.getTime() %></td>	
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">인원</td>
			<td width="350" align="center"><%=rbean.getPeople() %></td>	
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">촬영 장소</td>
			<td width="350" align="center"><%=rbean.getPlace() %></td>
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">촬영 방식</td>
			<td width="350" align="center"><%=rbean.getService() %></td>
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">메모</td>
			<td width="350" align="center">
			
		<%	
			if(rbean.getInfo() == null){
				out.print("");
			}else{
				String info=rbean.getInfo();
				info=info.replace("\r\n","<br>");
				out.print(info);
			}			
		 %>
			</td>
		</tr>
		<tr height="80">
			<td align="center" colspan="2" style="border-style:none;">
				<%-- <input type="hidden" name="name" value="<%=rbean.getName()%>">
				<input type="hidden" name="phone" value="<%=rbean.getPhone()%>"> --%>
				<input type="submit" value="예약화면으로 돌아가기">
			</td>
		</tr>
	</table>
</form>
</div>

<!-- 최하단 : include(Footer)  -->
<jsp:include page="include/userFooter.jsp" />
</div>
</body>
</html>