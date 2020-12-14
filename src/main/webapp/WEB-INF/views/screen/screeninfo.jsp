<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!--  상영관 관리 -->
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
	
	<!-- 파비콘 설정-->
	<link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">


<title>KOREA BOX</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/CSS/screen/screenInfo.css">
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<script src="${path}/resources/JS/screen/screenInfo.js"></script>
</head>
<body>

<jsp:include page="../admin/managerTheme.jsp" />

	<!-- 메뉴바 밑 컨테이너 -->
	<div class="container-fluid">
		<hr>
		<div class="container">KOREA BOX 관리자 상영관 관리</div>
		<hr>
	</div>

	<div class="container">


		<div class="row">
			<div class="col-sm-12">
				<div id="screenRegist">
					<h2 align="center">상영관 등록</h2>
					<div class="formDiv">
						<form id="frmRegist" name="frmRegist" method="POST"
							onsubmit="return false">
							<table id="screenInfo" class="table">
								<tr>
									<th>상영관 명</th>
									<th>좌석 행</th>
									<th>좌석 열</th>
								</tr>
								<tr>
									<td><input type="text" name="scr_name"
										class="form-control-lg"></td>
									<td><input type="text" name="scr_seatRow"
										class="form-control-lg"></td>
									<td><input type="text" name="scr_seatLine"
										class="form-control-lg"></td>
								</tr>

							</table>
							<div class = "btnDiv" >
								<button class="btn btn-secondary btn-md" type="submit"
									id="btnRegist">상영관 등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12">

				<div id="screenList">
					<h2 align="center">상영관 리스트</h2>
					
					<form id="frmDelete" name="frmDelete">
						<table id="screenTable" class="table table-hover">
							<thead class="thead-dark">
								<th>상영관 고유번호</th>
								<th>상영관명</th>
								<th>좌석 행</th>
								<th>좌석 열</th>
								<th>관리</th>
							</thead>
							<tbody>
							</tbody>

						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="center">
		<ul class="pagination" id="pagination">
		</ul>
	</div>


	<jsp:include page="../admin/managerFooter.jsp" />

</body>
</html>