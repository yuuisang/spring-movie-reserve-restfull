<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

    
    <!-- 회원가입 -->
    
<!DOCTYPE html>
<html>
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
	
	<!-- CSS파일 -->
	<link rel="stylesheet" href="${path }/resources/CSS/main/signUp.css">
	
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
								<div id="carouselExampleIndicators" class="carousel slide"
									data-ride="carousel">
									<!-- 왼쪽 슬라이드  -->
									<div class="carousel-inner">

										<!-- 슬라이드 1 -->
										<div class="carousel-item card border-0 card-0">
											<div class="text-center">
												<img src="${path }/resources/img/signUpimg.jpg" class="img-fluid profile-pic">
											</div>
											<h6 class="font-weight-bold mt-5">John Paul</h6>
											<small class="mb-2">UI/UX Designer</small>
											<hr width="50%">
											<p class="content mt-2 mb-0">
												Lorem ipsum dolor sit amet, consectetur adipisicing elit,
												sed do eiusmod incididunt ut labore et dolore magna aliqua.<br>Duis
												aute irure dolor in reprehenderit in voluptate velit esse
												cillum dolore eu fugiat nulla pariatur.
											</p>
										</div>

										<!-- 슬라이드 2 -->
										<div class="carousel-item card border-0 card-0">
											<div class="text-center">
												<img src="${path }/resources/img/signUpimg2.jpg"
													class="img-fluid profile-pic">
											</div>
											<h6 class="font-weight-bold mt-5">Ximena Vegara</h6>
											<small class="mb-2">UI/UX Designer</small>
											<hr width="50%">
											<p class="content mt-2 mb-0">
												Lorem ipsum dolor sit amet, consectetur adipisicing elit,
												sed do eiusmod incididunt ut labore et dolore magna aliqua.<br>Duis
												aute irure dolor in reprehenderit in voluptate velit esse
												cillum dolore eu fugiat nulla pariatur.
											</p>
										</div>

										<!-- 슬라이드 3 -->
										<div class="carousel-item active card border-0 card-0">
											<div class="text-center">
												<img src="${path }/resources/img/signUpimg3.jpg"
													class="img-fluid profile-pic">
											</div>
											<h6 class="font-weight-bold mt-5">Lena Maria</h6>
											<small class="mb-2">Backend Developer</small>
											<hr width="50%">
											<p class="content mt-2 mb-0">
												Lorem ipsum dolor sit amet, consectetur adipisicing elit,
												sed do eiusmod incididunt ut labore et dolore magna aliqua.<br>Duis
												aute irure dolor in reprehenderit in voluptate velit esse
												cillum dolore eu fugiat nulla pariatur.
											</p>
										</div>


										<!-- 슬라이드 4 -->
										<div class="carousel-item card border-0 card-0">
											<div class="text-center">
												<img src="${path }/resources/img/img1.jpg" class="img-fluid profile-pic">
											</div>
											<h6 class="font-weight-bold mt-5">Marielle Haag</h6>
											<small class="mb-2">Backend Developer</small>
											<hr width="50%">
											<p class="content mt-2 mb-0">
												Lorem ipsum dolor sit amet, consectetur adipisicing elit,
												sed do eiusmod incididunt ut labore et dolore magna aliqua.<br>Duis
												aute irure dolor in reprehenderit in voluptate velit esse
												cillum dolore eu fugiat nulla pariatur.
											</p>
										</div>
									</div>
								</div>
							</div>
							<div
								class="row px-3 text-center justify-content-center mb-0 social">

							</div>
						</div>
					</div>

					<!-- input 창 -->
 
					<div class="col-lg-7">

						<div class="signup">

							<div class="card2 card border-0 px-4 px-sm-5 py-5">

								<h2 class="mb-3" align="center">KOREA BOX 회원가입</h2>

								<p class="mb-5 text-sm" align="center">Create our account
									and start learning with thousands of courses</p>

								<!-- 회원가입 입력 폼 -->
									<div class="registration-form" id="formDiv"
										align="center">
										<form action="signUpOk" id = "formTable" class = "needs-validation" method="post" novalidate>
											<table class="table table-borderless " >

											<tr>
												<div class="form-group">

													<td><h6 class="mb-0 text-sm" id = "title">이름</h6></td>

													<td><input type="text" name="mem_name" 
														class="form-control item"  pattern="^[가-힣]{2,6}$"  required>
														                 <div class="valid-feedback">  사용 가능한 이름입니다. </div>
														  <div class="invalid-feedback" id="nameerrMsg">이름을 입력 해 주세요.</div>
													</td>
												</div>
											</tr>

											<tr>
												<div class="form-group">
													<td><h6 class="mb-0 text-sm" id = "title">아이디</h6></td>
													<td><input type="text" name="mem_id" id = "mem_id"
														class="form-control item " pattern="^[a-z][a-z\d]{4,15}$" placeholder="영문/숫자  15자 이내" required>
													</td>
													
													<td><button class="btn btn-info btn-sm mb-2 "
															type="submit" id="idOkbtn">중복확인</button>
													<span id="idcheck"></span></td>
												</div>
											</tr>

											<tr>
												<div class="form-group">
													<td>
														<h6 class="mb-0 text-sm" id = "title">비밀번호</h6>
													</td>
													<td><input type="password" name="mem_pw" id ="pw"
														class="form-control item" onchange="check_pw()" pattern="(?=.*\d{1,10})(?=.*[~`!@#$%\^&*()-+=]{1,10})(?=.*[a-zA-Z]{2,10}).{8,20}$"
														placeholder="영문+숫자+특수문자 20자 이내 " required></td>
											</tr>


											<tr>
												<div class="form-group">
												<td>
													<h6 class="mb-0 text-sm" id = "title">비밀번호 확인</h6>
												</td>
												<td><input type="password" id ="pw2"
												pattern="(?=.*\d{1,10})(?=.*[~`!@#$%\^&*()-+=]{1,10})(?=.*[a-zA-Z]{2,10}).{8,20}$" onchange="check_pw()"
												  class="form-control item" name="pwOk"
													required>&nbsp;<span id="check"></span></td>
											</tr>
									<tr>

										<div class="form-group">
										<td >
											<h6 class="mb-0 text-sm" id = "title">생년월일</h6>
										</td>
										<td><input type="date" class="form-control item"
											name="mem_birth"  min="1930-01-01" max="2019-12-31" required></td>

									</tr>


									<tr>
										<div class="form-group">
										<td>
											<h6 class="mb-0 text-sm" id = "title">전화번호</h6>
										</td>
										<td><input type="text" name="mem_phone" id = "phone-number"
											class="form-control item"  required></td>


									</tr>

									<tr>

										<div class="form-group">
											<td>
												<h6 class="mb-0 text-sm" id = "title">Email</h6>
											</td>
											<td><input type="email" name="mem_email" pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$"
												class="form-control item" 
												required></td>
											<td><button class="btn btn-info btn-sm" type="button"
													id="emailChk">이메일 인증</button></td>
										</div>

									</tr>


		
									<tr><td></td></tr>
									<tr><td></td></tr>
									<tr><td></td></tr>
									<tr>
										<div class="row mb-3">
												
												<div class = "signUpBtn" align="right" >
												<td></td>
													<td><button class="btn btn-blue mb-1 py-2" type="submit">회원가입
														하기</button></td>
												</div>
												
											
										</div>
									</tr>
								</table>
									</form>
									</div>
								
									
					<!-- 			
								         <form action="signupOk.do" class = "needs-validation" method="post" novalidate>

            <div class="form-icon" style="background-color: #C8C7ED">
               <span><i class="icon icon-user"></i></span>

            </div>
            <div class="form-group">
               <input type="text" class="form-control item" id="userID" minlength="5" maxlength="15"
                placeholder="UserID" name="user_id" required>
                  <div class="invalid-feedback" id="iderrMsg">아이디를 입력 해 주세요.</div>
            </div>
            <div class="form-group">
               <input type="password" class="form-control item" id="password" minlength="5" maxlength="15"
               placeholder="Password" name="user_pw" required>
                  <div class="invalid-feedback" id="pwerrMsg">비밀번호를 입력 해 주세요.</div>
            </div>
            <div class="form-group">
               <input type="text" class="form-control item" id="username" minlength="2" maxlength="10"
               placeholder="UserName" name="user_name" required>
                  <div class="invalid-feedback" id="nameerrMsg">이름을 입력 해 주세요.</div>
            </div>
            <div class="form-group">
               <input type="email" class="form-control item" id="email"
               placeholder="Email" name="user_email" required>
                  <div class="invalid-feedback" id="emailerrMsg">이메일을 입력 해 주세요.</div>
            </div>
            <div class="form-group">
               <input type="tel" class="form-control item" id="phone-number" 
               placeholder="Phone Number" name="user_phone" required>
                  <div class="invalid-feedback" id="phoneerrMsg">전화번호를 입력 해 주세요.</div>
            </div>

            <div class="form-group">
               <button type="submit" id ="chkBT" class="btn btn-block create-account" >계정
                  생성</button>
            </div>

         </form>
-->
							</div>
							
							
							<div class="row px-2 mb-2">
								<div class="line"></div>
								<small class="text-muted or text-center">OR</small>
								<div class="line"></div>
							</div>
							
						 <!-- 
							<div class="row text-center" id = "socialbtn">
								<div class="col-sm-5">
									<p class="social-connect">
										<span class="fa fa-facebook-square"></span><small
											class="pl-3 pr-1">Sign up with facebook</small>
									</p>
								</div>
								<div class="col-sm-5">
									<p class="social-connect">
										<span class="fa fa-google-plus"></span><small
											class="pl-3 pr-1">Sign up with google+</small>
									</p>
								</div>
							</div>
							
							-->
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
	<script type="text/javascript" src="${path}/resources/JS/main/signUp.js"></script>
	
</body>

<script type="text/javascript">

function check_pw(){
	
	
	var pw = document.getElementById('pw').value;
	
    if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
        if(document.getElementById('pw').value==document.getElementById('pw2').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.';
            document.getElementById('check').style.color='green';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        }

    }
	
}

</script>



</html>