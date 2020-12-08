<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
    
    <!-- 로그인 페이지 -->
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
		<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
   	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- 구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
   
   <!-- CSS 파일 -->
   <link rel="stylesheet" href= "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
	<link rel="stylesheet" href="${path }/resources/CSS/main/login.css">
	

	<!-- 파비콘 설정-->
	<link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">




	<title>KOREA BOX - Login</title>
</head>

<body>

<jsp:include page="theme.jsp"/>

	
	
<div class="container px-4 py-5 mx-auto">
    <div class="card card0">
        <div class="d-flex flex-lg-row flex-column-reverse">
            <div class="card card1">

                <div class="row justify-content-center my-auto">
						<div class="col-lg-8 my-5">
							<h3 class="mb-3 text-center" " id = "login" >LOGIN</h3>
							<br>
							<small class="text-muted">영화를 사랑하는 여러분!<br>코리아박스 영화관에 오신 것을 환영합니다.
							</small>
 							<form class="login100-form validate-form" action="loginOk">
							<div class="form-group mt-5">
								<input type="text" name="mem_id" id="id" class="form-control" required>
								<label class="form-control-placeholder" for="name"><i class="fa fa-user"></i> ID</label>
							</div>
							<div class="form-group mt-4">
								<input type="password" name="mem_pw" id = "pw" class="form-control" required>
								<label class="form-control-placeholder" for="mail"><i class="fa fa-lock"></i> PASSWORD</label>
							</div>
							<div class="row justify-content-center my-3">
								<button class="btn btn-gray" id = "signup">로그인</button>
							</div>
							<div class="row justify-content-center my-2">
							
							</div>
							<div class="row justify-content-center my-2">
								<a href="${path }/idpwSearch" id = "idpwSC">아이디/비밀번호 찾기</a>
							</div>
							</form>
						</div>
					</div>
            </div>
            <div class="card card2"> <img id="image" src="${path}/resources/img/loginImg2.png"> </div>
        </div>
    </div>
</div>


<jsp:include page="footer.jsp" />
	
		<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



<!-- js파일 -->



</body>
</html>