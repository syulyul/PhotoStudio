<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login(로그인 페이지)</title>
<script type="text/javascript" src="script/member.js"></script>
<style type="text/css">

.content{
	max-width:1200px;
	min-height: 800px;
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
	border-top: 1px solid;
	border-color: #c8c8c8;
	font-size: 14px;
}

</style>
</head>
<body>
<div class="wrap">
<!-- 최상단 : include(Header)  -->
	<jsp:include page="../include/userHeader.jsp" />
	
	<div class="content" align="center">
	<h2>로그인</h2><br>
	<form action="login.do" method="post" name="user" onsubmit="return loginCheck()">
		<table class="mytable">
			<tr height="70">
				<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">아이디</td>
				<td width="350" align="center">
					<input type="text" size="40" placeholder="아이디를 입력하세요" name="id" style="line-height:30px;">
				</td>
			</tr>
			<tr height="70">
				<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">비밀번호</td>
				<td width="350" align="center">
					<input type="password" size="40" name="password1" placeholder="비밀번호를 입력하세요" style="line-height:30px;">
				</td>
			</tr>
			<%-- <tr height="50">
				<td colspan="2"  align="center"style="background-color:#F2F2F2; font-weight: 700;">${message}</td>
			</tr> --%>
			<tr height="50">
				<td colspan="2" align="center">
					<input type="button" value="취소" onclick="location.href='main.jsp'">&nbsp;&nbsp;
					<input type="submit" value="로그인">&nbsp;&nbsp; 					
				</td>
			</tr>
		</table>
	</form>
	</div>
	
<jsp:include page="../include/userFooter.jsp" />
</div>	
</body>
</html>