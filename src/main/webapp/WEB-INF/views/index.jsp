<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
	
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
	<link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">
	
	<!-- CSS파일 -->
	<link rel="stylesheet" href="${path }/resources/CSS/main/index.css">



<title>KOREA BOX</title>
</head>

<body>

<%
	// 현재 로그인 상태인지 확인
	if(session.getAttribute("mem_id") != null){
	String mem_id = (String)session.getAttribute("mem_id");
%>
<header class="header">
    <nav class="navbar navbar-expand-lg fixed-top ">
        <div class="container">
        <a href="${path }/" class="navbar-brand text-uppercase font-weight-bold" >KOREA BOX</a>
            <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right"><i class="fa fa-bars"></i></button>
            
            <!-- 경로설정 하기! -->
            <div id="navbarSupportedContent" class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active dropdown"><a class="nav-link dropdown-toggle font-weight-bold"  id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> MOVIE </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="${path }/movieUser/openMovieList"">현재 상영작</a> <a
									class="dropdown-item" href="${path }/movieUser/expectedMovieList">상영 예정작</a>
							</div></li>
                    <li class="nav-item"><a href="${path }/movieUser/openMovieList" class="nav-link text-uppercase font-weight-bold">Ticketing</a></li>
                    <li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle font-weight-bold" 
							id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> MY PAGE </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="${path }/mypage/resManage">예매 확인/취소</a> <a
									class="dropdown-item" href="${path }/mypage/userInfo">회원 정보수정 /탈퇴</a>
							</div></li>
						<button type = "button" class="btn btn-secondary btn-sm">${mem_id }</button>&nbsp;
						<button type = "button" class="btn btn-secondary btn-sm" onclick="location.href='${path}/logOut'">로그아웃</button>
                </ul>
            </div>
        </div>
    </nav>
</header>
		
<%
	} else {
		
%>		<!-- 로그인 실패했을 경우 -->		
<header class="header">
    <nav class="navbar navbar-expand-lg fixed-top ">
        <div class="container">
        <a href="${path }" class="navbar-brand text-uppercase font-weight-bold" >KOREA BOX</a>
            <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right"><i class="fa fa-bars"></i></button>
            
            <!-- 경로설정 하기! -->
            <div id="navbarSupportedContent" class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active dropdown"><a class="nav-link dropdown-toggle font-weight-bold" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> MOVIE </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="${path }/movieUser/openMovieList">현재 상영작</a> <a
									class="dropdown-item" href="${path }/movieUser/expectedMovieList">상영 예정작</a>
							</div></li>
                    <li class="nav-item"><a href="${path }/movieUser/openMovieList" class="nav-link text-uppercase font-weight-bold">Ticketing</a></li>
                    <li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle font-weight-bold" 
							id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> MY PAGE </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="${path }/mypage/resManage">예매 확인/취소</a> <a
									class="dropdown-item" href="${path }/mypage/userInfo">회원 정보수정 /탈퇴</a>
							</div></li>
						<button type = "button" class="btn btn-secondary btn-sm" onclick="location.href='${path}/login'">로그인</button>&nbsp;
						<button type = "button" class="btn btn-secondary btn-sm" onclick="location.href='${path}/signUp'">회원가입</button>
                </ul>
            </div>
        </div>
    </nav>
</header>
<%				} %>
	   <!-- ======= 슬라이드 사진 ======= -->
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
					<div class="carousel-background">
						<img src="${path}/resources/img/run.jpg" alt="">
					</div>
					<div class="carousel-container">
						<div class="carousel-content">
							<h2>
								<!-- <span>The Note Book </span>  -->
							</h2>
							<!-- 
							<p>It is a long established fact that a reader will be
								distracted by the readable content of a page when looking at its
								layout. The point of using Lorem Ipsum is that it has a
								more-or-less normal distribution of letters, as opposed to using
								‘Content here, content here’, making it look like readable
								English.</p>
								<a href="#" class="contactus-btn" data-toggle="modal"
								data-target="#videoModal"
								data-theVideo="https://www.youtube.com/embed/loFtozxZG0s">VIDEO</a>
							
							 -->
							 <a href="${path }/movieUser/openMovieList"" class="contactus-btn">상세정보</a>


						</div>
									</div>
									
								</div>

								<!-- Slide 2 -->
								<div class="carousel-item">
									<div class="carousel-background">
										<img src="${path}/resources/img/Joje.jpg" alt="">
									</div>
									<div class="carousel-container">
										<div class="carousel-content">
											<!-- 
											<h2>Where does it come from</h2>
											<p>It is a long established fact that a reader will be
												distracted by the readable content of a page when looking at
												its layout. The point of using Lorem Ipsum is that it has a
												more-or-less normal distribution of letters, as opposed to
												using ‘Content here, content here’, making it look like
												readable English.</p>
											
											 -->
											 <a href="${path }/movieUser/openMovieList"" class="contactus-btn">상세정보</a>
										</div>
									</div>
								</div>

								<!-- Slide 3 -->
								<div class="carousel-item">
									<div class="carousel-background">
										<img src="${path}/resources/img/TheFrom.jpg" alt="">
									</div>
									<div class="carousel-container">
										<div class="carousel-content">
										<!-- 
											<h2>Why do we use it</h2>
											<p>There are many variations of passages of Lorem Ipsum
												available, but the majority have suffered alteration in some
												form, by injected humour, or randomised words which don’t
												look even slightly believable. If you are going to use a
												passage of Lorem Ipsum, you need to be sure there isn’t
												anything embarrassing hidden in the middle of text.</p>
											<a href="#" class="contactus-btn">상세정보</a>
										-->
										<a href="${path }/movieUser/openMovieList"" class="contactus-btn">상세정보</a>
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
		<div class=box1>
			<div class="container">
				<h3 class="text-center" id = "boxName">BOX OFFICE</h3>
				<div class="movieplus">
					<a href="${path }/movieUser/openMovieList" id ="plus"><i class="fa fa-search-plus"></i> 더 많은 영화 보기</a>
				</div>
				<br>
				<div class="row mt-30">
					<div class="col-md-3 col-sm-6">
						<div class="boxMovie">
							<img src="${path}/resources/img/boxOfficeImg.jpg" alt="">
							<div class="box-content">
								<h3 class="title">관람평 4.0</h3>
								<ul class="icon">
									<li><a href="${path }/movieUser/openMovieList"><i class="fa fa-search"></i></a></li>
									<li><a href="#"><i class="fa fa-link"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="boxMovie">
							<img src="${path}/resources/img/boxOfficeImg2.jpg" alt="">
							<div class="box-content">
								<h3 class="title">관람평 3.0</h3>
								<ul class="icon">
									<li><a href="${path }/movieUser/openMovieList"><i class="fa fa-search"></i></a></li>
									<li><a href="#"><i class="fa fa-link"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="boxMovie">
							<img src="${path}/resources/img/boxOfficeImg3.jpg" alt="">
							<div class="box-content">
								<h3 class="title">관람평 2.0</h3>
								<ul class="icon">
									<li><a href="${path }/movieUser/openMovieList"><i class="fa fa-search"></i></a></li>
									<li><a href="#"><i class="fa fa-link"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="boxMovie">
							<img src="${path}/resources/img/boxOfficeImg4.jpg" alt="">
							<div class="box-content">
								<h3 class="title">관람평 5.0</h3>
								<ul class="icon">
									<li><a href="${path }/movieUser/openMovieList"><i class="fa fa-search"></i></a></li>
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
			<h3 class="text-center" id = "boxName">MOVIE SELECTION</h3>
			<div class="catalogue2">
				<iframe width="600" height="360"
					src="https://www.youtube.com/embed/iHN5WDdQsxU" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				<br>
				<br>
				<div class="conBtext"></div>
			</div>

		</div>
	</section>
	
	
		<!-- 또다른 컨텐츠 -->
<div class="container">
    <div class="row">
        <h3 class="text-center"align="center">MOVIE SELECTION</h3>
        <div class="col-xs-12">
        </div>
    </div>
</div>


<!-- 슬라이드 상세정보 모달창 -->
	<div class="modal fade" id="videoModal" tabindex="-1" role="dialog"
		aria-labelledby="videoModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div>
						<iframe width="100%" height="350" src=""></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  푸터 -->
<jsp:include page="footer.jsp" />

	
		<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

		<script type="text/javascript" src="${path }/resources/JS/main/index.js"></script>

</body>

<script type="text/javascript">
autoPlayYouTubeModal();

//FUNCTION TO GET AND AUTO PLAY YOUTUBE VIDEO FROM DATATAG
function autoPlayYouTubeModal() {
    var trigger = $("body").find('[data-toggle="modal"]');
    trigger.click(function () {
        var theModal = $(this).data("target"),
            videoSRC = $(this).attr("data-theVideo"),
            videoSRCauto = videoSRC + "?autoplay=1";
        $(theModal + ' iframe').attr('src', videoSRCauto);
        $(theModal + ' button.close').click(function () {
            $(theModal + ' iframe').attr('src', videoSRC);
        });
    });
}
</script>
</html>

