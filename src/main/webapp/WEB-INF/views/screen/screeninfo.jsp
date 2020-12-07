<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="shortcut icon" href="img/movie_favicon.ico" type="image/x-icon">


<title>상영관 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/screen/screenInfo.css">
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<script src="${pageContext.request.contextPath }/resources/JS/screen/screenInfo.js"></script>
</head>
<body>

<jsp:include page="../admin/managerTheme.jsp" />

<div class="container">

	<div id="title">
		<h2>상영관 관리</h2>	
	</div>

	<div id="screenRegist">
		<h3>상영관 등록</h3>
		<form id="frmRegist" name="frmRegist" method="POST" onsubmit="return false">
			<table id="screenInfo">
				<tr>
					<th>상영관 명</th>
					<th>좌석 행</th>
					<th>좌석 열</th>
				</tr>
				<tr>
					<td><input type="text" name="scr_name"></td>
					<td><input type="text" name="scr_seatRow"></td>
					<td><input type="text" name="scr_seatLine"></td>
					<td><button class="btn btn-secondary btn-sm" type="submit" id="btnRegist">상영관 등록</button>
				</tr>
			</table>
		</form>
	</div>


	<div class="d01">
		<div class="left" id="pageinfo"></div>
		<div class="right" id="pageRows"></div>	
	</div>
	
	<div id="screenList">
		<h3>상영관 리스트</h3>
		<form id="frmDelete" name="frmDelete">
			<table id="screenTable">
				<thead>
					<th>상영관 고유번호</th>
					<th>상영관명</th>
					<th>좌석 행</th>
					<th>좌석 열</th>
					<th>관리</th>
				</thead>
				<tbody>
					JS에서 채울예정
				</tbody>
				
			</table>
		</form>
	</div>
	
	
	<div class="center">
		<ul class="pagination" id="pagination">
		</ul>
	</div>
	
		
		
</div>



</body>
</html>