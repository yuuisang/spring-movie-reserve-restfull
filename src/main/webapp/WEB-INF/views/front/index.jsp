<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 메인페이지 -->

<!DOCTYPE html>
<html >
<head>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- 아이콘 -->
	<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
	
	<!-- 구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
	
	<!-- 파비콘 설정-->
	<link rel="shortcut icon" href="img/movie_favicon.ico" type="image/x-icon">
	
	<!-- CSS파일 -->
	<link rel="stylesheet" href="CSS/index.css">



<!-- 
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
 -->

<title>KOREA BOX</title>

</head>
<body>
<header class="header">
    <nav class="navbar navbar-expand-lg fixed-top ">
        <div class="container"><a href="#" class="navbar-brand text-uppercase font-weight-bold">KOREA BOX</a>
            <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right"><i class="fa fa-bars"></i></button>
            
            <div id="navbarSupportedContent" class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active"><a href="#" class="nav-link text-uppercase font-weight-bold">Home <span class="sr-only">(current)</span></a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-uppercase font-weight-bold">About</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-uppercase font-weight-bold">Gallery</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-uppercase font-weight-bold">Portfolio</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-uppercase font-weight-bold">Contact</a></li>
                    <li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle font-weight-bold" href="#"
							id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> MY PAGE </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="#">예매 확인/취소</a> <a
									class="dropdown-item" href="#">회원 정보수정 /탈퇴</a>
							</div></li>
						<button class="btn btn-secondary btn-sm">로그인</button>&nbsp;
						<button class="btn btn-secondary btn-sm">회원가입</button>
                </ul>
            </div>
        </div>
    </nav>
</header>
	
		
	   <!-- ======= Header Slider Section ======= -->
    <header id="header">
        <div id="headerCarousel" class="carousel slide carousel-fade" data-ride="carousel">

            <!-- Slide Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#headerCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#headerCarousel" data-slide-to="1"></li>
              <li data-target="#headerCarousel" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner" role="listbox">
              <!-- Slide 1 -->
              <div class="carousel-item active">
                <div class="carousel-background"><img src="img/img1.jpg" alt=""></div>
                <div class="carousel-container">
                  <div class="carousel-content">
                    <h2>Welcome to <span>Shuffle</span></h2>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ‘Content here, content here’, making it look like readable English.</p>
                    <a href="#" class="contactus-btn">예매하기</a>
                  </div>
                </div>
              </div>

              <!-- Slide 2 -->
              <div class="carousel-item">
                <div class="carousel-background"><img src="img/img2.jpg" alt=""></div>
                <div class="carousel-container">
                  <div class="carousel-content">
                    <h2>Where does it come from</h2>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ‘Content here, content here’, making it look like readable English.</p>
                    <a href="#" class="contactus-btn">예매하기</a>
                  </div>
                </div>
              </div>

              <!-- Slide 3 -->
              <div class="carousel-item">
                <div class="carousel-background"><img src="img/img1.jpg" alt=""></div>
                <div class="carousel-container">
                  <div class="carousel-content">
                    <h2>Why do we use it</h2>
                    <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don’t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn’t anything embarrassing hidden in the middle of text.</p>
                    <a href="#" class="contactus-btn">예매하기</a>
                  </div>
                </div>
              </div>
            </div>

            <!-- Carousel pre and next arrow -->
            <a class="carousel-control-prev" href="#headerCarousel" role="button" data-slide="prev">
          
            </a>

            <a class="carousel-control-next" href="#headerCarousel" role="button" data-slide="next">
         
            </a>
        </div>
    </header>
	
	<!-- 박스오피스 -->

	<section class="conA">
		<!-- 

			<div class="title">
				<h2>박스오피스</h2>
			</div>
			<div class="movieplus">
				<a href="#">더 많은 영화 보기</a>
			</div>
			<div class="boximg">
				<div class="movieImg">
					<img src="img/movie1.jpg" style="width: 200px; heigth: 400px;">
					<button type="button" class="btn btn-outline-dark">예매하기</button>
				</div>
				<div class="movieImg">
					<img src="img/movie2.jpg" style="width: 200px; heigth: 400px;">
					<button type="button" class="btn btn-outline-dark">예매하기</button>
				</div>
				<div class="movieImg">
					<img src="img/movie3.jpg" style="width: 200px; heigth: 400px;">
					<button type="button" class="btn btn-outline-dark">Dark</button>
				</div>
				<div class="movieImg">
					<img src="img/movie4.jpg" style="width: 200px; heigth: 400px;">
					<button type="button" class="btn btn-outline-dark">Dark</button>
				</div>
			
		</div>
	</section>
	 -->
		<div class=box1>
			<div class="container">
				<h3 class="text-center">박스 오피스</h3>
				<div class="movieplus">
					<a href="#">더 많은 영화 보기</a>
				</div>
				<div class="row mt-30">
					<div class="col-md-3 col-sm-6">
						<div class="box15">
							<img src="img/boxOfficeImg.jpg" alt="">
							<div class="box-content">
								<h3 class="title">관람평 8.7</h3>
								<ul class="icon">
									<li><a href="#"><i class="fa fa-search"></i></a></li>
									<li><a href="#"><i class="fa fa-link"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="box15">
							<img src="img/boxOfficeImg2.jpg" alt="">
							<div class="box-content">
								<h3 class="title">관람평 8.6</h3>
								<ul class="icon">
									<li><a href="#"><i class="fa fa-search"></i></a></li>
									<li><a href="#"><i class="fa fa-link"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="box15">
							<img src="img/boxOfficeImg3.jpg" alt="">
							<div class="box-content">
								<h3 class="title">관람평 8.1</h3>
								<ul class="icon">
									<li><a href="#"><i class="fa fa-search"></i></a></li>
									<li><a href="#"><i class="fa fa-link"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="box15">
							<img src="img/boxOfficeImg4.jpg" alt="">
							<div class="box-content">
								<h3 class="title">관람평 8.5</h3>
								<ul class="icon">
									<li><a href="#"><i class="fa fa-search"></i></a></li>
									<li><a href="#"><i class="fa fa-link"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- MOVIE SELECTION( 유투브 영상 + 포스터) -->
	<section class="conB">
		<div class="container">
			<h3 class="text-center">MOVIE SELECTION</h3>
			<div class="catalogue2">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/iHN5WDdQsxU" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				<br>
				<br>
				<div class="conBtext"></div>
			</div>

		</div>
	</section>
	
<div class="container">
    <div class="row">
        <div class="col-xs-12">
        
        </div>
    </div>
</div>

<!--  푸터 -->
<jsp:include page="footer.jsp" />

	
		<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

		<script type="text/javascript" src="JS/index.js"></script>

</body>
</html>

