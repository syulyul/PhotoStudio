<%@page import="board.model.BoardBean"%>
<%@page import="board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardDeleteForm</title>
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
<%
	BoardDAO bdao=new BoardDAO();
	int num=Integer.parseInt(request.getParameter("num"));
	BoardBean bean=bdao.getOneUpdateBoard(num);
%>
<div class="wrap">

<!-- 최상단 : include(Header)  -->
<jsp:include page="include/userHeader.jsp" />



<div class="content" align="center">
<h2 align="center">게시글 삭제하기</h2><br>
	<form action="BoardDeleteProc.jsp" method="post">
		<table width="800">
			<tr height="40">
				<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성자</td>
				<td width="180" style="text-decoration:none; padding-left: 10px; padding-right: 10px;"><%=bean.getWriter()%></td>
				<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성일</td>
				<td width="120" style="text-decoration:none; padding-left: 10px; padding-right: 10px;"><%=bean.getReg_date()%></td>
			</tr>
			<tr height="40">
				<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">제목</td>
				<td align="left" colspan="3" style="text-decoration:none; padding-left: 10px; padding-right: 10px;"><%=bean.getSubject()%></td>
			</tr>
			<tr height="40">
				<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">패스워드</td>
				<td align="left" colspan="3"><input type="password" name="password" size="40"></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="4">
					<input type="hidden" name="num" value="<%=num %>">
					<input type="button" value="취소" onclick="history.back(-1)">&nbsp;&nbsp;
					<input type="submit" value="글삭제">
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













