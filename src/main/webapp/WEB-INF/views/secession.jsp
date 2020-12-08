<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!-- 회원 탈퇴창 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

<!-- CSS파일 -->
<link rel="stylesheet" type="text/css" href="${path }/resources/CSS/main/secession.css">

<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">

   <!-- 파비콘 설정-->
   <link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">
	



<title>KOREA BOX</title>
</head>
<body>

	<jsp:include page="theme.jsp" />


	<div class="container">
		<hr>
		<div class="row">
			<div class="col-sm-12 text-left">
				<div class="col-sm-1 text-center">
					<br>
				</div>

				<h2>회원탈퇴</h2>

				<p>[주의] KOREA BOX 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
				<br>

				<p>1. 회원 탈퇴를 신청하시면 바로 로그아웃 됩니다.</p>
				<br>

				<p>2. 탈퇴 후 삭제 내역</p>
				<br>

				<p>(비밀번호 인증 성공시 모든 회원정보와 예매한 영화는 환불이 안되오니 주의해주세요.)</p>
				<br>

				<p>회원 탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없습니다.</p>
				<br>
				<p>결제 내역</p>
				<br>
				<p>영화 관람 내역</p>
				<br>
				<p>간편 로그인 연동 정보</p>
				<br>

				<p>3. 회원님의 비밀번호를 입력하시고 [탈퇴] 버튼을 클릭해주세요.</p>
				<br>
				<form>
					<div class="col-sm-8 text-center">
						<table class="table table-bordered ">
							<tr>
								<th>비밀번호</th>
								<td><input type="password" class="form-control" name="pw"
									placeholder=""></td>
							</tr>
						</table>
					</div>
					<br>
					<div class="col-sm-12 text-center">
						<button type="button" class="btn btn-light">취소</button>
						<button type="button" class="btn btn-info" id="subbtn" data-toggle="modal" data-target="#myModal">탈퇴하기</button>
				  <!-- The Modal -->
				<div class="modal fade" id="myModal" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">Modal Heading</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">Modal body..</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
							</div>

						</div>
					</div>
				</div>
					</div>
				</form>
				
				<!-- ---- -->
			</div>
		</div>
	</div>

 


	<jsp:include page="footer.jsp" />

	<!-- JS파일 -->
	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 
		<script type="text/javascript" src="JS/ss.js"></script>
		-->
</body>
</html>