<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<% 
	if((Integer)session.getAttribute("mem_uid") != null && (int)session.getAttribute("mem_uid") != 0){
		int uid = (int) session.getAttribute("mem_uid");
		String id = (String) session.getAttribute("mem_id");	
%>

	<script>
	var mem_uid = <%=uid%>;
	var mem_id = "<%=id%>";
	</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매확인/취소</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/mypage/resManage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/JS/mypage/resManage.js"></script>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- 아이콘 -->
	<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
	
	<!-- 구글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
	
   <!-- 파비콘 설정-->
   <link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">
</head>



<body>
	<jsp:include page="../admin/managerTheme.jsp" />
	
	
		<!-- 메뉴바 밑 컨테이너 -->
<div class = "container-fluid" >
<hr>
<div class = "container">
KOREA BOX  관리자 회원 관리
</div>
<hr>
</div>



<div class = "container">
		<div class="row" id = "list">
			<div class="col-sm-12">
				<h2>영화 리스트</h2>
				<br>
			</div>
		</div>
	</div>
	
	
	<h3>현재 예매 정보 목록</h3>
	<h4>(관람일이 지난 영화는 취소 할 수 없습니다.)</h4>

	
	
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

	<jsp:include page="../admin/managerFooter.jsp" />

</body>
</html>
<% } else{%>
	<script>alert("로그인이 필요합니다"); location.href="../login"</script>
	<%}
%>