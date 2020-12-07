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


<title>상영 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/show/showInfo.css">
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<script src="${pageContext.request.contextPath }/resources/JS/show/showInfo.js"></script>
</head>
<body>
	
<jsp:include page="../admin/managerTheme.jsp" />

<div class="container">

	<div id="title">
		<h2>상영 스케줄 관리</h2>
	</div>
	
	<div id="regist">
		<button type="submit" class="btn btn-secondary btn-sm" id="btnRegist">스케쥴 등록(설정)</button>
	</div>
	
	
	<div class="d01">
		<div class="left" id="pageinfo"></div>
		<div class="right" id="pageRows"></div>	
	</div>
	
	<div id="showScheduleList">
			<table id="showScheduleTable">
				<thead>
					<th>상영 고유번호</th>
					<th>영화명</th>
					<th>상영관</th>
					<th>상영날짜</th>
					<th>상영시간</th>
				</thead>
				<tbody>
					<!-- JS에서 채울예정 -->
				</tbody>
				
			</table>
	</div>
	
	
	<%--페이징 --%>
	<div class="center">
		<ul class="pagination" id="pagination">
		</ul>
	</div>
	
</div> <!-- end container -->


<%-- Modal 창 --%>
<div id="dlg_write" class="modal">
	<form class="modal-content animate" id="frmWrite" name="frmWrite" method="post">
		<div class="container">      
			<div id="showScheduleTitle">
				<!-- JS -->
			</div>
			
			<span class='close' title="Close Modal">&times;</span>
			
			<div id="showScheduleListModal">
				<table id="showScheduleTableModal">
					<thead>
						<th>상영관명</th>
						<th>7시</th>
						<th>11시</th>
						<th>15시</th>
						<th>19시</th>
						<th>23시</th>
					</thead>
					<tbody>
						<!-- JS에서 채울예정 -->
					</tbody>
					
				</table>
			</div>
		</div>
	</form>
</div>
<%--글작성 대화상자 --%>

</body>
</html>