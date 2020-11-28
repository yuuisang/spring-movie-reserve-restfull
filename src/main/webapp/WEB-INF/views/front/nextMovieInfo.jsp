<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 상영예정작 -> 상세정보-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- 아이콘 -->
	<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
	
	<!-- CSS파일 -->
	<link rel="stylesheet" type="text/css" href="CSS/nextMovieInfo.css">
	
	<!-- 파비콘 설정-->
	<link rel="shortcut icon" href="img/movie_favicon.ico" type="image/x-icon">

<title>KOREA BOX</title>
</head>
<body>
	<!-- 
	
		평점(별)
		개봉일
		상영시간
		감독
		출연진
		장르
	
	
	 -->

	<jsp:include page="theme.jsp" />


<!-- 메뉴바 밑 컨테이너 -->
<div class = "container-fluid" >
<hr>
<div class = "container">
홈
</div>
<hr>
</div>

<!-- 영화 상세 윗부분-->

<!-- 영화 상세 내용 컨테이너-->
	<div class="container" id="">
		<div class="row" id="movieInfo">
			<div class="col-sm-12 text-center">
				<h2>영화 제목</h2>
			</div>
		</div>
		<!-- 포스터 부분 / 상세 정보 -->
		<div class="row" id="poster">
			<div class="col-md-4 text-center" id = "posterProfile">
				<img src="img/boxOfficeImg3.jpg" alt="posterImg">
			</div>

			<!-- 상세 내용
						평점(별)
						개봉일
						상영시간
						감독
						출연진
						장르
						 -->

			<div class="col-md-8" id="box1">

				<div class="col-sm-12 text-left" id="MovieBox">

					<p>평점</p>
					<br>
					<p>개봉일</p>
					<br>
					<p>상영시간</p>
					<br>
					<p>감독</p>
					<br>
					<p>출연진</p>
					<br>
					<p>장르</p>
					<br>
				</div>

			</div>
		</div>

		<!-- 영화 줄거리 -->
		<div class="row">
			<div class="col-md-12" id="box2">
				<div class="col-sm-12 text-center">
					<h4>영화 줄거리</h4>
					<div class="col-sm-12 text-center" id="MovieStory">
						<p>LA 지역 갱들을 관리하며 상납금을 수금하는 최고의 파트너 ‘크리퍼’와 ‘데이비드’ 세상 무서울 것 없는
							이들 앞에 조직을 통째로 삼키려는 무법자 ‘코네호’가 나타난다. 지독하고 거칠게 살아남은 두 사람은 조직과 모든 것을
							지키기 위해 무자비한 피의 전쟁을 시작하는데…</p>
					</div>
				</div>

			</div>
		</div>

		<!-- 영화 스틸컷 -->
		<div class="row" id="box3">
			<div class="col-md-12">
				<div class="col-sm-12 text-center">
					<h4>영화 스틸컷</h4>

					<!-- 사진  -->
					<div class="container mt-5">
						<div class="carousel-container position-relative row">

							<!-- 메인 사진 -->
							<div id="myCarousel" class="carousel slide" data-ride="carousel">
								<div class="carousel-inner">
									<!--사진1 -->
									<div class="carousel-item active card-img "
										data-slide-number="0" >
										<img src="img/nowMovie1.jpg"  style="width : 1200px; height: 100% ;object-fit:contain;"
											class="d-block img-fluid" alt="..."
											data-type="image" data-toggle="lightbox"
											data-gallery="example-gallery">
									</div>
									<!--사진2 -->
									<div class="carousel-item card-img" data-slide-number="1"  >
										<img src="img/nowMovie2.jpg."
											style="width : 1200px; height: 100% ;object-fit:contain;"
											class=" d-block img-fluid" alt="..."
											data-type="image" data-toggle="lightbox"
											data-gallery="example-gallery">
									</div>
									<!--사진3 -->
									<div class="carousel-item card-img" data-slide-number="2">
										<img src="img/nowMovie3.jpg"
											style="width : 1200px; height: 100% ;object-fit:contain;"
											class="d-block img-fluid" alt="..."
											data-type="image" data-toggle="lightbox"
											data-gallery="example-gallery">
									</div>
								</div>
							</div>

							<!-- 하단사진 -->
							<div id="carousel-thumbs" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<div class="row mx-0">
											<!--사진1 -->
											<div id="carousel-selector-0 card-img"
												class="d-block img-fluid col-4 col-sm-2 px-1 py-2 card-img"
												data-target="#myCarousel" data-slide-to="0">
												<img src="img/nowMovie1.jpg" style="width: 200px; height: 100%;"
													class="img-fluid" alt="...">
											</div>
											<!--사진2 -->
											<div id="carousel-selector-1 card-img"
												class="d-block img-fluid col-4 col-sm-2 px-1 py-2"
												data-target="#myCarousel" data-slide-to="1">
												<img src="img/img2.jpg" style="width: 200px; height: 100%;"
													class="img-fluid" alt="...">
											</div>
											<!--사진3 -->
											<div id="carousel-selector-2 card-img"
												class="d-block img-fluid col-4 col-sm-2 px-1 py-2"
												data-target="#myCarousel" data-slide-to="2">
												<img src="img/img3.jpg" style="width: 200px; height: 100%;"
													class="img-fluid" alt="...">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--  -->


				</div>

			</div>
		</div>
		</div>
		
	
	
	<jsp:include page="footer.jsp" />

	<!-- JS파일 -->
	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>