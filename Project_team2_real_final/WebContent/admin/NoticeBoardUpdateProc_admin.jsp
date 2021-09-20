
<%@page import="notice_board.model.NoticeBoardDAO"%>
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

<jsp:useBean id="NoticeboardBean" class="notice_board.model.NoticeBoardBean">
<jsp:setProperty name="NoticeboardBean" property="*" />
</jsp:useBean>
	
<%
	int notice_num=Integer.parseInt(request.getParameter("notice_num"));

	NoticeBoardDAO bdao=new NoticeBoardDAO();
	
	// 해당 게시글의 패스워드 값을 얻어옴
    String pass=bdao.getPass(NoticeboardBean.getNotice_num());
	
	if(pass.equals(NoticeboardBean.getNotice_password())){
		bdao.updateBoard(NoticeboardBean);
		/* response.sendRedirect("BoardList.jsp"); */
%>		
<script type="text/javascript">
	location.href="index.jsp?pageChange=NoticeBoardInfo_admin.jsp&notice_num=<%=notice_num%>";
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













