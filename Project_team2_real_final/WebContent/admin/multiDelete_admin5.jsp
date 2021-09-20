<%@page import="review_board.model.RBDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>multiDelete_admin(선택 기능을 통한 다중 삭제(이용후기 게시판)_관리자용)</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>


	<%
		
	if(request.getParameter("chk") != null){
		String[] num=request.getParameterValues("chk");
		
		RBDAO dao = new RBDAO();
		int res=dao.multiDelete(num);
		
			if(res==num.length){
	
			
	%>
				<script type="text/javascript">
					alert("체크 된 글 삭제 성공");
					location.href="index.jsp?pageChange=ReviewList_admin.jsp";
				</script>	
	<%	
			} else {
	%>
				<script type="text/javascript">
					alert("체크 된 글 삭제 실패");
					location.href="index.jsp?pageChange=ReviewList_admin.jsp";
				</script>		
	<% 		
			}
	%>
	<%
	}else{	
	 %>
		<script type="text/javascript">
		alert("체크 된 항목없습니다. 다시 확인해 주세요.");
		history.go(-1);
		</script>
	<%
		}
	%>
</body>
</html>