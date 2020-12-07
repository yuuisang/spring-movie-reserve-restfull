<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매확인/취소</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/mypage/resManage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/JS/mypage/resManage.js"></script>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
</head>
<body>

	<h2>현재 예매 정보 목록</h2>
	<h3>(관람일이 지난 영화는 취소 할 수 없습니다.)</h3>

	
	
	<%-- 예매 목록  --%>
	<div id="list">
		<div class="clear"></div>
		
	
		<form id="frmList" name="frmList">
			<table id="reserveTable">
				<thead>
					<th>예매번호</th>
					<th>관람일</th>
					<th>관람시간</th>
					<th>영화이름</th>
					<th>상영관</th>
					<th>예매좌석</th>
					<th>결제금액</th>
					<th>예매코드</th>
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


</body>
</html>