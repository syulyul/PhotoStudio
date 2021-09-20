<%@page import="reservation.model.ReservationBean"%>
<%@page import="reservation.model.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReservationUpdateProc(예약 수정하기 - 완료 페이지)</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>

	<jsp:useBean id="rbean" class="reservation.model.ReservationBean">
		<jsp:setProperty name="rbean" property="*" />
	</jsp:useBean>

	<%
		int num = Integer.parseInt(request.getParameter("num"));
		
		String info=request.getParameter("info");
		info=info.replace("\r\n","<br>");
	
		// service값을 배열로 저장해 주어야 함
		String[] service=request.getParameterValues("service");
	
		// 배열에 있는 내용을 하나의 String으로 저장
		String textservice="";	
		
		for(int i=0; i<service.length; i++){
			textservice+=service[i]+",";
		}
		
		// 배열의 마지막 특문(,) 제거하여 다시 rservice에 저장
		String rservice=textservice.replaceAll(",$", "");
		
		rbean.setService(rservice);
		
		ReservationDAO rdao = new ReservationDAO();
		
		// rbean1에는 수정하기 전의 값이 들어 있음
		ReservationBean rbean1 = rdao.oneSelectReservation(num);

		// num(고유값) 비교 : 동일할 때 수정
		if (rbean.getNum() == (rbean1.getNum())) {
			
			// 수정된 값 rbean을 넣어서 작동
			rdao.updateReservation(rbean);
	%>	
	<script type="text/javascript">
		alert("예약이 변경되었습니다.");
		location.href="ReservationUpdateResult.jsp?num=<%=num%>";
	</script>
					
	<%
		//response.sendRedirect("ReservationUpdateResult.jsp");
		} else {
	%>
	 <!-- 무조건 num값이 일치하게 해놔서, 사실상 쓸모 없음 -->
	<script type="text/javascript">
		alert("패스워드가 맞지 않습니다. 다시 확인해 주세요");
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>