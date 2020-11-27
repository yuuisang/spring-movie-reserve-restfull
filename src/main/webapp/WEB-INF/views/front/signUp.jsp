<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 회원가입 -->
    
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
	
	
<!-- 
	<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
	<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
	<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
-->
	<!-- CSS파일 -->
	<link rel="stylesheet" href="CSS/signUp.css">
<title>KOREA BOX</title>
</head>
<body>

<jsp:include page="theme.jsp" />

<section class = "signUp">

<div class="container-fluid px-2 px-md-4 py-5 mx-auto">
    <div class="card card0 border-0">
        <div class="row d-flex">
            <div class="col-lg-5">
                <div class="card1 pb-5">
                    <div class="row px-3">
                        <h5 class="logo">KOREA BOX</h5>
                    </div>
                    
                    <!-- 영화리뷰 슬라이드-->
                    <div class="row px-3 justify-content-center mt-4 mb-5">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                            <!--  
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" id="li1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1" id="li2"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2" id="li3" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="3" id="li4"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="4" id="li5"></li>
                                -->
                            </ol>
                            <!-- 왼쪽 슬라이드  -->
                            <div class="carousel-inner">
                            
                            <!-- 슬라이드 1 -->
                                <div class="carousel-item card border-0 card-0">
                                    <div class="text-center"> <img src="https://i.imgur.com/IjkibdE.jpg" class="img-fluid profile-pic"> </div>
                                    <h6 class="font-weight-bold mt-5">John Paul</h6> <small class="mb-2">UI/UX Designer</small>
                                    <hr width="50%">
                                    <p class="content mt-2 mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod incididunt ut labore et dolore magna aliqua.<br>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                </div>
                                
                                  <!-- 슬라이드 2 -->
                                <div class="carousel-item card border-0 card-0">
                                    <div class="text-center"> <img src="https://i.imgur.com/oW8Wpwi.jpg" class="img-fluid profile-pic"> </div>
                                    <h6 class="font-weight-bold mt-5">Ximena Vegara</h6> <small class="mb-2">UI/UX Designer</small>
                                    <hr width="50%">
                                    <p class="content mt-2 mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod incididunt ut labore et dolore magna aliqua.<br>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                </div>
                                
                                  <!-- 슬라이드 3 -->
                                <div class="carousel-item active card border-0 card-0">
                                    <div class="text-center"> <img src="https://i.imgur.com/EUYNvE1.jpg" class="img-fluid profile-pic"> </div>
                                    <h6 class="font-weight-bold mt-5">Lena Maria</h6> <small class="mb-2">Backend Developer</small>
                                    <hr width="50%">
                                    <p class="content mt-2 mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod incididunt ut labore et dolore magna aliqua.<br>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                </div>
                                
                                  <!-- 슬라이드 4 -->
                                <div class="carousel-item card border-0 card-0">
                                    <div class="text-center"> <img src="https://i.imgur.com/ndQx2Rg.jpg" class="img-fluid profile-pic"> </div>
                                    <h6 class="font-weight-bold mt-5">Richard Finch</h6> <small class="mb-2">UI/UX Designer</small>
                                    <hr width="50%">
                                    <p class="content mt-2 mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod incididunt ut labore et dolore magna aliqua.<br>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                </div>
                                
                                  <!-- 슬라이드 5 -->
                                <div class="carousel-item card border-0 card-0">
                                    <div class="text-center"> <img src="img/img1.jpg" class="img-fluid profile-pic"> </div>
                                    <h6 class="font-weight-bold mt-5">Marielle Haag</h6> <small class="mb-2">Backend Developer</small>
                                    <hr width="50%">
                                    <p class="content mt-2 mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod incididunt ut labore et dolore magna aliqua.<br>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row px-3 text-center justify-content-center mb-0 social"> <span class="fa fa-facebook-square mx-2"></span> <span class="fa fa-twitter mx-2"></span> <span class="fa fa-instagram mx-2"></span> <span class="fa fa-youtube-play mx-2"></span> </div>
                </div>
            </div>
            
            <!-- input 창 -->
				
            <div class="col-lg-7">
            	<div class = "signup">
                <div class="card2 card border-0 px-4 px-sm-5 py-5">
                    <h2 class="mb-1">KOREA BOX 회원가입</h2>
                    <p class="mb-4 text-sm">Create our account and start learning with thousands of courses</p>
						<!-- 회원가입 입력 폼 -->
						<form action="">
                        <div class="col-md-6"> <label class="mb-0">
                                <h6 class="mb-0 text-sm">이름</h6>
                            </label><input type="text" name="name" placeholder="koreait"> 
								</div>

                              <div class="col-md-6"> <label class="mb-0">
                            <h6 class="mb-0 text-sm">아이디</h6>
                        </label> <input type="text" name="id" placeholder="koreait"> 
                        </div>
                    <div class="col-md-6"> <label class="mb-0">
                            <h6 class="mb-0 text-sm">비밀번호</h6>
                        </label> <input type="password" name="password" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;"> </div>
                    <div class="col-md-6"> <label class="mb-0">
                            <h6 class="mb-0 text-sm">비밀번호 확인 </h6>
                        </label> <input type="password" name="password" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;"> </div>
                 
                                 <div class="col-md-6"> <label class="mb-0">
                            <h6 class="mb-0 text-sm">생년월일</h6>
                        </label> <input type="text" name="birth" placeholder="ex) 19970101"> </div>
                     
                          <div class="col-md-6"> <label class="mb-0">
                            <h6 class="mb-0 text-sm">전화번호</h6>
                        </label> <input type="text" name="phone" placeholder="010-0000-0000"> </div>
                     
                    <div class="col-md-6"> <label class="mb-0">
                            <h6 class="mb-0 text-sm">Email</h6>
                        </label> <input type="email" name="email" placeholder="john.doe@email.com"> </div>
                        
                   
                    <div class="row px-3 mb-3"> <small class="text-muted">By signing up, you agree our <a href="" class="text-primary">Terms of services</a> and <a href="" class="text-primary">Privacy Policy</a></small> </div>
                    <div class="row mb-4">
                        <div class="col-md-6"> <button class="btn btn-blue text-center mb-1 py-2">Create Account</button> </div>
                    </div>
                    </form>
                    </div>
                    <div class="row px-3 mb-4">
                        <div class="line"></div> <small class="text-muted or text-center">OR</small>
                        <div class="line"></div>
                    </div>
                    <div class="row text-center">
                        <div class="col-sm-6">
                            <p class="social-connect"><span class="fa fa-facebook-square"></span><small class="pl-3 pr-1">Sign up with facebook</small></p>
                        </div>
                        <div class="col-sm-6">
                            <p class="social-connect"><span class="fa fa-google-plus"></span><small class="pl-3 pr-1">Sign up with google+</small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</section>



		<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
</body>
</html>