<%@page import="board.model.BoardBean"%>
<%@page import="board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardReWriteProc</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- 데이터를 한번에 받아오는 빈클래스 사용 -->
<jsp:useBean id="boardBean" class="board.model.BoardBean">
	<jsp:setProperty name="boardBean" property="*"/>
</jsp:useBean>

 <%
	 String writer=request.getParameter("writer");
	String password=request.getParameter("password");
	String subject=request.getParameter("subject");

	BoardDAO bdao=new BoardDAO();
	BoardBean bean=new BoardBean();
	bean.setWriter(writer);
	bean.setPassword(password);
	bean.setSubject(subject);
	
	
	if(boardBean.getWriter() != null) {
		bdao.reWriteBoard(boardBean);
		/* response.sendRedirect("BoardList.jsp"); */
		bdao.getOneBoard1(bean);
	
	
%> 	
<script type="text/javascript">
location.href="index.jsp?pageChange=BoardInfo_admin.jsp&num=<%=bean.getNum()%>";
</script>	
		
<%
	}else{
	
	// 게시글 저장 후 전체 게시글 보기
	response.sendRedirect("BoardList_admin.jsp"); /// 저장이 잘 됐는지 확인
	}
%>
<%-- <%
	BoardDAO bdao=new BoardDAO();

	if(boardbean.getWriter()!=null && !(boardbean.getSubject().equals("[답변]"))){
	bdao.reWriteBoard(boardbean);
	response.sendRedirect("BoardList_1.jsp");
	}else{
%>
	<script type="text/javascript">
		alert("제목을 입력해 주세요");
		history.go(-1);
	</script>
<%
	}
%> --%>

</body>
</html>