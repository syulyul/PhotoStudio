<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈페이지</title>
<style type="text/css">
.content {
	max-width: 1200px;
	min-height: 850px;
	height: auto;
	margin: 20px auto;
	padding-top: 100px;
}

.main_banner_top {
	/* margin-top: 20px; */
	/* margin: 20px auto; */
	/* width: 1280px;
	height: 720px; */
	object-fit: cover;
}

.main_banner_middle {
	/* width: 1280px; */
	/* height: 720px; */
	margin: 5px auto;
	/* display: flex; */
}
/* 
.main_banner_middle_title {
	width: 100%;
	float: left;
}
 */
ul {
	list-style: none;
}
/* 
a {
	text-decoration: none;
	outline: none;
}
 */
.main_banner_middle ul>li {
	/* width: 1280px; */
	/* height: 720px; */
	/* margin : 30px auto; */
	/* align: justify; */
	margin-top: 30px;
	margin-left: 20px;
	margin-right: 10px;
	display: inline-block;
}

.main_banner_bottom {
	margin: 100px auto;
	/* display: flex; */
}

.main_banner_bottom ul>li {
	margin-top: 30px;
	margin-left: 10px;
	margin-right: 10px;
	display: inline-block;
}

/* 
.main_banner_middle1 {
	flex: 1;
	width:30%;
}

.main_banner_middle2 {
	flex: 1;
	width:30%;
}

.main_banner_middle3 {
	flex: 1;
	width:30%;
} */
</style>
</head>
<body>
	<div class="wrap">


		<!-- 최상단단 : include(Header)  -->
		<jsp:include page="include/userHeader.jsp" />


		<!-- 상단 영역 -->
		<div class="content">
			<!-- 메인 이미지 링크 수정하는곳 -->
			<div class="main_banner_top" name="상단 배너 영역">
				<div style="height: 832px;">
					<a href="introduce.jsp"> <!--회사 소개 페이지 링크로 바꾸기 --> <img
						src="images/main.jpg" width="1200" height="auto">
					</a>
				</div>
			</div>


			<!-- 중간 영역 -->
			<div class="main_banner_middle" name="중간 배너 영역">
				<!-- 메인 배너 타이틀 수정하는곳 -->
				<div class="main_banner_middle_title">
					<div
						style="color: #494949; font-size: 28px; font-weight: 400; letter-spacing: 0.5px;">
						촬영 대상</div>
				</div>

				<!-- 메인 이벤트 배너 수정하는곳 -->
				<!-- <div class="main_banner_middl"> -->
				<ul>
					<li>
						<div class="main_banner_middle1" name="중간 배너1">
							<a href="#"><img src="images/main_ban01.jpg" height="426px" /></a>
						</div>
					</li>
					<li>
						<div class="main_banner_middle2" name="중간 배너2">
							<a href="#"><img src="images/main_ban02.jpg" height="426px" /></a>
						</div>
					</li>
					<li>
						<div class="main_banner_middle3" name="중간 배너3">
							<a href="#"><img src="images/main_ban03.jpg" height="426px" /></a>
						</div>
					</li>
				</ul>
			</div>
			<!-- 하단 영역  -->
			<div class="main_banner_bottom" name="하단 배너 영역">
				<!-- 메인 배너 타이틀 수정하는곳 -->
				<div class="main_banner_bottom_title">
					<div style="color: #494949; font-size: 28px; font-weight: 400; letter-spacing: 0.5px;">이벤트</div>
				</div>

				<ul>
					<li>
						<div class="main_banner_bottom1" name="중간 배너1">
							<a href="NoticeBoardInfo.jsp?num=1"><img src="images/main_ban_b01.jpg" height="300px" /></a>
						</div>
					</li>
					<li>
						<div class="main_banner_bottom2" name="중간 배너2">
							<a href="NoticeBoardInfo.jsp?num=2"><img src="images/main_ban_b02.jpg" height="300px" /></a>
						</div>
					</li>
				</ul>
			</div>


		</div>
		<!-- 최하단 : include(Footer)  -->
		<jsp:include page="include/userFooter.jsp" />
	</div>
</body>
</html>