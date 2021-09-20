<%@page import="reservation.model.ReservationBean"%>
<%@page import="reservation.model.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReservationUpdateProc(예약 취소하기 - 완료 페이지)</title>
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
		
		ReservationDAO rdao = new ReservationDAO();
		
		// rbean1에는 수정한 값이 들어 있음
		ReservationBean rbean1 = rdao.oneSelectReservation(num);

		// num(고유값) 비교 : 동일할 때 수정
		if (rbean.getNum() == (rbean1.getNum())) {
			
			// 삭제할 값 rbean(기존값)을 넣어서 작동
			rdao.deleteReservation(rbean1);
	%>	
	<script type="text/javascript">
		alert("예약이 취소되었습니다.");
		location.href="ReservationForm.jsp";
	</script>
							
	<%
		//response.sendRedirect("ReservationUpdateResult.jsp");
		} else {
	%>
	<!-- 무조건 값이 일치하게 해놔서, 사실상 쓸모 없음 -->
	<script type="text/javascript">
		alert("패스워드가 맞지 않습니다. 다시 확인해 주세요");
		history.go(-1);
	</script>

	<%
		}
	%>

</body>
</html>