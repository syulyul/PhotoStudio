<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage - 회원정보확인</title>
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
	<jsp:include page="../include/userHeader.jsp" />
	<div class="content" align="center">
	<h2>회원 정보 확인</h2><br>
        
    <form action="memberUpdate.do" method="post" name="user">
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
				<input type="password" name="password1" size="40" style="background-color: #e2e2e2;" value="${mvo.password1 }" readonly>
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">비밀번호  확인</td>
			<td width="350" align="center">
				<input type="password" name="password2" size="40" style="background-color: #e2e2e2;" value="${mvo.password1 }" readonly>
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">이메일</td>
			<td width="350" align="center">
				<input type="text" name="email" size="40" style="background-color: #e2e2e2;" value="${mvo.email}" readonly>
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">전화번호</td>
			<td width="350" align="center">
				<input type="text" name="phone" size="40" style="background-color: #e2e2e2;" value="${mvo.phone}" readonly>
			</td>
		</tr>
	</table>
</form>
	<table>
		<tr height="60">
			<td align="center" colspan="2" style="border:none;margin-top:30px" width="500">
				<input type="button" value="취소" onclick="location.href='main.jsp'" style=" margin-left: 100px;">&nbsp;&nbsp;
				<input type="submit" value="수정" onclick="location.href='memberUpdate.do?id=${loginUser.id}'" >&nbsp;&nbsp;
				<div style="float:right;"> 
				<input type="submit" value="회원 탈퇴" onclick="location.href='memberDelete.do?id=${loginUser.id}'" style="margin-right: 20px;">
				</div>				
			</td>
		</tr>
	</table>
	<table>
		<tr height="60">
			<td align="center" colspan="2">
				<input type="button" name="id" value="예약확인" onclick="location.href='ReservationConfirm_member.jsp?id=${loginUser.id}'" style=" margin-left: 15px;">&nbsp;&nbsp;
				<input type="button" name="id" value="문의내역확인" onclick="location.href='BoardList_member.jsp?id=${loginUser.id}'">&nbsp;&nbsp;
			</td>
		</tr>
	</table>
		
</div>
<jsp:include page="../include/userFooter.jsp" />
</div>
</body>
</html>