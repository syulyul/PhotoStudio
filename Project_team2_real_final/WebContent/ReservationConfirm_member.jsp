<%@page import="java.util.List"%>
<%@page import="reservation.model.ReservationDAO"%>
<%@page import="reservation.model.ReservationBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReservationConfirm_member</title>
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

		String id = request.getParameter("id");
		ReservationBean reservationVO = new ReservationBean();		
		reservationVO.setId(id);

		ReservationDAO rdao = new ReservationDAO();
		List reservationList = rdao.idSelectReservation(reservationVO);
		
	%>	

<div class="wrap">

<!-- 최상단 : include(Header)  -->
<jsp:include page="include/userHeader.jsp" />
	<div class="content" align="center">

		<h2>
			<%=id%>회원님의 예약 내용
		</h2><br>
		<table width="1150" border="1">
			<tr height="40" style="background-color: #F2F2F2; font-weight: 700;">
				<td width="150" align="center">이름</td>
				<td width="250" align="center">전화번호</td>
				<td width="150" align="center">날짜</td>
				<td width="150" align="center">시간</td>
				<td width="150" align="center">인원</td>
				<td width="150" align="center">촬영장소</td>
				<td width="150" align="center">촬영방식</td>
				<td width="300" align="center">메모</td>
				<td width="100" align="center">변경</td>
				<td width="100" align="center">취소</td>
			</tr>
			<%
				for (int i = 0; i < reservationList.size(); i++) {
					ReservationBean vo = (ReservationBean) reservationList.get(i);
					int num = vo.getNum();
					String name = vo.getName();
					String phone = vo.getPhone();
					String rdate = vo.getRdate();
					String time = vo.getTime();
					String people = vo.getPeople();
					String place = vo.getPlace();
					String service = vo.getService();
					String info = vo.getInfo();
			%>

			<tr height="40" align="center">
				<td><%=name%></td>
				<td><%=phone%></td>
				<td><%=rdate%></td>
				<td><%=time%></td>
				<td><%=people%></td>
				<td><%=place%></td>
				<td><%=service%></td>
				<td>
					<%	
					if(info == null){
						out.print("");
					}else{
						info=info.replace("\r\n","<br>");
						out.print(info);						
					}			
				 %>
				</td>
				<td>
					<form action="ReservationUpdateForm.jsp" method="post">
						<input type="hidden" name="num" value="<%=num%>">						
						<input type="submit" value="변경">
					</form>
				</td>
				<td>
					<form action="ReservationDeleteForm.jsp" method="post">
						<input type="hidden" name="num" value="<%=num%>">						
						<input type="submit" value="취소">
					</form>
				</td>
			</tr>
			<%
				}
			%>

			<tr height="150">
				<td align="center" colspan="10">만일, 예약하신 내역이 나오지 않고 있다면<br>
						사무실로 연락주시면 도와드리겠습니다.<br> <br>
					<br>
					<input type="button" value="확인" onclick="history.back(-1)">
				</td>
			</tr>
		</table>
	</div>
<!-- 최하단 : include(Footer)  -->
<jsp:include page="include/userFooter.jsp" />
</div>	



</body>
</html>