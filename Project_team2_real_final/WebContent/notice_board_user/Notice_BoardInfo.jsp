<%@page import="notice_board.model.NoticeBoardBean"%>
<%@page import="notice_board.model.NoticeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardInfo</title>
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
<%
	int num=Integer.parseInt(request.getParameter("notice_num").trim()); //공백 제거
	
	NoticeBoardDAO bdao=new NoticeBoardDAO();
	NoticeBoardBean bean=bdao.getOneBoard(num);
%>

<div class="wrap">

<!-- 최상단 : include(Header)  -->
<jsp:include page="../include/userHeader.jsp" />



<div class="content" align="center">
	<h2>공지사항 상세보기</h2><br>
		<table width="600">
			<tr height="40">
				<td width="100" align="center" style="background-color:#F2F2F2; font-weight: 700;">글번호</td>
				<td width="180" align="left"><%=bean.getNotice_num()%></td>
				<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">조회수</td>
				<td width="180" align="center"><%=bean.getNotice_readcount() %></td>
			</tr>
			<tr height="40">
				<td width="100" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성자</td>
				<td width="180" align="left">관리자</td>
				<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성일</td>
				<td width="180" align="center"><%=bean.getNotice_reg_date() %></td>
			</tr>
			<%-- <tr height="40">
				<td width="120" align="center">이메일</td>
				<td colspan="3" align="center"><%=bean.getNotice_email() %></td>
			</tr> --%>
			<tr height="40">
				<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">제목</td>
				<td colspan="3" align="center"><%=bean.getNotice_subject() %></td>
			</tr>
			<tr height="300">
				<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">글내용</td>
				<td colspan="3" align="center"><%=bean.getNotice_content() %></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="4">
					<%-- <input type="button" value="답글쓰기"
					onclick="location.href='BoardReWriteForm.jsp?num=<%=bean.getNotice_num()%>&ref=<%=bean.getNotice_ref() %>&re_step=<%=bean.getNotice_re_step()%>&re_level=<%=bean.getNotice_re_level()%>'"> --%>
					<%-- <input type="button" value="수정하기" onclick="location.href='BoardUpdateForm.jsp?notice_num=<%=bean.getNotice_num()%>'">
					<input type="button" value="삭제하기" onclick="location.href='BoardDeleteForm.jsp?notice_num=<%=bean.getNotice_num()%>'"> --%>
					<input type="button" value="목록보기" onclick="location.href='Notice_BoardList.jsp?notice_num=<%=bean.getNotice_num()%>'">
				</td>
			</tr>
		</table>
</div>
<!-- 최하단 : include(Footer)  -->
<jsp:include page="../include/userFooter.jsp" />
</div>
</body>
</html>













