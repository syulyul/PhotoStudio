<%@page import="review_board.model.RBBean"%>
<%@page import="review_board.model.RBDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.content{
	max-width:1200px;
	min-height: 850px;
	height:auto;
	/* margin : 상, 좌우, 하 */
	margin : 30px auto 150px;	
	padding-top: 100px;
}

.content > h2 {
	font-size: 25px;
	color: #494949;
}

table td {
	border-top: 1px solid;
	border-color: #c8c8c8;
	font-size: 14px;	
}

</style>
<script>
$(function(){
    $('#summernote').summernote( {
        		      
        tabsize: 20,
        height: 300,                 // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",					// 한글 설정
        placeholder: '내용을 입력하세요',	//placeholder 설정
    });
});
/* <script type="text/javascript">
$(function(){
     $("#btn").click(function(){
           $("form").submit();
     });
});//ready */
</script>
</head>
<body>
<div class="wrap">

<!-- 최상단 : include(Header)  -->
<jsp:include page="include/reviewWriteHeader.jsp" />



<div class="content" align="center">
	<h2>게시글 수정</h2><br>
<%
	int num=Integer.parseInt(request.getParameter("num").trim());
	
	RBDAO rdao=new RBDAO();
	RBBean rbean=rdao.getOneUpdateBoard(num);
%>
<form action="ReviewUpdateProc.jsp" method="post">
	<table width="800">
		<tr height="40">
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성자</td>
			<td width="180" style="text-decoration:none; padding-left: 10px; padding-right: 10px;"><%=rbean.getWriter()%></td>
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">작성일</td>
			<td width="180" style="text-decoration:none; padding-left: 10px; padding-right: 10px;"><%=rbean.getReg_date()%></td>
		</tr>
		<tr height="40">
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">패스워드</td>
			<td width="480" colspan="3">
			<input type="password" name="password" size="40"></td>
		</tr>
		<tr height="40">
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">제목</td>
			<td width="480" colspan="3">
			<input type="text" name="subject" value="<%=rbean.getSubject()%>" size="59"></td>
		</tr>		
		<tr height="40">
			<td width="120" align="center" style="background-color:#F2F2F2; font-weight: 700;">글내용</td>
			<td width="480" colspan="3"><textarea id="summernote" rows="10" cols="60" name="content" align="left"><%=rbean.getContent()%></textarea></td>
		</tr>
		<tr height="40">
			<td colspan="4" align="center">
				<input type="hidden" name="num" value="<%=rbean.getNum()%>">
				<input type="button" value="취소" onclick="history.back(-1)">&nbsp;&nbsp;
				<input type="submit" value="작성완료">				
			</td>
		</tr>
	</table>
</form>
</div>

<!-- 최하단 : include(Footer)  -->
<jsp:include page="include/reviewWriteFooter.jsp" />
</div>
</body>
</html>