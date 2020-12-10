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
                  <button type = "button" class="btn btn-secondary btn-sm" onclick="location.href='${path}/logOut'">로그아웃</button>&nbsp;
                  <%
                  if(session.getAttribute("mem_id").equals("admin")){
                  %>
                  <button type = "button" class="btn btn-secondary btn-sm" onclick="location.href='${path}/movieAdmin/managementMovie'">관리자 페이지</button>
                  <%
                  }
                  %>
                </ul>
            </div>
        </div>
    </nav>
</header>
      
<%
   } else {
      
%>      <!-- 로그인 실패했을 경우 -->      
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
<%            } %>
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
			<h3 class="text-center" id = "boxName">MOVIE SELECTION</h3>
		<div class="container" id = "youtube">
					<iframe width="560" height="315" src="https://www.youtube.com/embed/i14_KoUp54Q" 
					frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope;
					 picture-in-picture" allowfullscreen></iframe>
				<br>
				<br>
				<div class="conBtext"></div>
			</div>

	</section>


<div class="container">
    <header class="text-center">
        <h1>EVENT</h1>
        </header>
	<div class="row" >
	  <div class="col-md-8 col-sm-12 co-xs-12 gal-item">
		   <div class="row h-50">
				  <div class="col-md-12 col-sm-12 co-xs-12 gal-item">
							<div class="box">
						 <img src="${path }/resources/img/indexImg11.jpg" class="img-ht img-fluid rounded">
							</div>
					</div>
			</div>
	  
	    <div class="row h-50">
				 <div class="col-md-6 col-sm-6 co-xs-12 gal-item">
				  <div class="box">
					<img src="${path }/resources/img/indexImg9.jpg" class="img-ht img-fluid rounded">
				</div>
				</div>

				<div class="col-md-6 col-sm-6 co-xs-12 gal-item">
				 <div class="box">
					<img src="${path }/resources/img/indexImg7.jpg" class="img-ht img-fluid rounded">
				</div>
				</div>
            </div>
      </div>

	

           <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
			   <div class="col-md-12 col-sm-6 co-xs-12 gal-item h-25">
				<div class="box">
					<img src="${path }/resources/img/indexImg12.jpg" class="img-ht img-fluid rounded">
				</div>
				</div>

				  <div class="col-md-12 col-sm-6 co-xs-12 gal-item h-75">
				   <div class="box">
					<img src="${path }/resources/img/indexImg13.jpg" class="img-ht img-fluid rounded">
				</div>
				</div>
            </div>
</div>
	<br/>
</div>

    <!-- End Photo Gallery -->
		
		
		<!-- 자주묻는 질문 -->
<div class="container-lg">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-title">FAQ</h1>
			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h2 class="clearfix mb-0">
							<a class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"><i class="fa fa-chevron-circle-down"></i>
							 카드로 결제할 경우 환불은 언제 되나요?</a>									
						</h2>
					</div>
					<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
							<div class="card-body">
								■ 환불안내<br>  ㆍ 신용카드<br> - 결제 후 3일 이내 취소시 승인취소 가능합니다.<br> - 3일 이후 예매
								취소 시 영업일 기준 3일 ~7일 이내 카드사에서 환불됩니다.<br> ㆍ 체크카드<br> - 결제
								후 3일 이내 취소 시 당일 카드사에서 환불 처리됩니다.<br> - 3일 이후 예매 취소 시 카드사에 따라
								3일 ~ 10일 이내 카드사에서 환불됩니다.<br> ㆍ 휴대폰 결제<br> - 결제 일자 기준
								당월(1일~말일까지) 취소만 가능합니다.<br> - 익월 취소의 경우 롯데시네마
								고객센터(1544-8855)로 문의 주시기 바랍니다.
							</div>
						</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingTwo">
						<h2 class="mb-0">
							<a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><i class="fa fa-chevron-circle-down"></i>
							 상영관 내 외부 음식물 반입 제한 안내</a>
						</h2>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
							<div class="card-body">롯데시네마에서는 상영관 내 외부 음식물 반입이 가능합니다. 다만,
								강한 냄새로 인해 타 고객님에게 불쾌감 또는 영화관람에 방해가 되는 음식의 경우 쾌적한 영화관람과 안전을 위해
								상영관 입장 전 외부에서 음식을 취식 후 입장해 주실 것을 안내하고 있습니다. 다소 불편한 점이 있더라도 고객님의
								너른 양해 부탁드립니다.</div>
						</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h2 class="mb-0">
							<a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><i class="fa fa-chevron-circle-down"></i> 
							아이디와 비밀번호를 잃어 버렸습니다.</a>                     
						</h2>
					</div>
					<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
							<div class="card-body">로그인 화면 하단에 ID/PW찾기 버튼을 통해 확인하실 수 있습니다. <br>
							아이디 찾기의 경우, 기존 회원정보에 등록된 휴대폰번호가 변경된 경우, 본인인증 찾기를 통해서 확인하실
								수 있습니다. * ID/PW 찾기가 원활하지 않을 경우, 대표번호 1544-0070 (운영시간
								09:00~21:00) > 상담원 연결 후 문의주시기 바랍니다.</div>
						</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingFour">
						<h2 class="mb-0">
							<a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour"><i class="fa fa-chevron-circle-down"></i> 
							[예매/관람권] 인터넷 예매 후 예매내용 확인은 어떻게 하나요?</a>                               
						</h2>
					</div>
					<div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
							<div class="card-body">인터넷 예매 후 예매내역 확인을 원하시는 경우 다음과 같이
								확인하세요.<br>
								 ■ 홈페이지에서 확인 시 - 홈페이지 로그인 → [My Page] → [나의 예매확인]</div>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 컨텐츠 4-->

    
    <section id="testimonial">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>BOUTIQUE CINEMA</h2>
                    </div>
                </div>
                <div class="col-12">
                    <div id="testimonialCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Slide Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#testimonialCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#testimonialCarousel" data-slide-to="1"></li>
                            <li data-target="#testimonialCarousel" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <!-- Slide 1 -->
                            <div class="carousel-item active">
                                <div class="carousel-content">
                                    <div class="client-img"><img src="${path }/resources/img/indeximg14.png" alt="Testimonial Slider" /></div>
                                    <p style="text-align: center;"><i>단지, 보고, 듣는 영화에 만족할 수 없는 당신을 위해! 드라마틱한 이미지, 입체적인 사운드,<br>
                                     몰입에 최적화 된 공간까지! 최상의 영화를 경험하는 단 하나의 시네마, Dolby Cinema <br>국내 최초 메가박스 코엑스에서 만나보세요.</i></p>
                                    <h4><span>-</span> KOREA BOX BOUTIQUE CINEMA <span>-</span></h4>
                                </div>
                            </div>
                            <!-- Slide 2 -->
                            <div class="carousel-item">
                                <div class="carousel-content">
                                    <div class="client-img"><img src="${path }/resources/img/indeximg15.png" alt="Testimonial Slider" /></div>
                                    <p style="text-align: center;"><i>상영관 내 음식 주문이 가능한 룸서비스 <br>편안한 관람을 위해 제공되는 스위트 패키지 (프리미엄 웰컴 음료, 무릎담요, 실내용 슬리퍼, 물티슈)<br>
                                    와인 콜키지 서비스</i></p>
                                    <h4><span>-</span> KOREA BOX BOUTIQUE CINEMA <span>-</span></h4>
                                </div>
                            </div>
                            <!-- Slide 3 -->
                            <div class="carousel-item">
                                <div class="carousel-content">
                                    <div class="client-img"><img src="${path }/resources/img/indeximg16.png" alt="Testimonial Slider" /></div>
                                    <p style="text-align: center;"><i>영화 속 각각의 사운드를 개별적으로 컨트롤하는 가장 진화된 입체음향<br>
                                    카네기홀과 오페라하우스에서 사용하는 마이어 스피커 69개 설치<br>
                                    세계적인 사운드 디자이너 밥매카시의 튜닝을 통해 최적화된 영화 사운드 전달</i></p>
                                    <h4><span>-</span> KOREA BOX BOUTIQUE CINEMA <span>-</span></h4>
                                </div>
                            </div>
                            <!-- Slider pre and next arrow -->
                            <a class="carousel-control-prev text-white" href="#testimonialCarousel" role="button" data-slide="prev">
                                <i class="fa fa-chevron-left"></i>
                            </a>
                            <a class="carousel-control-next text-white" href="#testimonialCarousel" role="button" data-slide="next">
                                <i class="fa fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

    </section>


	<!--  푸터 -->
<jsp:include page="footer.jsp" />

	<script>
$(document).ready(function(){
	// Add minus icon for collapse element which is open by default
	$(".collapse.show").each(function(){
		$(this).prev(".card-header").addClass("highlight");
	});
	
	// Highlight open collapsed element 
	$(".card-header .btn").click(function(){
		$(".card-header").not($(this).parents()).removeClass("highlight");
		$(this).parents(".card-header").toggleClass("highlight");
	});
});

$(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });

</script>
		<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

		<script type="text/javascript" src="${path }/resources/JS/main/index.js"></script>

</body>

</html>
