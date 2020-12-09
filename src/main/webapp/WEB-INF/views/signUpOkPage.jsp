<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("회원 가입 실패 !!!");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 1 }">
		<script>
			alert("이름을 입력해 주세요");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 2 }">
		<script>
			alert("아이디를 입력해 주세요");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 3 }">
		<script>
			alert("비밀번호를 입력해 주세요");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 4 }">
		<script>
			alert("비밀번호확인이 비밀번호와 일치하지 않습니다");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 5 }">
		<script>
			alert("생년월일을 선택해 주세요");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 6 }">
		<script>
			alert("휴대폰 번호를 입력해 주세요");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 7 }">
		<script>
			alert("이메일을 입력해 주세요");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 8 }">
		<script>
			alert("중복된 아이디 입니다");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 9 }">
		<script>
			alert("중복된 전화번호 입니다");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 10 }">
		<script>
			alert("중복된 이메일 입니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>

    <!-- 회원가입 완료 후 보여지는 페이지 -->
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
	<!-- CSS파일 -->
	<link rel="stylesheet" href="${path }/resources/CSS/main/signUpOkPage.css">
	
	<!-- 파비콘 설정-->
	<link rel="shortcut icon" href="img/movie_favicon.ico" type="image/x-icon">

<title>KOREA BOX</title>
</head>
<body>

	<jsp:include page="theme.jsp" />


<div class = "container text-center">
	<header class="site-header" id="header">
		<h1 class="site-header__title" data-lead-id="site-header-title">WELCOME !</h1>

	</header>
	<br>

	<div class="main-content">
		<i class="fa fa-check main-content__checkmark" id="checkmark" ></i>
		<p class="main-content__body" data-lead-id="main-content-body">
		KOREA BOX 는 항상 회원님들의 입장에서 보다 좋은 서비스를 받을 수 있도록 노력하겠습니다. KOREA BOX에서 모든 영화를 누리세요!</p>
		<br>
		<br>
		<div class = "btnDIV"><button type = "button" onclick="location.href='${path}/login'" class = "btn btn-outline-success" > 로그인 </button>&nbsp;&nbsp;&nbsp;&nbsp;
		<button type = "button"  onclick="location.href='${path}/'" class = "btn btn-outline-success" > 메인화면으로 </button></div>
	
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
		<script type="text/javascript" src="${path}/resources/JS/main/.js"></script>
</body>
</html>

	</c:otherwise>
</c:choose>