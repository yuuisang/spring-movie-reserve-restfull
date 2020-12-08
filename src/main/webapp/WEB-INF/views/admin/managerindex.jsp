<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
    
    <!-- 관리자 메인 페이지 -->
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


	
	<!-- CSS파일-->
	<link rel="stylesheet" type="text/css" href="${path }resources/CSS/main/managerIndex.css">
   <!-- 파비콘 설정-->
   <link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">

<title>KOREA BOX</title>
</head>
<body>

<!-- 

	-->
	<jsp:include page="managerTheme.jsp" />
	
	<!-- 메뉴바 밑 컨테이너 -->
<div class = "container-fluid" >
<hr>
<div class = "container">
관리자 영화 관리
</div>
<hr>
</div>

	<div class="container">
		<div class="row" id = "list">
			<div class="col-sm-12">
				<h2>영화 리스트</h2>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
			<div align="right">
			<button type="button" class="btn btn-secondary"  id = "movieBtn">영화 등록</button>
			</div>
			<br>
				<table class="table table-hover" id = "listTable">
					<thead class="thead-dark">
						<tr>
							<th scope="col">번호</th>
							<th scope="col">영화제목</th>
							<th scope="col">감독</th>
							<th scope="col">배우</th>
							<th scope="col">장르</th>
							<th scope="col">러닝타임</th>
							<th scope="col">개봉일</th>
							<th scope="col">영화등급</th>
							<th scope="col"></th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@md</td>
							<td>Marsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfssdk</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
							<td ><button type="button" class="btn btn-outline-secondary ">수정</button></td>
							<td ><button type="button" class="btn btn-outline-secondary ">삭제</button>
							</td>


						</tr>
						<tr>
							<td scope="row">2</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
							
						</tr>
						<tr>
							<td scope="row">3</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
						</tr>
						<tr>
							<td scope="row">4</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

















	<jsp:include page="managerFooter.jsp" />

	<!-- JS파일 -->
	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>