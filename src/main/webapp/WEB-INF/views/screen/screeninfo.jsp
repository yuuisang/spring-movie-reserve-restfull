<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/screen/screenInfo.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/JS/screen/screenInfo.js"></script>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
</head>
<body>
<div class="container">

	<div id="title">
		<h2>상영관 관리</h2>	
	</div>

	<div id="screenRegist">
		<h3>상영관 등록</h3>
		<form id="frmRegist" name="frmRegist" method="POST">
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
					<td><button class="btn danger" type="submit" id="btnRegist">상영관 등록</button>
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
					<!-- JS에서 채울예정 -->
				</tbody>
				
			</table>
		</form>
	</div>
	
	
	<%--페이징 --%>
	<div class="center">
		<ul class="pagination" id="pagination">
		</ul>
	</div>
	
		
		
</div>
</body>
</html>