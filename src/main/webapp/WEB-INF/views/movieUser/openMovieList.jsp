<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#openMovieListDiv{
	float: left;
}

</style>
</head>
<body>
<h1>현재 상영작</h1>

<button onclick="location.href='${pageContext.request.contextPath }/movieUser/expectedMovieList'">상영 예정작</button>

		<c:choose>
			<c:when test="${empty list || fn:length(list) == 0 }">
			</c:when>

			<c:otherwise>
				<c:forEach var="dto" items="${list }">  <%-- request.getAttribute("list") --%>
					<div id="openMovieListDiv">
						<div><img class="card-img-top" src="../resources/upload/${dto.mov_poster}" style="width:300px; height:300px;"></div>
						<span>${dto.mov_title }</span>										
					<button onclick="location.href='${pageContext.request.contextPath }/movieUser/openViewMovie?mov_num=${dto.mov_num }'">상세보기</button>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
</body>
</html>