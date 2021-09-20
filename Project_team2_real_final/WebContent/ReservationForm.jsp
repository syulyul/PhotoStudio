<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>촬영 예약 페이지</title>
<style type="text/css">
.content {
	max-width: 1200px;
	min-height: 850px;
	height: auto;
	/* margin : 상, 좌우, 하 */
	margin: 30px auto 150px;
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
		<jsp:include page="include/userHeader.jsp" />

		<div class="content" align="center">
		<form action="ReservationProc.jsp" method="post">
			<h2 style="font-size: 25px; color: #494949;">촬영 예약</h2>
			<br>
			<%
				if (session.getAttribute("loginUser") != null) {
			%>

			
			
				<table class="mytable">
				<!-- 로그인한 회원의 id를 비공개하여 값 등록  -->
					<!-- <tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">아이디</td>
						<td width="350" align="center"> -->
						<input type="hidden" name="id" size="40" style="background-color: #F2F2F2;" value="${loginUser.id }">
				<!-- 		</td>
					</tr> -->
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">이름</td>
						<td width="350" align="center"><input type="text" name="name"
							size="40" value="${loginUser.name }"></td>
					</tr>
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">전화번호</td>
						<td width="350" align="center"><input type="tel" id="phone"
							name="phone" size="40" maxlength="11" value="${loginUser.phone }">
						</td>
					</tr>
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">날짜</td>
						<td width="350" align="center"><input type="date"
							name="rdate" size="40" required></td>
					</tr>
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">시간</td>
						<td width="350" align="center"><input type="time" name="time"
							size="40" required></td>
					</tr>
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">인원</td>
						<td width="350" align="center"><input type="text"
							name="people" size="40" required></td>
					</tr>
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">촬영 장소</td>
						<td width="350" align="center"><input type="radio"
							name="place" value="실내" required>실내&nbsp; <input
							type="radio" name="place" value="실외" required>실외&nbsp;</td>
					</tr>
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">촬영 방식</td>
						<td width="350" align="center"><input type="checkbox"
							name="service" value="인물" checked>인물&nbsp; <input
							type="checkbox" name="service" value="동물">동물&nbsp; <input
							type="checkbox" name="service" value="사물">사물&nbsp;</td>
					</tr>
					<tr height="100">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">메모</td>
						<td width="350" align="center"><textarea rows="5" cols="40"
								name="info"></textarea></td>
					</tr>
					<tr height="80">
						<td align="center" colspan="2"><input type="submit"
							value="예약하기" style="float: center; margin-left: 120px;">&nbsp;&nbsp;
							<!-- <input type="reset" value="다시 작성">&nbsp;&nbsp;&nbsp;&nbsp; -->
							<input type="button" value="예약 확인"
							onclick="location.href='ReservationConfirm.jsp'"
							style="float: right; margin-right: 20px;"></td>
					</tr>
				</table>
				<%
					} else {
				%>
				<table class="mytable">
					<!-- 로그인한 회원의 id를 비공개하여 값 등록  -->
					<!-- <tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">아이디</td>
						<td width="350" align="center"> -->
						<input type="hidden" name="id" size="40" style="background-color: #F2F2F2;" value="비회원">
					<!-- 	</td>
					</tr> -->
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">이름</td>
						<td width="350" align="center"><input type="text" name="name"
							size="40" placeholder="예약하실 분의 이름을 입력하세요" required></td>
					</tr>
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">전화번호</td>
						<td width="350" align="center"><input type="tel" id="phone"
							name="phone" size="40" maxlength="11"
							placeholder="'-'을 제외한 숫자만 입력해 주세요" required></td>
					</tr>
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">날짜</td>
						<td width="350" align="center"><input type="date"
							name="rdate" size="40" required></td>
					</tr>
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">시간</td>
						<td width="350" align="center"><input type="time" name="time"
							size="40" required></td>
					</tr>
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">인원</td>
						<td width="350" align="center"><input type="text"
							name="people" size="40" required></td>
					</tr>
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">촬영 장소</td>
						<td width="350" align="center"><input type="radio"
							name="place" value="실내" required>실내&nbsp; <input
							type="radio" name="place" value="실외" required>실외&nbsp;</td>
					</tr>
					<tr height="50">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">촬영 방식</td>
						<td width="350" align="center"><input type="checkbox"
							name="service" value="인물" checked>인물&nbsp; <input
							type="checkbox" name="service" value="동물">동물&nbsp; <input
							type="checkbox" name="service" value="사물">사물&nbsp;</td>
					</tr>
					<tr height="100">
						<td width="150" align="center"
							style="background-color: #F2F2F2; font-weight: 700;">메모</td>
						<td width="350" align="center"><textarea rows="5" cols="40"
								name="info"></textarea></td>
					</tr>
					<tr height="80">
						<td align="center" colspan="2">
						<input type="submit" value="예약하기" style="float: center; margin-left: 120px;">&nbsp;&nbsp;
							<!-- <input type="reset" value="다시 작성">&nbsp;&nbsp;&nbsp;&nbsp; -->
						<input type="button" value="예약 확인" onclick="location.href='ReservationConfirm.jsp'"
							style="float: right; margin-right: 20px;"></td>
					</tr>
				</table>
				<%
					}
				%>



			</form>
		</div>

		<!-- 최하단 : include(Footer)  -->
		<jsp:include page="include/userFooter.jsp" />
	</div>
</body>
</html>