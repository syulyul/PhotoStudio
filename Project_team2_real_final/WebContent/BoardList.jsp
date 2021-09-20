<%@page import="board.model.BoardBean"%>
<%@page import="board.model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
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
	padding-left: 10px;
	padding-right: 10px;
	/* padding: 10px auto 10px; */
}

select {
	font-size: 14px;
}

</style>
</head>
<body>
<div class="wrap">

<!-- 최상단 : include(Header)  -->
<jsp:include page="include/userHeader.jsp" />



<div class="content" align="center">
	<h2>문의하기</h2>
	
	<%
	    // 화면에 보여질 게시글의 개수를 지정
		int pageSize=10;
		
	    // 현재 카운터를 클릭한 번호 값을 읽어 옴
		String pageNum=request.getParameter("pageNum");
	    
	    // 만약 처음 boardlist.jsp를 클릭하거나 수정 삭제등 다른 게시글에서 이 페이지로 넘어오면 
	    // pageNum값이 없기에 null값 처리
	    if(pageNum == null){
	    	pageNum="1";
	    }
	    
	    int number=0; // 페이지 넘버링 변수
	    int currentPage=Integer.parseInt(pageNum); // 현재 보고자 하는 페이지 숫자를 지정
	    
	    // 현재 페이지에 보여줄 시작 번호를 설정=데이터 베이스에서 불러올 시작 번호
		int startRow=(currentPage-1)*pageSize+1;	    
	    int endRow=currentPage*pageSize;
	    
	 	// 검색조건과 검색내용을 가져온다.
		String opt = request.getParameter("opt");
		String condition = request.getParameter("condition");
		
		// 검색조건과 내용을 Map에 담는다.
		HashMap<String, Object> listOpt = new HashMap<String, Object>();
		listOpt.put("opt", opt); // 검색 조건
		listOpt.put("condition", condition); // 검색어
		listOpt.put("start", startRow);
		
		BoardDAO bdao=new BoardDAO();
		int listCount = bdao.getBoardListCount(listOpt);
		ArrayList<BoardBean> list =  bdao.getBoardList(listOpt);
	    
		// 글의 총 수와 글목록 저장
		request.setAttribute("listCount", listCount);
		request.setAttribute("list", list);
		
	    // 테이블에 표시할 번호 지정
	    number=listCount-(currentPage-1)*pageSize;
	%>
    <!-- 게시글 목록 부분 -->
    <br>
   <table width="1000">
		<tr height="40" style="background-color: #F2F2F2; font-weight: 700;">
			<td width="50" align="center">번호</td>
			<td width="320" align="center">제목</td>
			<td width="100" align="center">작성자</td>
			<td width="100" align="center">작성일</td>
			<td width="60" align="center">조회수</td>
		</tr>
        
        <%
        	for(int i=0;i<list.size();i++){
        		BoardBean bean=list.get(i);
        %>
        	<tr height="40">
				<td width="50" align="center"><%=number-- %></td>
				<td width="320" align="left">
					<a href="BoardInfo.jsp?num=<%=bean.getNum() %>" style="text-decoration:none">
					
					<%
						if(bean.getRe_step() > 1){
							
							for(int j=0;j<(bean.getRe_level()-1)*5;j++){
					%>
					&nbsp;
					<%
							}
					%>
					[답변]
					<% 	
						}
					%>
					<%=bean.getSubject()%>
					</a>
				</td>
				<td width="100" align="center"><%=bean.getWriter() %></td>
				<td width="100" align="center"><%=bean.getReg_date() %></td>
				<td width="60" align="center"><%=bean.getReadcount() %></td>
			</tr>	
		<%
			}
		%>
		<tr height="80" style="border: none;">
			<td align="right" colspan="5">
				<!-- <input type="button" value="글 전체 보기" onclick="location.href='BoardList.jsp'"> -->
				<input type="button" value="글쓰기" onclick="location.href='BoardWriteForm.jsp'">
			</td>
		</tr>	
        </table>
   		
    <br><br>
    <!-- 페이지 카운터링 소스 -->
	<%
		if(listCount > 0){
			// 카운터링 숫자를 얼마까지 보여줄껀지 결정
			int pageCount=listCount/pageSize+(listCount%pageSize == 0? 0:1);
			
			// 시작 페이지 숫자를 설정
			int startPage=1;
			if(currentPage%10 != 0){
				startPage=((int)(currentPage/10))*10+1;
			}else{
				startPage=((int)(currentPage/10)-1)*10+1;
			}
			
			int pageBlock=10;
			int endPage=startPage+pageBlock-1; // 화면에 보여질 페이지의 마지막 숫자
			
			if(endPage > pageCount)
				 endPage=pageCount;
			
			// 이전이라는 링크를 만들건지 파악
			if(startPage > 10){
	%>
			<a href="BoardList.jsp?pageNum=<%=startPage-10 %>" style="text-decoration:none">[이전]</a>
	<%
			}
			// 페이징 처리
			for(int i=startPage;i<=endPage;i++){
	%>
			<a href="BoardList.jsp?pageNum=<%=i %>" style="text-decoration:none">[<%=i %>]</a>
	<%
			}
			// 다음이라는 링크를  만들건지 파악
			if(endPage < pageCount){
	%>			
			<a href="BoardList.jsp?pageNum=<%=startPage+10 %>" style="text-decoration:none">[다음]</a>
	<%
			}
		}
	%>
    <br><br>
    <!--  검색 부분 -->
    <br>
        <form action="BoardListProc.jsp">
            <select name="opt" style="height:30px; font-size:14px;">
                <option value="0">제목</option>
                <option value="1">내용</option>
                <option value="2">제목+내용</option>
                <option value="3">작성자</option>
            </select>
            <input type="text" size="20" style="height:30px; font-size:14px;" name="condition"/>&nbsp;
            <input type="submit" value="검색"/>
        </form>    
</div>

<!-- 최하단 : include(Footer)  -->
<jsp:include page="include/userFooter.jsp" />
</div>
</body>
</html>