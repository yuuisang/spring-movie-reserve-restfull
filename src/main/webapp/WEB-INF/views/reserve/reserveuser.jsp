<%@page import="org.springframework.util.RouteMatcher.Route"%>
<%@page import="com.goldspoon.koreabox.reserveuser.beans.ReserveUserDTO"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매(사용자)</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/CSS/reserve/reserveuser.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/JS/reserve/reserveuser.js"></script>
</head>
<body>

	<%-- 날짜 선택하는 모달창 --%><!--  가장 먼저 뜸 -->
	<div id="dateChk" class="modal">
		<!-- <form class="modal-content animate" id="frmWrite" name="frmWrite" Method="POST"> -->
		<div class="modal-content animate">
			<div class="container">
				<h3 class="title">날짜 선택</h3>
				<span class="close" title="Close Modal">&times;</span>	<!-- 닫기버튼 -->
				
				<div class="d01 btn_group_write">  <!-- 날짜 선택 a태그 -->
					<c:forEach var="i" begin="0" end="${date.size()-1 }" step="1">
						<!-- <a href="" class="default">${date[i] }</a><br> -->
						<button id="dd" class="dateChkbtn" data-toggle="modal" data-target="#insertBlack"  data-notifyid="${date[i] }" value="${date[i] }">${date[i] }</button><br>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- </form> -->
	</div>
	
	<div id="reserveform">
		<div>
			<div>날짜선택 <span id="dateselect">2020-12-30</span></div>
			
		</div>
	
	</div>
</body>
</html>

