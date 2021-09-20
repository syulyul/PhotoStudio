<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReservationConfirm(예약 확인하기)</title>
<style type="text/css">

.content{
	max-width:1200px;
	min-height: 850px;
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
	border: 1px solid;	
	border-color: #c8c8c8;
	font-size: 14px;
}
</style>
</head>
<body>
<div class="wrap">

<!-- 최상단 : include(Header)  -->
<jsp:include page="include/userHeader.jsp" />

<div class="content" align="center">
<br><br>
<h2>예약 확인하기</h2><br>
<form action="ReservationConfirmResult.jsp" method="post">

	<table width="500" border="1">
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">이름</td>
			<td width="350" align="center">
				<input type="text" name="name" size="40" placeholder="예약할 때 입력한 이름" required style="height:30px; border:none;">
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center" style="background-color: #F2F2F2; font-weight: 700;">전화번호</td>
			<td width="350" align="center">
				<input type="tel" id="phone" name="phone" size="40" maxlength="11" placeholder="예약할 때 입력한 전화번호" required style="height:30px; border:none;">
			</td>
		</tr>
		</table>
		<table>
		<tr height="80">
			<td colspan="2" align="center" style="border-style:none;">
			<input type="button" value="취소" onclick="history.back(-1)">&nbsp;&nbsp;	
			<input type="submit" value="예약 확인하기">			
			</td>
		</tr>
	</table>
</form>
</div>

<!-- 최하단 : include(Footer)  -->
<jsp:include page="include/userFooter.jsp" />
</div>
</body>
</html>