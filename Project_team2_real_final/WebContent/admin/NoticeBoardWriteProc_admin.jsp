<%@page import="notice_board.model.NoticeBoardBean"%>
<%@page import="notice_board.model.NoticeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWriterProc</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="NoticeboardBean" class="notice_board.model.NoticeBoardBean">
	<jsp:setProperty name="NoticeboardBean" property="*" />
</jsp:useBean>

<%
	
	String notice_writer=request.getParameter("notice_writer");
	String notice_password=request.getParameter("notice_password");
	String notice_subject=request.getParameter("notice_subject");

	NoticeBoardDAO bdao=new NoticeBoardDAO();
	NoticeBoardBean bean=new NoticeBoardBean();
	bean.setNotice_writer(notice_writer);
	bean.setNotice_password(notice_password);
	bean.setNotice_subject(notice_subject);

	if(NoticeboardBean.getNotice_Writer() != null) {
		bdao.insertBoard(NoticeboardBean);
		/* response.sendRedirect("BoardList.jsp"); */
		bdao.getOneBoard1(bean);
%>	
	
<script type="text/javascript">
location.href="index.jsp?pageChange=NoticeBoardInfo_admin.jsp&notice_num=<%=bean.getNotice_num()%>";
</script>	
		
<%
	}else{
	
	// 게시글 저장 후 전체 게시글 보기
	response.sendRedirect("index.jsp?pageChange=NoticeBoardList_admin.jsp"); /// 저장이 잘 됐는지 확인
	}
%>

</body>
</html>