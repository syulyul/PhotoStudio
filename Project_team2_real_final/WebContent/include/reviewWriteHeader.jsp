<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* 글씨체 등 수정 */
/* * {
	margin:0;
	padding:0;
	color:#000;
	/* font-family: 'ZCOOL QingKe HuangYou', cursive;
	box-sizing: border-box;
}
 */

header {
	/* 메뉴바 상단고정 */
	position: fixed;
	top: 0;
	/* 중앙정렬을 위한 값 */
	left: 50%;
    transform: translate(-50%, 0);
    /* 배경색 및 투명도 */
    background-color: #ffffff;
    filter: alpha(opacity=70);
	opacity: 0.7;
	
	margin: auto;
	width: 1200px;
	height:auto;
	display: flex;
	/* align-items: center;
	justify-content: center; */
	/* justify-content: space-between; */
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
	outline: none;
}

a:link {
	color: black;
}

a:visited {
	color: black;
}

a:hover {
  color : black;
}

a:active {
  color : black;
}

/* 
header > nav {
	width:1280px;
	height:100%;
}
 */

.top_logo {
	flex: 0.5;
	/* width: 10%; */
	/* margin-top: 20px; */
}

.top_menu_left {
	flex: 6.5;
	/* width: 60%; */
	/* height: 100%; */
	margin-top: 35px;
	
	
	/* justify-content: space-between; */
}

.top_menu_left ul > li > a {
	text-decoration: none;
	outline: none;
}

.top_menu_left ul > li {
	font-size:15px;
	/* height: 100%; */
	float: left;
	margin-left: 45px;
	/* display: inline-block; */
	/* align-items: center; */
	text-align:center;
}

.top_menu_right {	
	flex: 3;
	float: right;
	/* width: 25%; */
	height: 100%;
	/* float: right; */
	/* margin-top: 20px; */
	margin-top: 30px;/* 
	margin-left: 150px; */	
	/* justify-content: space-between; */
}


.top_menu_right ul > li {	
	height: 100%;
	/* float: left; */
	margin-left: 25px;
	display: inline-block;
	/* align-items: center; */
}


</style>
</head>
<body>
	<header>
		<div class="top_logo">
			<div>
				<a href="main.jsp"><img src="images/top_logo.png" /></a>
			</div>
		</div>
		<!-- <nav> -->
			<div class="top_menu_left">
				<ul>
					<li><a href="introduce.jsp">회사 소개</a></li>
					<li><a href="ReservationForm.jsp">예약</a></li>
					<li><a href="BoardList.jsp">문의</a></li>
					<li><a href="ReviewList.jsp">이용후기</a></li>
					<li><a href="NoticeBoardList.jsp">공지사항</a></li>
				</ul>
			</div>
			<c:if test="${empty loginUser }">
				<div class="top_menu_right">
					<ul>
						<li><a href="login.do"><img src="images/login.png" height="35px" /></a></li>
						<li><a href="join.do"><img src="images/join.png" height="35px" /></a></li>
						<li><a href="javascript:alert('회원 전용 서비스입니다');">
							<img src="images/mypage.png" height="35px" /></a></li>
					</ul>
				</div>
			</c:if>
			<c:if test="${!empty loginUser }">
				<div class="top_menu_right">
					<ul>
						<li style="font-weight: 700;font-size:15px;">${loginUser.id}님</li>
						<li><a href="logout.do"><img src="images/logout.png" height="35px" /></a></li>
						<li><a href="memberCheck.do?id=${loginUser.id}">
							<img src="images/mypage.png" height="35px" /></a></li>
					</ul>
				</div>
			</c:if>
		<!-- </nav> -->
	</header>
</body>
</html>