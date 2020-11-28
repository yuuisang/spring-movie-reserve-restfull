<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>예매 관리 페이지(관리자)</title>
<!-- 스타일, js 라이브러리 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/CSS/reserve/reserveinfo.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<script src="${pageContext.request.contextPath }/resources/JS/reserve/reserveinfo.js"></script>
</head>
<body>
	<h2>예매 관리 목록</h2>

	
	
	<%-- 예매 목록  --%>
	<div id="list">
		<!-- <div class="d01">
			<div class="left" id="pageinfo"></div>
			<div class="right" id="pageRows"></div>	
		</div> -->
		<div class="clear"></div>
		
	<!-- 아이디로 찾기 -->
	<form name="search">
		예매아이디
		<input type="text" name="res_memberId">
		<button type="submit">찾기</button>
	</form>
		
		
	
		<form id="frmList" name="frmList">
			<table id="reserveTable">
				<thead>
					<th>번호</th>
					<th>예매번호</th>
					<th>예매자</th>
					<th>예매영화</th>
					<th>상영관</th>
					<th>예매날짜</th>
					<th>예매시간</th>
					<th>예매좌석</th>
					<th>결제가격</th>
					<th>결제일</th>
					<th></th>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</form>
		
		
	
	</div>
	
	<div class="clear"></div>
	
	<%--페이징 --%>
	<div class="center">
		<ul class="pagination" id="pagination">
		</ul>
	</div>
	
<%-- 	<div class="modal" id="cancelChk">
		<div class="modal-content">
			<div class="container">
				예매를 취소하시겠습니까?
				<button type="button" id="viewDelete">예</button>
				<button type="button">아니요</button>
				<input type="hidden" name="res_num" value="${list.res_num }"/> 삭제나 수정을 위해 필요
			</div>
		</div>
		
	</div> --%>
	


</body>
</html>