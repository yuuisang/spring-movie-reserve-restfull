<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

    
    <!-- 관리자 영화 등록 페이지 -->
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
	<link rel="stylesheet" type="text/css" href="CSS/.css">
	
   <!-- 파비콘 설정-->
   <link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">

<title>KOREA BOX</title>
</head>
<body>

	<jsp:include page="managerTheme.jsp" />

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

		<span></span>

		<div class="row text-center">
			<div class="col-sm-12">
				<div class="col-sm-3"></div>

				<div class="col-sm-6" id="form1">
					<div class="container contact">
						<div class="row">
							<div class="col-md-3">
								<div class="contact-info">
								</div>
							</div>
							<div class="col-md-9">
								<form action="" method="post" id="">
									<div class="contact-form">
										<div id="message"
											class="alert alert-danger alert-dismissible fade"></div>
										<div class="form-group">
											<label class="control-label col-sm-12" for="fname">First
												Name*:</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="fname"
													placeholder="Enter First Name" name="fname">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12" for="lname">Last
												Name*:</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="lname"
													placeholder="Enter Last Name" name="lname">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12" for="email">Email*:</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" id="email"
													placeholder="Enter email" name="email">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12" for="comment">Comment*:</label>
											<div class="col-sm-10">
												<textarea class="form-control" rows="5" name="comment"
													id="comment"></textarea>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="submit" class="btn btn-default">Submit</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

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