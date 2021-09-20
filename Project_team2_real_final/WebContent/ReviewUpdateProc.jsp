<%@page import="review_board.model.RBDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="http://localhost:8080/jsp_prj/common/main_v190130.css"/>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

	<jsp:useBean id="rbean" class="review_board.model.RBBean">
	<jsp:setProperty name="rbean" property="*"/>
	</jsp:useBean>
	
<%
	int num=Integer.parseInt(request.getParameter("num"));

	RBDAO rdao=new RBDAO();
	
	// 해당 게시글의 패스워드 값을 얻어옴
    String pass=rdao.getPass(rbean.getNum());
	
	if(pass.equals(rbean.getPassword())){
		rdao.updateBoard(rbean);
		/* response.sendRedirect("BoardList.jsp"); */
%>		
<script type="text/javascript">
	location.href="ReviewInfo.jsp?num=<%=num%>";
</script>

<%
	}else{
%>	
	<script type="text/javascript">
		alert("패스워드가 일치하지 않습니다. 다시 확인 후 수정해 주세요");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>