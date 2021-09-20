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
<title>ReviewWriteForm</title>
<style type="text/css">
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
}

.content {
	max-width: 1200px;
	min-height: 850px;
	height: auto;
	/* margin : 상, 좌우, 하 */
	margin: 30px auto 150px;
	padding-top: 100px;
}

.content>h2 {
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
		<h2 align="center">게시글 작성하기</h2>
		<form action="ReviewWriteProc.jsp" method="post">
			<%
				if (session.getAttribute("loginUser") != null) {
			%>
			
			<br>
			
				<table width="800">
					<input type="hidden" name="id" size="40" style="background-color: #F2F2F2;" value="${loginUser.id }">
					<tr height="40">
						<td align="center" width="150"
							style="background-color: #F2F2F2; font-weight: 700;">작성자</td>
						<td width="450"><input type="text" name="writer" size="40"
							value="${loginUser.name }" readonly></td>
					</tr>
					<tr height="60">
						<td align="center" width="150"
							style="background-color: #F2F2F2; font-weight: 700;">이메일</td>
						<td width="450"><input type="tel" name="email" size="40"
							maxlength="11" value="${loginUser.email }" readonly><br>
						&nbsp;&nbsp;<font style="color:#F78181;">* 관리자 이외에는 노출되지 않습니다.</font>
					</tr>
					<tr height="40">
						<td align="center" width="150"
							style="background-color: #F2F2F2; font-weight: 700;">비밀번호</td>
						<td width="450"><input type="password" name="password"
							size="40" required></td>
					</tr>
					<tr height="40">
						<td align="center" width="150"
							style="background-color: #F2F2F2; font-weight: 700;">제목</td>
						<td width="450"><input type="text" name="subject" size="59"
							required></td>
					</tr>
					<tr height="40">
						<td align="center" width="150"
							style="background-color: #F2F2F2; font-weight: 700;">글내용</td>
						<td width="450"><textarea id="summernote" rows="10" cols="60" name="content"
								required></textarea></td>
					</tr>
					<tr height="60">
						<td align="center" colspan="2"><input type="button"
							value="취소" onclick="history.back(-1)">&nbsp;&nbsp; <input
							type="submit" value="작성완료"> <!-- <input type="reset" value="다시 작성">&nbsp;&nbsp; -->
							<!-- <button onclick="location.href='BoardList.jsp'">전체 게시글 보기</button> -->
						</td>
					</tr>
				</table>
				<%
					} else {
				%>
				<table width="800">
					<input type="hidden" name="id" size="40" style="background-color: #F2F2F2;" value="비회원">
					<tr height="40">
						<td align="center" width="150"
							style="background-color: #F2F2F2; font-weight: 700;">작성자</td>
						<td width="450"><input type="text" name="writer" size="40"
							required></td>
					</tr>
					<tr height="40">
						<td align="center" width="150"
							style="background-color: #F2F2F2; font-weight: 700;">이메일</td>
						<td width="450"><input type="email" name="email" size="40" required><br>
						&nbsp;&nbsp;<font style="color:#F78181;">* 관리자 이외에는 노출되지 않습니다.</font></td>
					</tr>
					<tr height="40">
						<td align="center" width="150"
							style="background-color: #F2F2F2; font-weight: 700;">비밀번호</td>
						<td width="450"><input type="password" name="password"
							size="40" required></td>
					</tr>
					<tr height="40">
						<td align="center" width="150"
							style="background-color: #F2F2F2; font-weight: 700;">제목</td>
						<td width="450"><input type="text" name="subject" size="59"
							required></td>
					</tr>
					<tr height="40">
						<td align="center" width="150"
							style="background-color: #F2F2F2; font-weight: 700;">글내용</td>
						<td width="450"><textarea id="summernote" rows="10" cols="60" name="content"
								required></textarea></td>
					</tr>
					<tr height="40">
						<td align="center" colspan="2"><input type="button"
							value="취소" onclick="history.back(-1)">&nbsp;&nbsp; <input
							type="submit" value="작성완료"> <!-- <input type="reset" value="다시 작성">&nbsp;&nbsp; -->
							<!-- <button onclick="location.href='BoardList.jsp'">전체 게시글 보기</button> -->
						</td>
					</tr>
				</table>
				<%
					}
				%>
			</form>
		</div>



		<!-- 최하단 : include(Footer)  -->
		<jsp:include page="include/reviewWriteFooter.jsp"/>
	</div>
</body>
</html>