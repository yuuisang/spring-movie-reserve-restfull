<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	
	<!-- CSS파일 -->
	<link rel="stylesheet" type="text/css" href="CSS/.css">
	
	<!-- 파비콘 설정-->
	<link rel="shortcut icon" href="img/movie_favicon.ico" type="image/x-icon">

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

		<span>모든 항목은 필수 입력입니다.</span>
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
								<form action="writeMovieOk" method="post" enctype="multipart/form-data">
									<div class="contact-form">
										<div id="message"
											class="alert alert-danger alert-dismissible fade"></div>
										<div class="form-group">
											<label class="control-label col-sm-12">제목</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="fname" name="mov_title">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12">감독</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="lname" name="mov_director">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12">배우</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="email" name="mov_actors">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12">장르</label>
											<div class="col-sm-10">
												<textarea class="form-control" rows="5" name="mov_genre"
													id="comment"></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12">러닝타임</label>
											<div class="col-sm-10">
												<textarea class="form-control" rows="5" name="mov_runtime"></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12">개봉일</label>
											<div class="col-sm-10">
												<input type="date" class="form-control" name="mov_openDate">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12">심의등급</label>
											<div class="col-sm-10">
												<textarea class="form-control" rows="5" name="mov_grade"></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12">소개</label>
											<div class="col-sm-10">
												<textarea class="form-control" rows="5" name="mov_intro"></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12">포스터</label>
											<div class="col-sm-10">
												<input type="file" class="form-control" name="mov_poster">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12">스틸컷1</label>
											<div class="col-sm-10">
												<input type="file" class="form-control" name="mov_still1">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12">스틸컷2</label>
											<div class="col-sm-10">
												<input type="file" class="form-control" name="mov_still2">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-12">스틸컷3</label>
											<div class="col-sm-10">
												<input type="file" class="form-control" name="mov_still3">
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