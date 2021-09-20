<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberJoinResult_admin(관리자)</title>
</head>
<body>
<%
	// 서블릿을 통한 회원등록 이후, 회원 리스트로 이동
	response.sendRedirect("admin/index.jsp?pageChange=MemberList_admin.jsp");

%>


</body>
</html>