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
location.href="BoardInfo.jsp?num=<%=bean.getNum()%>";
</script>	
		
<%
	}else{
	
	// 게시글 저장 후 전체 게시글 보기
	response.sendRedirect("BoardList.jsp"); /// 저장이 잘 됐는지 확인
	}
%>
</body>
</html>