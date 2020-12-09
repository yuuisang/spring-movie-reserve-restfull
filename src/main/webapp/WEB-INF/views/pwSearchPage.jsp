<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />


    <!-- 비밀번호 이메일 발송 후 보여지는 페이지 -->
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
	

	<!-- 구글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
	<!-- CSS파일 
	<link rel="stylesheet" type="text/css" href="${path }/resources/CSS/main/.css">
	-->
	<!-- 파비콘 설정-->
	<link rel="shortcut icon" href="img/movie_favicon.ico" type="image/x-icon">

<title>KOREA BOX</title>
</head>
<body>

	<jsp:include page="theme.jsp" />

		<div class="container">
			<hr>
			여백의 미
			<hr>

		</div>

<div class="container justify-content-center align-items-center">
	<div class = "row">
    <div class="col-md-12">
            <div class="col-md-12 text-center"> <img src="${path }/resources/img/pwMail.png" width="460px" id = "emailImg"> 
            <span class="d-block mt-3">인증메일이 발송되었습니다.</span>
            <span class="d-block mt-3">메일을 통해 비밀번호를 찾을 수 있습니다.</span>
            <br>
            <br>
            <br>
                <div class="mx-5">
                    <div class="col-md-12"> 
                     <button class="btn btn-outline-primary btn-lg " type="button" id = "btn" onclick="location.href='${path}/login'">로그인</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <button class="btn btn-outline-primary btn-lg" type="button"  id = "btn" onclick="location.href='${path}/'">메인화면</button> 
                     </div>
                </div>
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
<script type="text/javascript" src="${path}/resources/JS/front/
.js"></script>
</body>
</html>