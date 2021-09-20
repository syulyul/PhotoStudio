<%@page import="review_board.model.RBDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewDeleteProc</title>
</head>
<body>
<%
	String pass=request.getParameter("password");
	int num=Integer.parseInt(request.getParameter("num"));
	
	RBDAO rdao=new RBDAO();
	String password=rdao.getPass(num);
	
	if(pass.equals(password)){
		rdao.deleteBoard(num);
	    response.sendRedirect("ReviewList.jsp");
	}else{
%>
<script>
	alert("패스워드가 틀려서 삭제할 수 없습니다. 패스워드를 확인해 주세요");
	history.go(-1);
</script>
<%
 }
%>
</body>
</html>