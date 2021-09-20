<%@page import="review_board.model.RBBean"%>
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
	
	<jsp:useBean id="reviewBean" class="review_board.model.RBBean">
		<jsp:setProperty name="reviewBean" property="*" />
	</jsp:useBean>
	
	<%
	
		//textarea 방식에서 줄바꿈 적용
		/*String content=reviewBean.getContent();
		content=content.replace("\r\n","<br>");*/
		
		String writer=request.getParameter("writer");
		String password=request.getParameter("password");
		String subject=request.getParameter("subject");
	
		RBDAO rdao=new RBDAO();
		RBBean rbean=new RBBean();
		rbean.setWriter(writer);
		rbean.setPassword(password);
		rbean.setSubject(subject);
	
		if(reviewBean.getWriter() != null) {
			rdao.insertBoard(reviewBean);
			/* response.sendRedirect("BoardList.jsp"); */
			rdao.getOneBoard1(rbean);
	%>	
		
	<script type="text/javascript">
	location.href="ReviewInfo.jsp?num=<%=rbean.getNum()%>";
	</script>	
			
	<%
		}else{
		
		// 게시글 저장 후 전체 게시글 보기
		response.sendRedirect("ReviewList.jsp"); /// 저장이 잘 됐는지 확인
		}
	%>
</body>
</html>