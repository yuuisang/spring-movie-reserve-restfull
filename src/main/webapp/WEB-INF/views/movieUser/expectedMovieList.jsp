<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<c:set var="path" value="${pageContext.request.contextPath}" />
    <!-- 상영 예정작 -->
<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("상영 예정작이 없습니다.");
			history.back();
		</script>
	</c:when>

	<c:otherwise>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- 아이콘 -->
	<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
	
	<!-- 구글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
	
	<!-- CSS파일 -->
	<link rel="stylesheet" type="text/css" href="${path }/resources/CSS/main/openMovieList.css">
	
   <!-- 파비콘 설정-->
   <link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">

<title>KOREA BOX</title>
</head>
<body>

<jsp:include page="../theme.jsp"/>



<!-- 
<button onclick="location.href='${pageContext.request.contextPath }/movieUser/openMovieList'">현재 상영작</button>
 -->
    <div class="container gallery-container">
           <h1>상영 예정작</h1>

    <div class="tz-gallery">
    
        <div class="row">
		<c:choose>
			<c:when test="${empty list || fn:length(list) == 0 }">
			</c:when>

			<c:otherwise>
				<c:forEach var="dto" items="${list }">  <%-- request.getAttribute("list") --%>
					<div class="col-sm-6 col-md-4">
                       <a class="lightbox" href="${path }/resources/upload/${dto.mov_poster}">
                    <img src="${path }/resources/upload/${dto.mov_poster}" style="height:500px;" alt="Bridge">
                    </a><br>
               		<span>제목 : ${dto.mov_title }</span><br>									
					<button class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath }/movieUser/expectedViewMovie?mov_num=${dto.mov_num }'">상세보기</button>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</div>
		</div>
		</div>




   <jsp:include page="../footer.jsp" />




	<!-- JS파일 -->
	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
	</c:otherwise>
</c:choose>