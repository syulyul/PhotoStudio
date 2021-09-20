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
<title>Insert title here</title>
<style type="text/css">
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
.content{
	transition:0.3s;
	position: absolute;
	left:60%;
	top:40%;
	transform: translate(-50%,-50%);
}
input:focus {
	  outline:none;
  box-shadow: 0px 0px 2px 0px;
}
button{
	width:120px;
	height: 40px;
	color:#fff;
	background: gray;
	font-size: 16px;
	border:none;
	border-radius: 20px;
	transition:0.3s;
	position: absolute;
	top:85%;
	transform: translate(-50%,-50%);
	
}
button:focus {
	outline:0;
}
button:hover{
	background: darkgray;
	cursor: pointer;
}

.admin{
	transition:0.3s;
	position: absolute;
	left:60%;
	top:40%;
	transform: translate(-50%,-50%);
}

</style>

</head>
<body>
	<c:if test="${empty loginAdmin }">
		<div class="content" align="center">
			<h2>관리자 로그인</h2>
			<br>
			<!-- <form action="../login_admin.do" method="post" name="user"> --> <!-- 해당 부분은 컴퓨터 환경에 따라 조율 하여 사용하세요 /양혜인 컴에서는 해당 부분이 맞지않음-->
			<form action="login_admin.do" method="post" name="user">
				<table style="background-color: lightgray; border-radius: 20px;"
					width="370" height="200">
					<tr height="50">
						<td width="100" align="center" style="font-weight: 700;">아이디</td>
						<td width="240" align="center"><input type="text" size="28"
							placeholder="아이디를 입력하세요" name="id"
							style="border: 1px solid lightgray; border-radius: 20px; height: 40px; padding-left: 10px;">
						</td>
					</tr>
					<tr height="30">
						<td width="100" align="center" style="font-weight: 700;">비밀번호</td>
						<td width="240" align="center"><input type="password"
							size="28" name="password" placeholder="비밀번호를 입력하세요"
							style="border: 1px solid lightgray; border-radius: 20px; height: 40px; padding-left: 10px;">
						</td>
					</tr>
					<tr height="50">
						<td colspan="2" align="center">
							<button type="submit" value="로그인">로그인</button>
						</td>
					</tr>
				</table>
			</form>
		</div>		

		<!-- <div class="top_menu_right">
			<ul>
				<li><a href="login.do"><img src="images/login.png"
						height="35px" /></a></li>
				<li><a href="join.do"><img src="images/join.png"
						height="35px" /></a></li>
				<li><a href="javascript:alert('회원 전용 서비스입니다');"> <img
						src="images/mypage.png" height="35px" /></a></li>
			</ul>
		</div> -->
		
	</c:if>
	<c:if test="${!empty loginAdmin }">
			<div class="admin" align="center">
				<h1 align="center">관리자 페이지 입니다</h1>
				
						<div style="font-size:40px">${loginAdmin.id}님
							<button type="button" onclick="location.href='../logout_admin.do'"
								style="border-radius: 20px;transition:0.3s;position: absolute;
								left:90%;top:74%;transform: translate(-50%,-50%);">로그아웃</button>
						</div>
				</div>
			</c:if>
</body>
</html>