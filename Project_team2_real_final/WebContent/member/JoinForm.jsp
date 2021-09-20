<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join - 회원가입</title>
<script type="text/javascript" src="script/member.js"></script>
<style type="text/css">

.content{
	max-width:1200px;
	min-height: 800px;
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

</head>
<body>
<div class="wrap">
<!-- 최상단 : include(Header)  -->
<jsp:include page="../include/userHeader.jsp" />
	<div class="content" align="center">
        <h2>회원가입</h2><br>
        
        <form action="join.do" method="post" name="user" onsubmit="return joinCheck()">
            <table>
                <tr height="50">
                    <td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">아이디</td>
                    <td width="350" align="center" >
                   		<input type="hidden" name="reid" size="20">
                        <input type="text" name="id" maxlength="20" size="28">
                        <input type="button" value="중복확인" onclick="idCheck()" >   
                    </td>
                </tr>
                        
                <tr height="50">
                    <td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">비밀번호</td>
                    <td width="350" align="center">
                        <input type="password" name="password1" maxlength="15" size="40">
                    </td>
                </tr>
                
                <tr height="50">
                    <td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">비밀번호 확인</td>
                    <td width="350" align="center">
                        <input type="password" name="password2" maxlength="15" size="40">
                    </td>
                </tr>
                    
                <tr height="50">
                    <td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">이름</td>
                    <td width="350" align="center">
                        <input type="text" name="name" maxlength="40" size="40">
                    </td>
                </tr>
                 <tr height="50">
                    <td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">이메일</td>
                    <td width="350" align="center">
                        <input type="email" name="email" maxlength="30" size="40">
                    </td>
                </tr>
                <tr height="50">
                    <td width="150" align="center" style="background-color:#F2F2F2; font-weight: 700;">전화번호</td>
                    <td width="350" align="center">
                        <input type="tel" name="phone" size="40" maxlength="11" placeholder="'-'을 제외한 숫자만 입력해 주세요"/>
                    </td>
                </tr>
               <tr height="80">
               		<td align="center" colspan="2">
               			<input type="button" value="취소" onclick="location.href='main.jsp'">&nbsp;&nbsp;
               			<input type="submit" value="가입"> 
           			   <!--  <input type="reset" value="다시 입력">&nbsp;&nbsp;&nbsp;&nbsp; -->
               		</td>
               </tr>
            </table>             
        </form>
        </div>
<jsp:include page="../include/userFooter.jsp" />
</div>	        
</body>
</html>