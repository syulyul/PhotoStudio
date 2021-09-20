<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
   request.setCharacterEncoding("utf-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/style.css">
		
</head>
<body>
	<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<!-- <div class="custom-menu">
					<button type="button" id="sidebarCollapse" class="btn btn-primary">
	        </button>
        </div> -->
	  		<div class="img bg-wrap text-center py-4" style="background-color:gray;">
	  			<div class="user-logo">
	  				<div class="img" style="background-image: url(images/logo.png);"></div>
	  				<div style="font-weight:bold; font-size:22px;">관리자</div>
	  			</div>
	  		</div>
	  		
			<ul class="list-unstyled components mb-5">
				<c:if test="${empty loginAdmin }">
	  				<li class="active"><a href="admin/member/Login_admin.jsp">Home</a></li>
					<li><a href="#"> 회원 관리</a></li>
					<li><a href="#"> 예약 관리</a></li>
					<li><a href="#"> 공지사항 관리</a></li>
					<li><a href="#"> 문의 게시판 관리</a></li>
					<li><a href="#"> 이용후기 게시판 관리</a></li>
	  			</c:if>
				<c:if test="${!empty loginAdmin }">
					<li class="active"><a href="index.jsp?pageChange=main.jsp">Home</a></li>
					<li><a href="index.jsp?pageChange=MemberList_admin.jsp"> 회원 관리</a></li>
					<li><a href="index.jsp?pageChange=ReservationList_admin.jsp"> 예약 관리</a></li>
					<li><a href="index.jsp?pageChange=NoticeBoardList_admin.jsp"> 공지사항 관리</a></li>
					<li><a href="index.jsp?pageChange=BoardList_admin.jsp"> 문의 게시판 관리</a></li>
					<li><a href="index.jsp?pageChange=ReviewList_admin.jsp"> 이용후기 게시판 관리</a></li>
				</c:if>
			</ul>

		</nav>

   		<div id="content" class="p-4 p-md-5 pt-5">
			<%
				String select = request.getParameter("pageChange");

				if (select == null) {
					select = "main.jsp";
				}
			%>

			<%-- <jsp:include page="index.jsp" flush="false" /> --%>
			<jsp:include page="<%=select%>" flush="false" />
      	</div>
	</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>