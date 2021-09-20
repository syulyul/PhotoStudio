
<%@page import="review_board.model.RBBean"%>
<%@page import="review_board.model.RBDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardUpdateForm</title>
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
input{
	line-height:2;
}
</style>
</head>
<body>
<div class="wrap">

<!-- 최상단 : include(Header)  -->



<div class="content" align="center">
	<h2>게시글 수정</h2><br>
<%
	int num=Integer.parseInt(request.getParameter("num").trim());
	
	RBDAO bdao=new RBDAO();
	RBBean bean=bdao.getOneUpdateBoard(num);
%>
<form action="ReviewReWriteUpdateProc_admin.jsp" method="post">
	<table width="600">
		<tr height="40">
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성자</td>
			<td width="180" style="text-decoration:none; padding-left: 10px; padding-right: 10px;"><%=bean.getWriter()%></td>
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성일</td>
			<td width="180" style="text-decoration:none; padding-left: 10px; padding-right: 10px;"><%=bean.getReg_date()%></td>
		</tr>
		<tr height="40">
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">패스워드</td>
			<td width="480" colspan="3">
			<input type="password" name="password" size="40" style="border:none;"></td>
		</tr>
		<tr height="40">
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">제목</td>
			<td width="480" colspan="3">
			<input type="text" name="subject" value="<%=bean.getSubject()%>" size="59" style="border:none;"></td>
		</tr>		
		<tr height="40">
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">글내용</td>
			<td width="480" colspan="3"><textarea rows="10" cols="65" name="content" align="left" style="border:none; margin-top:7px;"><%=bean.getContent()%></textarea></td>
		</tr>
		<tr height="40">
			<td colspan="4" align="center">
				<input type="hidden" name="num" value="<%=bean.getNum()%>">
				<input type="button" value="취소" onclick="history.back(-1)">&nbsp;&nbsp;
				<input type="submit" value="작성완료">				
			</td>
		</tr>
	</table>
</form>
</div>

<!-- 최하단 : include(Footer)  -->
</div>
</body>
</html>













