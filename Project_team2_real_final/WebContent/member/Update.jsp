<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberUpdate</title>
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
}

</style>

</head>
<body>
<div class="wrap">
	<jsp:include page="../include/userHeader.jsp" />
	<div class="content" align="center">
	<h2>회원 정보 수정하기</h2><br>
        
        <form action="memberUpdate.do" method="post" name="user" onsubmit="return updateCheck()">
	<table>
		<tr height="50"><!-- 이름과 아이디는 수정 불가 -> readonly -->
			<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">이름</td>
			<td width="350" align="center">
				<input type="text" name="name" size="40" style="background-color: #e2e2e2;" value="${mvo.name}" readonly>
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">아이디</td>
			<td width="350" align="center">
				<input type="text" name="id" size="40" style="background-color: #e2e2e2;" value="${mvo.id}" readonly>
			</td>
		</tr>
		<tr  height="50">
			<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">비밀번호 </td>
			<td width="350" align="center">
				<input type="password" name="password1" size="40" required>
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">비밀번호  확인</td>
			<td width="350" align="center">
				<input type="password" name="password2" size="40" required>
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">이메일</td>
			<td width="350" align="center">
				<input type="text" name="email" size="40" value="${mvo.email}">
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">전화번호</td>
			<td width="350" align="center">
				<input type="text" name="phone" size="40" maxlength="11" value="${mvo.phone}">
			</td>
		</tr>
		<tr height="50" >
			<td colspan="2" align="center">
				<input type="button" value="취소" onclick="history.back(-1)">&nbsp;&nbsp;
				<input type="submit" value="수정">&nbsp;&nbsp;
				
				<!-- <input type="reset" value="취소">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
				 
				</td>
		</tr>
	</table>
</form>

</div>
<jsp:include page="../include/userFooter.jsp" />
</div>
</body>
</html>