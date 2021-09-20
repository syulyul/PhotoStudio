<%@page import="reservation.model.ReservationBean"%>
<%@page import="reservation.model.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReservationUpdateForm(예약 수정하기)</title>
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

	// num(고유값)을 이용. oneSelectReservation를 활용해 모든 예약 정보 출력
	int num = Integer.parseInt(request.getParameter("num"));
	
	ReservationDAO rdao = new ReservationDAO();
	ReservationBean rbean = rdao.oneSelectReservation(num);
	
	
%>
<div class="wrap">

<!-- 최상단 : include(Header)  -->
<jsp:include page="include/userHeader.jsp" />

<div class="content" align="center">
	<h2>예약 수정하기</h2><br>
<form action="ReservationUpdateProc.jsp" method="post">
	<table width="500">
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">이름</td>
			<td width="350" align="center">
				<input type="text" name="name" size="40" value="<%=rbean.getName() %>" required>
				<%-- <input type="text" name="name" size="40" value="<%=rbean.getName() %>" style="background-color: #e2e2e2;" readonly required> --%>
			</td>			
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">전화번호</td>
			<td width="350" align="center">
				<input type="tel" id="phone" name="phone" size="40" maxlength="11" value="<%=rbean.getPhone() %>" required>
				<%-- <input type="tel" id="phone" name="phone" size="40" maxlength="11" value="<%=rbean.getPhone() %>" style="background-color: #e2e2e2;" readonly required> --%>
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">날짜</td>
			<td width="350" align="center">
				<input type="date" name="rdate" size="40" value="<%=rbean.getRdate() %>" required>
			</td>	
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">시간</td>
			<td width="350" align="center">
				<input type="time" name="time" size="40" value="<%=rbean.getTime() %>" required>
			</td>	
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">인원</td>
			<td width="350" align="center">
				<input type="text" name="people" size="40" value="<%=rbean.getPeople() %>" required>
			</td>	
		</tr>
		<!-- input 타입이라 기존값을 바로 출력해주지 못하는 문제 발생(그냥 편의기능이라 없어도 되긴 함) -->
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">촬영 장소</td>
			<td width="350" align="center">
				<input type="radio" name="place" value="실내" required>실내&nbsp;
				<input type="radio" name="place" value="실외" required>실외&nbsp;
			</td>
		</tr>
		<!-- input 타입이라 기존값을 바로 출력해주지 못하는 문제 발생(그냥 편의기능이라 없어도 되긴 함) -->
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">촬영 방식</td>
			<td width="350" align="center">
				<input type="checkbox" name="service" value="인물" checked>인물&nbsp;
				<input type="checkbox" name="service" value="동물">동물&nbsp;
				<input type="checkbox" name="service" value="사물">사물&nbsp;				
			</td>
		</tr>
		<!-- Null입력을 없애기는 했음 : 하지만 공백(띄워쓰기)이 입력되는 문제 발생 -->
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">메모</td>
			<td width="350" align="center">
				<textarea rows="5" cols="40" name="info"><% if(rbean.getInfo() == null){}else{out.print(rbean.getInfo());}%></textarea>			
			</td>
		</tr>
		<tr height="80">
			<td align="center" colspan="2" style="border:none;">
				<input type="hidden" name="num" value="<%=rbean.getNum()%>">
				<input type="button" value="취소" onclick="history.back(-1)">&nbsp;&nbsp;					
				<!-- <input type="reset" value="다시 작성">&nbsp;&nbsp;	 -->
				<input type="submit" value="수정하기">
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