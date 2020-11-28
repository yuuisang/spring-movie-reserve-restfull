<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 로그인 페이지 -->
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
		<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- 
		<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
	<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
	<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
	
	-->
	<!-- 구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
   
   	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <!-- CSS 파일 -->
   <link rel="stylesheet" href= "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  

	<link rel="stylesheet" type="text/css" href="CSS/login.css">
	

	<!-- 파비콘 설정-->
	<link rel="shortcut icon" href="img/movie_favicon.ico" type="image/x-icon">




	<title>KOREA BOX - Login</title>
</head>
<!--===============================================================================================-->
<body>

<jsp:include page="theme.jsp" />
	
<div class="container px-4 py-5 mx-auto">
    <div class="card card0">
        <div class="d-flex flex-lg-row flex-column-reverse">
            <div class="card card1">

                <div class="row justify-content-center my-auto">
						<div class="col-lg-8 my-5">
							<h3 class="mb-3">KOREA BOX 로그인</h3>
							<small class="text-muted">Try Hotjar BUSINESS free for 15
								days<br>Downgrade to Basic (Free Forever) anytime.
							</small>
							<div class="form-group mt-5">
								<input type="text" id="name" class="form-control" required>
								<label class="form-control-placeholder" for="name">ID</label>
							</div>
							<div class="form-group mt-4">
								<input type="password" id = "pw" class="form-control" required>
								<label class="form-control-placeholder" for="mail">PASSWORD</label>
							</div>
							<div class="row justify-content-center my-3">
								<button class="btn btn-gray">Sign up</button>
							</div>
							<div class="row justify-content-center my-2">
							
							</div>
							<div class="row justify-content-center my-2">
								<a href="#">아이디/비밀번호 찾기</a>
							</div>
						</div>
					</div>
            </div>
            <div class="card card2"> <img id="image" src="https://i.imgur.com/JayQIc8.png"> </div>
        </div>
    </div>
</div>

	<div id="dropDownSelect1"></div>
	
		<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<jsp:include page="footer.jsp" />
<!-- js파일 -->



</body>
</html>