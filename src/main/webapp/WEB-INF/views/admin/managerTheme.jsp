<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!-- 관리자 메뉴-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS파일 -->
<link rel="stylesheet" href="${path}/resources/CSS/front/managerTheme.css">


<title>Insert title here</title>
</head>
<body>
	<header class="header">
		<nav class="navbar navbar-expand-lg fixed-top ">
			<div class="container">
				<a href="#" class="navbar-brand text-uppercase font-weight-bold">KOREA
					BOX</a>
				<button type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation"
					class="navbar-toggler navbar-toggler-right">
					<i class="fa fa-bars"></i>
				</button>

				<div id="navbarSupportedContent" class="collapse navbar-collapse">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a href="#"
							class="nav-link text-uppercase font-weight-bold">영화 관리 <span
								class="sr-only">(current)</span></a></li>
						<li class="nav-item"><a href="#"
							class="nav-link text-uppercase font-weight-bold">예매관리</a></li>
						<li class="nav-item"><a href="#"
							class="nav-link text-uppercase font-weight-bold">상영관리</a></li>
						<li class="nav-item"><a href="#"
							class="nav-link text-uppercase font-weight-bold">상영관 관리</a></li>
						<li class="nav-item"><a href="#"
							class="nav-link text-uppercase font-weight-bold">회원관리</a></li>
						<!-- 관리자 버튼 자리 -->
						<button type="button" class="btn btn-secondary btn-sm">관리자</button>
						&nbsp;
						<button type="button" class="btn btn-secondary btn-sm">로그아웃</button>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<div id="themeDiv">
		<br>
	</div>


	<script type="text/javascript" src="JS/theme.js"></script>

</body>
</html>