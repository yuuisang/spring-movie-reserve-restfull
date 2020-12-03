<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/show/showInfo.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/JS/show/showInfo.js"></script>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
</head>
<body>
<div id="container">

	<div id="title">
		<h2>상영 정보 목록</h2>
	</div>
	
	<div id="regist">
		<button type="submit" id="btnRegist">스케쥴 등록(설정)</button>
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
			<div>
				<h3 id="showScheduleTitle">상영시간표</h3>
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