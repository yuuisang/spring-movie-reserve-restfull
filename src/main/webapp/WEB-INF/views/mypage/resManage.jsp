<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />



<!--  예매 확인/ 취소 -->
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
<title>KOREA BOX</title>
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
	<jsp:include page="../theme.jsp" />

<div class = "container-fluid" >
<hr>
<div class = "container">
현재 예매목록
</div>
<hr>
</div>


<div class = "container">
		<div class="row" id = "title">
			<div class="col-sm-12">
				<h4>나의 예매 목록</h4>
				<h5>관람일이 지난 영화는 취소 할 수 없습니다.</h5>
				<br>
			</div>
		</div>

	
	
	<%-- 예매 목록  --%>
	<div id="list">
		<div class="clear"></div>
		
	
		<form id="frmList" name="frmList">
			<table id="reserveTable" class = "table  table-hover">
				<thead class = "thead-dark">
					<th scope="col" >예매번호</th>
					<th scope="col">관람일</th>
					<th scope="col">관람시간</th>
					<th>영화이름</th>
					<th>상영관</th>
					<th>예매좌석</th>
					<th>결제금액</th>
					<th>예매코드</th>
					<th>결제일</th>
					<th> </th>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</form>
		
		
	
	</div>
</div>

	
	<%--페이징 --%>
	<div class="center">
		<ul class="pagination" id="pagination">
		</ul>
	</div>

	<jsp:include page="../footer.jsp" />

</body>
</html>
<% } else{%>
	<script>alert("로그인이 필요합니다"); location.href="../login"</script>
	<%}
%>