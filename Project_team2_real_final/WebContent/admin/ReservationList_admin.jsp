<%@page import="java.util.List"%>
<%@page import="reservation.model.ReservationBean"%>
<%@page import="reservation.model.ReservationDAO"%>
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
<title>ReservationList(예약 전체 리스트_관리자용)</title>
<style type="text/css">
/*
.content{
	max-width:1200px;
	height:auto;
	/* margin : 상, 좌우, 하 */
/*	margin : 30px auto 150px;	
	padding-top: 100px;
}

.content > h2 {
	font-size: 25px;
	color: #494949;
}

table td {
	border: 1px solid;	
	border-color: #c8c8c8;
	font-size: 14px;
}
*/
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

/* select {
	font-size: 14px;
} */
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
		
	String rname=request.getParameter("name");
	String rphone=request.getParameter("phone");
	ReservationBean reservationVO=new ReservationBean();
	reservationVO.setName(rname);
	reservationVO.setPhone(rphone);
	
	ReservationDAO rdao=new ReservationDAO();
	List reservationList=rdao.allSelectReservation(reservationVO); // 모든 예약 정보 리턴(메서드)
	
%>


<div class="content" align="center">
<h2>모든 예약 보기</h2>
<form action="multiDelete_admin.jsp" method="post" id="multidelete">
	<br>
	<table width="1200">
	<!-- 	<col width=30px> checkbox
		<col width=50px> num
		<col width=150px> name
		<col width=150px> phone
		<col width=150px> rdate
		<col width=150px> time
		<col width=150px> people
		<col width=150px> place
		<col width=150px> sercvice
		<col width=150px> info	 -->	
		<tr height="40" style="background-color:#F2F2F2; font-weight: 700;">			
			<!-- <input type="checkbox" name="all" onclick="allCheck(this.checked);"> -->
			<td><input type="checkbox" name="all" id="allCheck"></td>
			<td width="100" align="center">Num</td>
			<td width="150" align="center">id</td>
			<td width="200" align="center">이름</td>
			<td width="300" align="center">전화번호</td>
			<td width="200" align="center">날짜</td>
			<td width="150" align="center">시간</td>
			<td width="100" align="center">인원</td>
			<td width="250" align="center">촬영장소</td>
			<td width="300" align="center">촬영방식</td>
			<td width="400" align="center">메모</td>
			<td width="150" align="center">변경</td>
			<!-- <td width="200" align="center">취소</td> -->
		</tr>
<%
	// for문을 통한 예약 데이터 출력
	for(int i=0; i<reservationList.size(); i++){
		ReservationBean vo=(ReservationBean)reservationList.get(i);
		int num=vo.getNum();
		String id=vo.getId();
		String name=vo.getName();
		String phone=vo.getPhone();
		String rdate=vo.getRdate();
		String time=vo.getTime();
		String people=vo.getPeople();
		String place=vo.getPlace();
		String service=vo.getService();
		String info=vo.getInfo();
%>
		<tr height="40" align="center">
			<td><input type="checkbox" name="chk" id="chk" value="<%=num%>"></td>
			<td><%=num%></td>
			<td><%=id%></td>
			<td><%=name%></td>
			<td><%=phone%></td>
			<td><%=rdate%></td>
			<td><%=time%></td>
			<td><%=people%></td>
			<td><%=place%></td>
			<td><%=service%></td>
			<td>
<%	
		if(info == null){
		out.print("");
		}else{
		out.print(info);
		}			
%>
 
			</td>
			
			<td><a href="index.jsp?pageChange=ReservationUpdateForm_admin.jsp?num=<%=num %>">변경</a></td>
			<%-- <td><a href="../ReservationDeleteForm.jsp?num=<%=num %>">예약 취소</a></td> --%>
			
			<!-- 버튼 방법으로는 num값이 넘어가질 않는 문제 발생! 방법을 모르겠음-->
			<%-- <td>
				<button type="button" id="update" value="<%=num%>"
					onclick="location.href='../ReservationUpdateForm.jsp'">예약 변경</button>&nbsp;&nbsp;
			</td>			
			<td>
				<button type="button" id="delete" value="<%=num%>"
					onclick="location.href='../ReservationDeleteForm.jsp'">예약 취소</button>&nbsp;&nbsp;
			</td> --%>
		</tr> 
<% 
	}

%>
		
		<!-- 페이지 연결 : 관리자용 메인 화면 제작 시 그리로 연결-->
		<tr height="80" style="border: none;">
				<td align="center" colspan="12">
				<input type="submit" id="next" value="예약 취소" style="margin-right:5px;">
				<!-- <button type="button" onclick="location.href='Main.jsp'">메인화면</button>&nbsp;&nbsp; -->	
				<!-- <input type="button" value="돌아가기" onclick="location.href='index.jsp?pageChange=ReservationList_admin.jsp'"> -->
				<input type="button" value="예약 내역 검색" onclick="location.href='index.jsp?pageChange=ReservationConfirm_admin.jsp'">
			</td>
		</tr>
	</table>
</form>

</div>
</body>
</html>