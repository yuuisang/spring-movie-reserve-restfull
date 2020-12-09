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
	
	<!-- 파비콘 설정-->
    <link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">
	
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
												<img src="${path }/resources/img/signUpImg4.jpg"
													class="img-fluid profile-pic">
											</div>
											<h6 class="font-weight-bold mt-5">존 윅 3: 파라벨룸</h6>
											<small class="mb-2">출연 : 키아누 리브스, 할리 베리, 로렌스 피시번, 이안 맥쉐인, 제이슨 맨트조카스</small>
											<hr width="50%">
											<p class="content mt-2 mb-0">
												전설이 된 킬러 ‘존 윅’ (키아누 리브스). 룰을 어긴 죄로 그에게 현상금 1,400만 불이 붙고,전 세계 모든 킬러의 총구가 그를 향한다.
												국제암살자연맹의 파문 조치가 내려진 그는 아무런 보호도 받지 못한 채 시시각각 위험에 직면하고
												결국, 마지막 전쟁을 위해 ‘소피아’(할리 베리)를 찾아가는데…
												 <br>
												출구는 없다! 평화를 원한다면, 전쟁을 준비하라!
										</div>

										<!-- 슬라이드 2 -->
										<div class="carousel-item card border-0 card-0">
											<div class="text-center">
												<img src="${path }/resources/img/signUpImg6.jpg"
													class="img-fluid profile-pic">
											</div>
											<h6 class="font-weight-bold mt-5">가나의 혼인잔치: 언약</h6>
											<small class="mb-2">출연 : 장광, 케빈 소보, 션 알다란, 잭 힙스, J.D 파락</small>
											<hr width="50%">
											<p class="content mt-2 mb-0">
												우리는 소망을 잃어버렸다.예수의 언약을 잊어버렸다.하지만 최근 연구를 통해 숨겨둔 언약의 비밀이 드러나게 되는데…
												예수는 무엇을 약속하셨는가!역사를 통해 드러난 충격적인 비밀이
												우리의 영성을 두드린다.가장 안전하고 정확하게 언약 속 비밀을 맞이하라!
													

											</p>
										</div>

										<!-- 슬라이드 3 -->
										<div class="carousel-item active card border-0 card-0">
											<div class="text-center">
												<img src="${path }/resources/img/signUpImg7.jpg"
													class="img-fluid profile-pic">
											</div>
											<h6 class="font-weight-bold mt-5">피아니스트의 마지막 인터뷰</h6>
											<small class="mb-2">출연 : 패트릭 스튜어트, 케이티 홈즈, 지안카를로 에스포지토</small>
											<hr width="50%">
											<p class="content mt-2 mb-0">
												"베토벤,바흐,쇼팽,라흐마니노프,슈베르트
												당신의 인생은 어떤 음악을 연주하나요?"<br>
												27곡 클래식 연주와 함께 떠나는 어느 가을날의 음악여행
												세계적인 명성을 자랑하는 피아니스트 헨리 콜
												뉴욕 센트럴 파크, 링컨 센터에서 프랑스 페리고르, 스위스 알프스까지
												아름다운 도시를 여행하며 음악과 인생에 대한 깊은 대화를 나누는 두 사람.
												그 이후 헨리 콜의 피아노 연주에 새로운 변화가 일어나는데…
											</p>
										</div>

										<!-- 슬라이드 4 -->
										<div class="carousel-item card border-0 card-0">
											<div class="text-center">
												<img src="${path }/resources/img/signUpImg5.jpg"
													class="img-fluid profile-pic">
											</div>
											<h6 class="font-weight-bold mt-5">미드나이트 스카이</h6>
											<small class="mb-2">출연 : 조지 클루니, 펠리시티 존스, 데이빗 오예로위, 카일 챈들러, 데미안 비쉬어, 티파니 분</small>
											<hr width="50%">
											<p class="content mt-2 mb-0">
												원인 불명의 재앙으로 종말을 맞이한 지구, 북극에 남겨진 과학자 오거스틴과
												탐사를 마치고 귀환하던 중 지구와 연락이 끊긴 우주 비행사 설리가
												짧은 교신에 성공하며 벌어지는 이야기를 담은 넷플릭스 영화
											</p>
										</div>

										<!-- 슬라이드 5 -->
										<div class="carousel-item card border-0 card-0">
											<div class="text-center">
												<img src="${path }/resources/img/signUpImg8.jpg" class="img-fluid profile-pic">
											</div>
											<h6 class="font-weight-bold mt-5">장 미쉘 바스키아: 더 레이디언트 차일드</h6>
											<small class="mb-2">출연 : 장 미쉘 바스키아, 줄리안 슈나벨, 래리 가고시안</small>
											<hr width="50%">
											<p class="content mt-2 mb-0">
										1980년대 뉴욕 예술계에 혜성처럼 나타나, 현재까지도 자유와 저항 정신의 대명사로 많은 사랑을 받고 있는 아티스트 장 미쉘 바스키아의 
										인터뷰와 아카이브 영상을 수록한 다큐멘터리.
										 바스키아 사후 10년이 지나서야 공개되었다. 
										 감독 탐라 데이비스가 1985년에 직접 촬영한 바스키아의 인터뷰 영상을 중심으로
										  유명 아티스트, 큐레이터, 갤러리스트, 가장 친밀했던 주변 인물들의 기억 속에 살아있는
										   바스키아와 마치 불꽃 같았던 그의 예술혼을 생생히 묘사한다.
											</p>
										</div>
									</div>
								</div>
							</div>
							<div
								class="row px-3 text-center justify-content-center mb-0 social">
								<span class="fa fa-facebook-square mx-2"></span> <span
									class="fa fa-twitter mx-2"></span> <span
									class="fa fa-instagram mx-2"></span> <span
									class="fa fa-youtube-play mx-2"></span>
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
										<form action="signUpOkPage" id = "formTable" class = "needs-validation" method="post" novalidate>
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
						
													
													<td>
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
									
										</div>

									</tr>

									<tr><td></td></tr>
									<tr><td></td></tr>
									<tr><td></td></tr>
									<tr>
										<div class="row mb-3">
												
												<div class = "signUpBtn" align="right" >
												<td></td>
													<td><button class="btn btn-blue mb-1 py-2">회원가입
														하기</button></td>
												</div>
												
											
										</div>
									</tr>
								</table>
									</form>
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