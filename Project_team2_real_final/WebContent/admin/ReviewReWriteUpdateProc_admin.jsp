
<%@page import="review_board.model.RBDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardUpdateProc</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="reviewBean" class="review_board.model.RBBean">
<jsp:setProperty name="reviewBean" property="*" />
</jsp:useBean>
	
<%
	int num=Integer.parseInt(request.getParameter("num"));

	RBDAO bdao=new RBDAO();
	
	// 해당 게시글의 패스워드 값을 얻어옴
    String pass=bdao.getPass(reviewBean.getNum());
	
	if(pass.equals(reviewBean.getPassword())){
		bdao.updateBoard(reviewBean);
		/* response.sendRedirect("BoardList.jsp"); */
%>		
<script type="text/javascript">
	location.href="index.jsp?pageChange=ReviewInfo_admin.jsp&num=<%=num%>";
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













