<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_admin(관리자 로그인 페이지)</title>
<style type="text/css">
.content{
	transition:0.3s;
	position: absolute;
	left:50%;
	top:40%;
	transform: translate(-50%,-50%);
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
	left:50%;
	top:87%;
	transform: translate(-50%,-50%);
}
button:focus {
	outline:0;
}
button:hover{
	background: darkgray;
	cursor: pointer;
}
</style>
</head>
<body>
<c:if test="${empty loginUser }">
	<div class="content" align="center">
	<h2>로그인</h2><br>
	<form action="../login_damin.do" method="post" name="user">
		<table style="background-color:lightgray;border-radius: 20px;" width="370" height="220">
			<tr height="60">
				<td width="100" align="center" style="font-weight: 700;">아이디</td>
				<td width="240" align="center">
					<input type="text" size="28" placeholder="아이디를 입력하세요" name="id"
						style="border: 1px solid lightgray;border-radius: 20px;height:40px;padding-left:10px;">
				</td>
			</tr>
			<tr height="35">
				<td width="100" align="center" style="font-weight: 700;">비밀번호</td>
				<td width="240" align="center">
					<input type="password" size="28" name="password" placeholder="비밀번호를 입력하세요" 
						style="border: 1px solid lightgray;border-radius: 20px;height:40px;padding-left:10px;">
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
</c:if>
<c:if test="${!empty loginUser }">
	<%
		response.sendRedirect("../index.jsp");
	%>
</c:if>
</body>
</html>