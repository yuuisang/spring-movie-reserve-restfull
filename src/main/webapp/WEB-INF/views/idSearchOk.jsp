<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("정보가 맞지 않습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>




    <!--  -->
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
	

	<!-- 구글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
	
	
	<!-- CSS파일 -->
	<link rel="stylesheet" type="text/css" href="${path}/resources/CSS/main/idSearchOk.css">

	<!-- 파비콘 설정-->
	<link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">

<title>KOREA BOX</title>
</head>
<body>
	<jsp:include page="theme.jsp" />

	
<div class = "container-fluid" >
<hr>
<div class = "container">
아이디 / 비밀번호 찾기
</div>
<hr>
</div>
	
	
	<div class="container justify-content-center align-items-center">
	<div class = "row">

    <div class="col-md-12" id = "backimg" style="background-image: url('../../resources/img/idSearchImg.jpg');">
    	  <div class="col-md-12 text-center" id = "idDiv">
            <span class="d-block mt-3">회원님의 아이디는 </span>
            <span class="d-block mt-3"><big>${mem_id }</big> 입니다.</span>
            <span class="d-block mt-3">로그인 후 이용 부탁드립니다. 감사합니다.</span>
            <br>
            <br>
            <br>
                <div class="mx-5">
                    <div class="col-md-12"> 
                     <button class="btn btn-outline-info " type="button"  id = "btn" onclick="location.href='${path}/idpwSearch'">비밀번호 찾기</button>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <button class="btn btn-outline-info " type="button"  id = "btn" onclick="location.href='${path}/'">메인화면</button>
                     </div>
                </div>
                </div>

        </div>
    </div>	
    </div>

	

	
	<c:choose>
	<c:when test="${result == 0 }">
	<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">ID</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">찾으실 아이디가 없습니다.</div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="#">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	</c:when>

	<c:otherwise>
	<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">ID</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="#">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	</c:otherwise>
</c:choose>



	<jsp:include page="footer.jsp" />

	<!-- JS파일 -->
	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${path}/resources/JS/main/.js"></script>
</body>
</html>

	</c:otherwise>
</c:choose>