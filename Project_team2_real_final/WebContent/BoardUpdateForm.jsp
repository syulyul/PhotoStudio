<%@page import="board.model.BoardBean"%>
<%@page import="board.model.BoardDAO"%>
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
	<h2>게시글 수정</h2><br>
<%
	int num=Integer.parseInt(request.getParameter("num").trim());
	
	BoardDAO bdao=new BoardDAO();
	BoardBean bean=bdao.getOneUpdateBoard(num);
%>
<form action="BoardUpdateProc.jsp" method="post">
	<table width="800">
		<tr height="40">
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성자</td>
			<td width="180" style="text-decoration:none; padding-left: 10px; padding-right: 10px;"><%=bean.getWriter()%></td>
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성일</td>
			<td width="180" style="text-decoration:none; padding-left: 10px; padding-right: 10px;"><%=bean.getReg_date()%></td>
		</tr>
		<tr height="40">
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">패스워드</td>
			<td width="480" colspan="3">
			<input type="password" name="password" size="40"></td>
		</tr>
		<tr height="40">
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">제목</td>
			<td width="480" colspan="3">
			<input type="text" name="subject" value="<%=bean.getSubject()%>" size="59"></td>
		</tr>		
		<tr height="40">
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">글내용</td>
			<td width="480" colspan="3"><textarea rows="10" cols="60" name="content" align="left"><%=bean.getContent()%></textarea></td>
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
<jsp:include page="include/userFooter.jsp" />
</div>
</body>
</html>













