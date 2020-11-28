<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 예매 내역 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			
			<!-- 구글폰트 -->
			<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
			
			
			<!-- CSS파일 -->
			<link rel="stylesheet" type="text/css" href="CSS/myPageTicket.css">
			
			<!-- 파비콘 설정-->
			<link rel="shortcut icon" href="img/movie_favicon.ico"
				type="image/x-icon">

<title>KOREA BOX</title>
</head>
<body>
	<jsp:include page="theme.jsp" />

	<div class="container mt-3">
		<hr>
		<div class="row" id="mypageTable">
			<div class="col-sm-12 text-left">
				<h2>나의 예매 내역</h2>
				<br>
				<div class="col-sm-12 text-left">
					<table class="table ">
						<thead class="thead-light">
							<tr>
								<th>관람일</th>
								<th>관람시간</th>
								<th>영화이름</th>
								<th>영화관</th>
								<th>예매좌석</th>
								<th>결제금액</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button"
										class="btn btn-outline-danger btn-sm">취소</button></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<!-- 페이징  -->






				</div>
				<!-- 이용안내 -->
				<p>
					<button class="btn btn-outline-light text-dark" type="button"
						data-toggle="collapse" data-target="#collapseExample"
						aria-expanded="false" aria-controls="collapseExample">이용
						안내</button>
				</p>
				<div class="collapse" id="collapseExample">
					<div class="card card-body">
						<h5>[예매 안내]</h5>
						<br> 만 4세(48개월) 이상부터는 영화티켓을 반드시 구매하셔야 입장 가능합니다.<br> 예매
						변경은 불가능하며, 취소 후 재 예매를 하셔야만 합니다.<br>
						<br>
						<h5>[예매 규정 안내]</h5>
						<br> 위탁 예매 사이트 이용 시 취소 및 환불 규정은 해당 사이트 규정을 따릅니다.<br>
						LIVE 공연 콘텐트는 취소 기준은 아래와 같습니다.<br> 공연 및 영화 관람시 시작 시간 이후에는 입장이
						제한 됩니다.<br> 발권된 티켓은 상영시간 전까지 현장 및 사이트에서 취소가 가능합니다.<br>
					</div>
				</div>
			</div>

		</div>
	</div>





	<jsp:include page="footer.jsp" />

	<!-- JS파일 -->

	<script type="text/javascript" src="JS/.js"></script>
	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>