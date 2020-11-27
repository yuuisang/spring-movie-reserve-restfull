<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	int writePages = 10;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/managementMovie.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
</head>
<body>

<div id="allDiv">
	<h1>영화관리</h1>
	<br><br><br><br><br>
	<h2>영화 리스트</h2>
	<br>
	<button id="movieWrite" onclick="location.href='${pageContext.request.contextPath }/movieAdmin/writeMovie'">영화 등록</button>
	<br>
	<table id="movieListTable">
		<tr>
			<td>번호</td>
			<td>영화제목</td>
			<td>감독</td>
			<td>배우</td>
			<td>장르</td>
			<td>러닝타임</td>
			<td>개봉일</td>
			<td>나이등급</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<c:choose>
			<c:when test="${empty list || fn:length(list) == 0 }">
			</c:when>

			<c:otherwise>
				<c:forEach var="dto" items="${list }">  <%-- request.getAttribute("list") --%>
					<tr>
						<td>${dto.mov_num }</td>
						<td>${dto.mov_title }</td>
						<td>${dto.mov_director }</td>
						<td>${dto.mov_actors }</td>
						<td>${dto.mov_genre }</td>
						<td>${dto.mov_runtime }</td>
						<td>${dto.mov_openDate }</td>
						<td>${dto.mov_grade }</td>
						<td><button onclick="location.href='${pageContext.request.contextPath }/movieAdmin/updateMovie?mov_num=${dto.mov_num }'">수정</button></td>
						<td><button onclick="location.href='${pageContext.request.contextPath }/movieAdmin/deleteMovieOk?mov_num=${dto.mov_num }'">삭제</button></td>				
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
			
	</table>
	
	<%--페이징 --%>
	<!-- 
<div class="center">
	<ul class="pagination" id="pagination">
	</ul>
</div>
 -->
 
 		<%--페이징 --%>
 		<jsp:include page="pagination.jsp">
			<jsp:param value="<%= writePages %>" name="writePages"/>
			<jsp:param value="${totalPage }" name="totalPage"/>
			<jsp:param value="${curPage }" name="curPage"/>
		</jsp:include>
	
</div>

</body>
</html>