<%@page import="review_board.model.RBBean"%>
<%@page import="review_board.model.RBDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	padding-left: 10px;
	padding-right: 10px;
}

</style>
</head>
<body>
<%
	int num=Integer.parseInt(request.getParameter("num").trim()); //공백 제거
	
	
	RBDAO rdao=new RBDAO();
	RBBean rbean=rdao.getOneBoard(num); 
	
	//textarea 방식에서 줄바꿈 적용
	String content=rbean.getContent();
	//content=content.replace("\r\n","<br>");
%>
<div class="wrap">

<!-- 최상단 : include(Header)  -->
<jsp:include page="include/userHeader.jsp" />

<!-- 상단 영역 -->
<div class="content" align="center">
	<h2>게시글 보기</h2><br>
		<table width="800">
			<tr height="40">
				<td width="100" align="center" style="background-color:#F2F2F2; font-weight: 700;">글번호</td>
				<td width="180" align="left"><%=rbean.getNum()%></td>
				<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">조회수</td>
				<td width="180" align="center"><%=rbean.getReadcount() %></td>
			</tr>
			<tr height="40">
				<td width="100" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성자</td>
				<td width="180" align="left"><%=rbean.getWriter()%></td>
				<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성일</td>
				<td width="180" align="center"><%=rbean.getReg_date() %></td>
			</tr>
			<%-- <tr height="40">
				<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">이메일</td>
				<td colspan="3" style="text-decoration:none;"><%=rbean.getEmail() %></td>
			</tr> --%>
			<tr height="40">
				<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">제목</td>
				<td colspan="3" style="text-decoration:none;"><%=rbean.getSubject() %></td>
			</tr>
			<tr height="300">
				<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">글내용</td>
				<td colspan="3" style="text-decoration:none;"><%=content %></td>
			</tr>
			<tr height="60">
				<td align="center" colspan="4">
					<%-- <input type="button" value="답글쓰기"
					onclick="location.href='BoardReWriteForm.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef() %>&re_step=<%=bean.getRe_step()%>&re_level=<%=bean.getRe_level()%>'">&nbsp;&nbsp; --%>
					<input type="button" value="수정하기" onclick="location.href='ReviewUpdateForm.jsp?num=<%=rbean.getNum()%>'">&nbsp;&nbsp;
					<input type="button" value="삭제하기" onclick="location.href='ReviewDeleteForm.jsp?num=<%=rbean.getNum()%>'">&nbsp;&nbsp;
					<input type="button" value="목록보기" onclick="location.href='ReviewList.jsp?num=<%=rbean.getNum()%>'">
				</td>
			</tr>
		</table>
</div>
<!-- 최하단 : include(Footer)  -->
<jsp:include page="include/userFooter.jsp" />
</div>
</body>
</html>