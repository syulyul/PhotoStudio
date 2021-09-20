<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="member.dto.MemVO"%>
<%@page import="member.dao.MemDAO_admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
	$(function(){
	    //전체선택 체크박스 클릭
		$("#allCheck").click(function(){
			
			//만약 전체 선택 체크박스가 체크된상태일경우
			if($("#allCheck").prop("checked")) {
				
				//해당화면에 전체 checkbox들을 체크해준다
				$("input[type=checkbox]").prop("checked",true);
				
			// 전체선택 체크박스가 해제된 경우
			} else {
				//해당화면에 모든 checkbox들의 체크를해제시킨다.
				$("input[type=checkbox]").prop("checked",false);
			}
		})
	})


</script>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<style type="text/css">

.content{
	max-width:1200px;
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
<div class="content" align="center">
<h2>회원 관리</h2>
<form action="index.jsp?pageChange=multiDelete_admin4.jsp" method="post" id="multidelete4">
	
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
		
		MemDAO_admin mdao=MemDAO_admin.getInstance();
		int listCount = mdao.getMemberListCount(listOpt);
		ArrayList<MemVO> list = mdao.allSelectMember(listOpt);
	    
		// 글의 총 수와 글목록 저장
		request.setAttribute("listCount", listCount);
		request.setAttribute("list", list);
		
	    // 테이블에 표시할 번호 지정
	    //number=listCount-(currentPage-1)*pageSize;
	%>
	
	<!-- 회원 목록 부분 -->
	<br>
	
		<table width="1000">
			<tr height="40" style="background-color:#F2F2F2; font-weight: 700;">
				<td><input type="checkbox" name="all" id="allCheck"></td>	
				<td align="center" width="150">아이디</td>
				<td align="center" width="200">비밀번호</td>
				<td align="center" width="200">이름</td>
				<td align="center" width="250">이메일</td>
				<td align="center" width="200">전화번호</td>
			</tr>
			
			<%
				for(int i=0;i<list.size();i++){
					MemVO mvo=list.get(i);
			%>
			
			<tr height="40">
				<td width="10"><input type="checkbox" name="chk" id="chk" value="<%=mvo.getId()%>"></td>
				<td align="center" width="150"><%=mvo.getId()%></td>
				<td align="center" width="200"><%=mvo.getPassword1()%></td>
				<td align="center" width="200"><%=mvo.getName()%></td>
				<td align="center" width="250"><%=mvo.getEmail()%></td>
				<td align="center" width="200"><%=mvo.getPhone()%></td>
			</tr>
			
			<%
				}
			%>
			<tr height="80" style="border: none;">
			<td align="right" colspan="6">
				<input type="submit" id="next" value="삭제" style="float: left; margin-left:10px;">
				<!-- <input type="button" value="회원등록" onclick="location.href='../join_admin.do'"> -->
				<!-- <input type="button" value="회원등록" onclick="location.href='index.jsp?pageChange=join_admin.do'"> -->
				<!-- <input type="button" value="회원등록" onclick="location.href='member/JoinForm_admin.jsp'"> -->
				<input type="button" value="회원등록" onclick="location.href='index.jsp?pageChange=member/JoinForm_admin.jsp'">
			</td>
			</tr>
		</table>
	
	<br>
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
			<a href="index.jsp?pageChange=MemberList_admin.jsp&pageNum=<%=startPage-10 %>" style="text-decoration:none; color:gray">[이전]</a>
	<%
			}
			// 페이징 처리
			for(int i=startPage;i<=endPage;i++){
	%>
			<a href="index.jsp?pageChange=MemberList_admin.jsp&pageNum=<%=i %>" style="text-decoration:none; color:gray">[<%=i %>]</a>
	<%
			}
			// 다음이라는 링크를  만들건지 파악
			if(endPage < pageCount){
	%>
			<a href="index.jsp?pageChange=MemberList_admin.jsp&pageNum=<%=startPage+10 %>" style="text-decoration:none; color:gray">[다음]</a>
	<%
			}
		}
	%>
</form>
	<br><br>
	<!--  검색 부분 -->
	
        <form action="index.jsp?pageChange=MemberListProc_admin.jsp" method="post">
            <select name="opt" style="height:30px; font-size:14px;">
                <option value="0">아이디</option>
                <option value="1">이름</option>
                <option value="2">이메일</option>
                <option value="3">전화번호</option>
            </select>
            <input type="text" size="20" style="height:30px; font-size:14px;" name="condition"/>&nbsp;
            <input type="submit" value="검색"/>
        </form>   
</div>
</div>
</body>
</html>