<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
    
    <!-- 404 에러 -->

<!DOCTYPE html>
<html>
<head>
	<title>404 Error Page </title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- 파비콘 설정-->
	<link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">	
	<!-- CSS파일 -->
	<link rel="stylesheet" type="text/css" href="CSS/error.css">
	
</head>
<body>
<section id="error">
	<div class="content">
		<i class="fa fa-warning"></i>
		<h1>404</h1>
		<p>Error occurred! - File not Found</p>
		<a class="back" href="#">Back</a>
	</div>
</section>
<footer>
	<p>© 2020 404 Error. KOREA BOX <a class="w3hubs" href="">KoreaBox.com</a></p>
</footer>

</body>
</html>