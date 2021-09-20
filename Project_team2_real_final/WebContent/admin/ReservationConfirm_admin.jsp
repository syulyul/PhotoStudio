<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReservationConfirm(예약 확인하기_관리자용)</title>
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

/* table td {
	border: 1px solid;	
	border-color: #c8c8c8;
	font-size: 14px;
} */
table td {
	border-top: 1px solid;	
	border-color: #c8c8c8;
	font-size: 14px;
	padding-left: 10px;
	padding-right: 10px;
	/* padding: 10px auto 10px; */
}
input{
	line-height:2;
}
</style>
</head>
<body>
<div class="content" align="center">
<h2>예약 확인하기</h2><br>
<form action="index.jsp?pageChange=ReservationList_admin.jsp" method="post">

	<table width="500">
		<tr height="50">
			<td width="200" align="center" style="border-left:1px solid #c8c8c8; background-color:#F2F2F2; font-weight: 700;">이름</td>
			<td width="250" align="center" style="border-right:1px solid #c8c8c8;">
				<input type="text" name="name" size="40" style="border:none;" placeholder="예약할 때 입력한 이름">
			</td>
		</tr>
		<tr height="50">
			<td width="200" align="center" style="border-left:1px solid #c8c8c8; background-color:#F2F2F2; font-weight: 700;">전화번호</td>
			<td width="250" align="center" style="border-right:1px solid #c8c8c8;">
				<input type=	"tel" id="phone" name="phone" size="40" maxlength="11" style="border:none;" placeholder="예약할 때 입력한 전화번호">
			</td>
		</tr>
		
		<tr height="80">			
			<td colspan="2" align="center" style="padding-top:30px;">
				<input type="submit" value="예약 확인하기">&nbsp;&nbsp;
				<input type="button" value="돌아가기" onclick="history.back(-1)"><br><br>
			</td>
		</tr>
		<tr><td colspan="2" align="center" style="border-top:none;">* 값을 입력하지 않고 확인하기 버튼을 누르면, <br>전체 예약 현황을 확인하실 수 있습니다.</td></tr>
	</table>
</form>
</div>
</body>
</html>