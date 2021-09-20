<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWriteForm</title>
<style type="text/css">
.centered{
	display:table;
	margin-left:auto;
	margin-right:auto;
}

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
input{
	line-height:2;
}	
</style>
</head>
<body>
<div class="wrap">

<!-- 최상단 : include(Header)  -->




<div class="content" align="center">
	<h2 align="center">공지사항 작성하기</h2><br>
		<form action="NoticeBoardWriteProc_admin.jsp" method="post">
		<%
			if (session.getAttribute("loginAdmin") != null) {
		%>
		
		
			<table width="600">
				<tr height="40">
					<td align="center" width="150" style="background-color:#F2F2F2; font-weight: 700;">작성자</td>
					<td width="450"><input type="text" name="notice_writer" size="40" value="${loginAdmin.id}" style="border:none;" line-height:"50" readonly required></td>
				</tr>				
				<tr height="40">
					<td align="center" width="150" style="background-color:#F2F2F2; font-weight: 700;">이메일</td>
					<td width="450"><input type="email" name="notice_email" size="40" value="admin@gmail.com" style="border:none;" readonly required></td>
				</tr>
				<tr height="40">
					<td align="center" width="150" style="background-color:#F2F2F2; font-weight: 700;">비밀번호</td>
					<td width="450"><input type="password" name="notice_password" size="40" style="border:none;" required></td>
				</tr>
				<tr height="40">
					<td align="center" width="150" style="background-color:#F2F2F2; font-weight: 700;">제목</td>
					<td width="450"><input type="text" name="notice_subject" size="58" style="border:none;" required></td> <!--원래 size="59"/양혜인 컴에서는 해당 사이즈가 더 적절하여 변경했음  -->
				</tr>
				<tr height="40">
					<td align="center" width="150" style="background-color:#F2F2F2; font-weight: 700;">글내용</td>
					<td width="450"><textarea rows="10" cols="65" name="notice_content" style="border:none; margin-top:7px;" required></textarea></td>
				</tr>
				<tr height="40">
				<td align="center" colspan="2">				
					<input type="button" value="취소" onclick="history.back(-1)">&nbsp;&nbsp;
					<input type="submit" value="작성완료">
					<!-- <input type="reset" value="다시 작성">&nbsp;&nbsp; -->
					<!-- <button onclick="location.href='BoardList.jsp'">전체 게시글 보기</button> -->
				</td>
				</tr>
			</table>
			<%
				} else {
			%>		
			
			<table width="600">
				<tr height="40">
					<td align="center" width="150" style="background-color:#F2F2F2; font-weight: 700;">작성자</td>
					<td width="450"><input type="text" name="notice_writer" size="40" required></td>
				</tr>				
				<tr height="40">
					<td align="center" width="150" style="background-color:#F2F2F2; font-weight: 700;">이메일</td>
					<td width="450"><input type="email" name="notice_email" size="40" required></td>
				</tr>
				<tr height="40">
					<td align="center" width="150" style="background-color:#F2F2F2; font-weight: 700;">비밀번호</td>
					<td width="450"><input type="password" name="notice_password" size="40" required></td>
				</tr>
				<tr height="40">
					<td align="center" width="150" style="background-color:#F2F2F2; font-weight: 700;">제목</td>
					<td width="450"><input type="text" name="notice_subject" size="59" required></td>
				</tr>
				<tr height="40">
					<td align="center" width="150" style="background-color:#F2F2F2; font-weight: 700;">글내용</td>
					<td width="450"><textarea rows="10" cols="60" name="notice_content" required></textarea></td>
				</tr>
				<tr height="40">
				<td align="center" colspan="2">				
					<input type="button" value="취소" onclick="history.back(-1)">&nbsp;&nbsp;
					<input type="submit" value="작성완료">
					<!-- <input type="reset" value="다시 작성">&nbsp;&nbsp; -->
					<!-- <button onclick="location.href='BoardList.jsp'">전체 게시글 보기</button> -->
				</td>
				</tr>
			</table>
			<%
				}
			%>
		</form>
</div>

<!-- 최하단 : include(Footer)  -->

</div>
</body>
</html>