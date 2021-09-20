<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardReWriteForm</title>
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
	<h2>답변 작성하기</h2><br>
	<%
		// 게시글 읽기에서 답변글 쓰기를 클릭하면 넘겨주는 데이터들을 받아준다.
		int num=Integer.parseInt(request.getParameter("num"));
		int ref=Integer.parseInt(request.getParameter("ref"));
		int re_step=Integer.parseInt(request.getParameter("re_step"));
		int re_level=Integer.parseInt(request.getParameter("re_level"));
	%>
	
	<form action="BoardReWriteProc.jsp" method="post">
		<%
			if (session.getAttribute("loginUser") != null) {
		%>
		<table width="800">
		<input type="hidden" name="id" size="40" style="background-color: #F2F2F2;" value="${loginUser.id }">
			<tr height="40">
				<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성자</td>
				<td width="450"><input type="text" name="writer" size="40" value="${loginUser.name}" required></td>
			</tr>			
			<tr height="40">
				<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">이메일</td>
				<td width="450"><input type="email" name="email" size="40" value="${loginUser.email}" required></td>
			</tr>
			<tr height="40">
				<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">비밀번호</td>
				<td width="450"><input type="password" name="password"  size="40" required></td>
			</tr>
			<tr height="40">
				<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">제목</td>
				 <td width="450"><input type="text" name="subject"  size="59" required></td> 
				<!-- <td width="450"><input type="text" name="subject" value="[답변]" size="60"></td>  -->
			</tr>
			<tr height="40">
				<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">글내용</td>
				<td width="450"><textarea rows="10" cols="60" name="content" required></textarea></td>
			</tr>
			
			<!--form에서 사용자로부터 입력받지 않고 데이터를 넘김-->
			<tr height="40">
				<td align="center" colspan="2">
					<input type="hidden" name="ref" value="<%=ref %>">
					<input type="hidden" name="re_step" value="<%=re_step %>">
					<input type="hidden" name="re_level" value="<%=re_level %>">
					<input type="button" value="취소" onclick="history.back(-1)">&nbsp;&nbsp;
					<input type="submit" value="작성완료">
					<!-- <input type="button" onclick="location.href='BoardList.jsp'" value="전체글보기"> -->
				</td>
			</tr>
		</table>
		<%
			} else {
		%>
		<table width="800">
		<input type="hidden" name="id" size="40" style="background-color: #F2F2F2;" value="null">
			<tr height="40">
				<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성자</td>
				<td width="450"><input type="text" name="writer" size="40" required></td>
			</tr>			
			<tr height="40">
				<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">이메일</td>
				<td width="450"><input type="email" name="email" size="40" required></td>
			</tr>
			<tr height="40">
				<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">비밀번호</td>
				<td width="450"><input type="password" name="password"  size="40" required></td>
			</tr>
			<tr height="40">
				<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">제목</td>
				 <td width="450"><input type="text" name="subject"  size="59" required></td> 
				<!-- <td width="450"><input type="text" name="subject" value="[답변]" size="60"></td>  -->
			</tr>
			<tr height="40">
				<td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">글내용</td>
				<td width="450"><textarea rows="10" cols="60" name="content" required></textarea></td>
			</tr>
			
			<!--form에서 사용자로부터 입력받지 않고 데이터를 넘김-->
			<tr height="40">
				<td align="center" colspan="2">
					<input type="hidden" name="ref" value="<%=ref %>">
					<input type="hidden" name="re_step" value="<%=re_step %>">
					<input type="hidden" name="re_level" value="<%=re_level %>">
					<input type="button" value="취소" onclick="history.back(-1)">&nbsp;&nbsp;
					<input type="submit" value="작성완료">
					<!-- <input type="button" onclick="location.href='BoardList.jsp'" value="전체글보기"> -->
				</td>
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
<body>
</html>













