<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete - 회원탈퇴</title>
<script type="text/javascript" src="script/member.js"></script>
<style type="text/css">

.content{
	max-width:1200px;
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
	padding-left: 10px;
	padding-right: 10px;
}

</style>
</head>
<body>
<div class="wrap">
<!-- 최상단 : include(Header)  -->
	<jsp:include page="../include/userHeader.jsp" />
	
	<div class="content" align="center">
<h2>회원 탈퇴</h2>
<form action="memberDelete.do" method="post" name="user" onsubmit="return deleteCheck()">
<table>
		<tr height="50">
			<td align="center" width="150" style="background-color:#F2F2F2; font-weight: 700;">아이디</td>
			<td width="350"><%=request.getParameter("id") %></td>
		</tr>
		
		<tr height="50">
			<td align="center" width="150" style="background-color:#F2F2F2; font-weight: 700;">패스워드</td>
			<td width="350">
				<input type="password" name="password1" size="40">
				<input type="hidden" name="password" value="${mvo.password1 }">
			</td>
		</tr>
		<%-- <tr height="30">
				<td colspan="2"  align="center"style="background-color:#F2F2F2; font-weight: 700;">${message}</td>
		</tr> --%>
		<tr height="50">
			<td align="center" colspan="2">
				<input type="hidden" name="id" value="<%=request.getParameter("id")%>"> 
				<input type="submit" value="회원 탈퇴"> 
			</td>
		</tr>
		</table>
</form>
</div>
<jsp:include page="../include/userFooter.jsp" />
</div>
</body>
</html>