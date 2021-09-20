<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheck(관리자)</title>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
<h2>아이디 중복 확인</h2>
<form action="idCheck_admin.do" method="get" name="user">
	아이디<input type="text" name="id" value="${id}">
	<input type="submit" value="중복 체크"><br>
	
<c:if test="${result == 1}">
	<script type="text/javascript">
		opener.document.user.id.value="";
		/*opener 객체는  자기자신을 오픈한 기존 창의 window 객체를 참조한다 */
	</script>
	${id}는 이미 사용 중인 아이디입니다.
</c:if>
<c:if test="${result == -1}">
	${id}는 사용 가능한 아이디입니다.
	<input type="button" value="사용" onclick="idok('${id}')"> <!-- onclick->js -->
</c:if>
</form>
</body>
</html>