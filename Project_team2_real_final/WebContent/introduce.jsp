<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 소개</title>
<style type="text/css">

.content{
	max-width:1200px;
	min-height: 850px;
	height:auto;
	margin : 20px auto;
	padding-top: 100px;
	z-index: -1;
    position:relative;
}

.main_banner_top {
	/* margin-top: 20px; */
	/* margin: 20px auto; */
	/* width: 1280px;
	height: 720px; */
	object-fit: cover;
}

.main_banner_middle{
	/* width: 1280px; */
	/* height: 720px; */
	margin : 5px auto;
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
.main_banner_middle ul > li{
	/* width: 1280px; */
	/* height: 720px; */
	/* margin : 30px auto; */
	/* align: justify; */
	margin-top: 30px;
	margin-left: 20px;
	margin-right: 10px;
	display: inline-block;
}
 
.main_banner_bottom{
	margin : 100px auto;
	/* display: flex; */
}

.main_banner_bottom ul > li {
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

.body {
	size :"50%"
	
}

.container {
	/* margin: 30px auto 30px; */
	padding-top: 80px;
	padding-bottom: 50px;
}


</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<jsp:include page="include/userHeader.jsp" />

</head>
<body>
<br><br><br><br>
		<div class="container" align="center">
						<div class="jumbotron">
								<h1 style="font-size:50px">2Zen Studio</h1>
								<p style="font-size:20px; font-family:'HY헤드라인M' " >프로필, 단체, 반려 동물, 사물, 증명 사진 전문 스튜디오 입니다.</p>			
						</div>			 				
			</div>
<!-- 슬라이드 이미지 폼 스타일 -->
<div style="text-align:center; background:#555; line-height:80px;">
	
</div>

<!-- 이 예제에서는 필요한 js, css 를 링크걸어 사용 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<style type="text/css">

.swiper-container {
	height:420px;
	border:5px solid silver;
	border-radius:7px;
	box-shadow:0 0 20px #ccc inset;
}
.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide img {
	box-shadow:0 0 5px #555;
	max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}

</style>
<div class="content">
<!-- 클래스명은 변경하면 안 됨 -->
<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><img src="images/1.PNG"  width="90%" height="90%"></div>
		<div class="swiper-slide"><img src="images/2.PNG" width="90%" height="90%"></div>
		<div class="swiper-slide"><img src="images/3.PNG" width="90%" height="90%"></div>
		<div class="swiper-slide"><img src="images/4.PNG" width="90%" height="90%"></div>
		<div class="swiper-slide"><img src="images/5.PNG" width="90%" height="90%"></div>
		<div class="swiper-slide"><img src="images/6.PNG" width="90%" height="90%"></div>
		<div class="swiper-slide"><img src="images/7.PNG" width="90%" height="90%"></div>
		<div class="swiper-slide"><img src="images/8.PNG" width="90%" height="90%"></div>
		<div class="swiper-slide"><img src="images/9.PNG" width="90%" height="90%"></div>
		<div class="swiper-slide"><img src="images/10.PNG" width="90%" height="90%"></div>		
		<div class="swiper-slide"><img src="images/11.PNG" width="90%" height="90%"></div>
		<div class="swiper-slide"><img src="images/12.PNG" width="90%" height="90%"></div>				
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>



<script>

new Swiper('.swiper-container', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 20, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
	
	autoplay : {  // 자동 슬라이드 설정 , 비 활성화 시 false
		  delay : 6000,   // 시간 설정
		  disableOnInteraction : false,  // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음
		},
	  
});
    
	

</script>

<div class="container" align="center">

								<h1 style="font-size:30px">PRICE</h1>
								<hr>	
								<br>		
								<h2 style="font-size:20px">o 스튜디오 촬영 가격</h2>
								<br>
								<p style="font-size:15px"> 시간당 평일 2만원</p>
								<p style="font-size:15px"> 시간당 주말 3만원</p>								
								<hr>
								<br>
								<p style="font-size:15px">기본 두시간부터 이용 가능</p>
								<p style="font-size:15px">기본 3인,1인 추가시 시간당 만원</p>
								<p style="font-size:15px">부가세 별도</p>	
								<br>
								<hr>
						</div>			 		
<div align="center" class="container">
<h2 style="padding-bottom: 8px;">오시는 길</h2>
<div id="daumRoughmapContainer1626406958403"
				class="root_daum_roughmap root_daum_roughmap_landing"></div>
			<script charset="UTF-8" class="daum_roughmap_loader_script"
				src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1626406958403",
					"key" : "26ndb",
					"mapWidth" : "640",
					"mapHeight" : "360"
				}).render();
			</script>

</div>	
</div>

<br><br>
<jsp:include page="include/userFooter.jsp" />
</body>
</html>