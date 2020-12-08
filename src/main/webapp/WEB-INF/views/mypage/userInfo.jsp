<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!--  개인정보 수정  -->
<% 
   if((Integer)session.getAttribute("mem_uid") != null && (int)session.getAttribute("mem_uid") != 0){
      int uid = (int)session.getAttribute("mem_uid");       
%>
<script>
var uid = <%= uid %>;
var path = "${pageContext.request.contextPath }";
</script>


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
   
   <!-- 구글 폰트 -->
   <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">


    <!-- 파비콘 설정-->
   <link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">
   <!--  CSS  -->
   <link rel="stylesheet" type="text/css" href="${path}/resources/CSS/mypage/userInfo.css">

<title>KOREA BOX</title>

</head>
<body>

<jsp:include page="../theme.jsp" />

<div class="container2">
   
   <div id="userUpdate">
      <div id="title1">
         <h2>회원정보수정</h2>
      </div>
      <div id="initUpdate">
         <!-- JS에서처리 -->
      </div>
      
   </div>
   
   <div id="userDelete">
      <div id="title2">
         <h2>회원탈퇴</h2>
      </div>
      <div id="initDelete">
         <!-- JS에서처리 -->
      </div>
      
   </div>
      
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${path}/resources/JS/mypage/userInfo.js"></script>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>


<jsp:include page="../footer.jsp" />

</body>
</html>

<% } else{%>
   <script>alert("로그인이 필요합니다"); location.href="../login"</script>
   <%}
%>