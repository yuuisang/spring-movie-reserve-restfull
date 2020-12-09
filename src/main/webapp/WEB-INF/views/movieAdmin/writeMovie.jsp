<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

    
    <!-- 관리자 영화 등록 페이지 -->
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
	
	<!-- CSS파일 
	<link rel="stylesheet" type="text/css" href="CSS/.css">
	-->
	
   <!-- 파비콘 설정-->
   <link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">
<title>KOREA BOX</title>
</head>
<body>

	<jsp:include page="../admin/managerTheme.jsp" />

	<!-- 메뉴바 밑 컨테이너 -->
<div class = "container-fluid" >
<hr>
<div class = "container">
관리자 영화 관리
</div>
<hr>
</div>
	

	<!-- 영화 등록 페이지 -->
	<div class="container">
		<h2>영화 등록</h2>

		<span>모든 항목은 필수 입력입니다.</span><br><br><br><br>
		<div class="row text-center">
			<div class="col-sm-12" align="center">
			<form action="writeMovieOk" method="post" enctype="multipart/form-data">
			<table class="table col-sm-12">
				<tr>
					<td><label class="control-label col-sm-12">제목</label></td>
					<td><input type="text" class="form-control col-sm-12" id="fname" name="mov_title"></td>
				</tr>
				<tr>
					<td><label class="control-label col-sm-12">감독</label></td>
					<td><input type="text" class="form-control" id="lname" name="mov_director"></td>
				</tr>
				<tr>
					<td><label class="control-label col-sm-12">배우</label></td>
					<td><input type="text" class="form-control" id="email" name="mov_actors"></td>
				</tr>
				<tr>
					<td><label class="control-label col-sm-12">장르</label></td>
					<td><input type="text" class="form-control" name="mov_genre" id="comment"></td>
				</tr>
				<tr>
					<td><label class="control-label col-sm-12">러닝타임</label></td>
					<td><input type="number" class="form-control" name="mov_runtime" placeholder="숫자만 입력해 주세요"></td>
				</tr>
				<tr>
					<td><label class="control-label col-sm-12">개봉일</label></td>
					<td><input type="date" class="form-control" name="mov_openDate"></td>
				</tr>
				<tr>
					<td><label class="control-label col-sm-12">심의등급</label></td>
					<td><input class="form-control" name="mov_grade"></td>
				</tr>
				<tr>
					<td><label class="control-label col-sm-12">소개</label></td>
					<td><textarea class="form-control" rows="5" name="mov_intro"></textarea></td>
				</tr>
				<tr>
					<td><label class="control-label col-sm-12">포스터</label></td>
					<td><input type="file" class="form-control" name="mov_poster"></td>
				</tr>
				<tr>
					<td><label class="control-label col-sm-12">스틸컷1</label></td>
					<td><input type="file" class="form-control" name="mov_still1"></td>
				</tr>
				<tr>
					<td><label class="control-label col-sm-12">스틸컷2</label></td>
					<td><input type="file" class="form-control" name="mov_still2"></td>
				</tr>
				<tr>
					<td><label class="control-label col-sm-12">스틸컷3</label></td>
					<td><input type="file" class="form-control" name="mov_still3"></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
	</div>
</div>

		

	<jsp:include page="../footer.jsp" />

	<!-- JS파일 -->
	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>