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
<title>KOREA BOX</title>
 <!-- 파비콘 설정-->
<link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">
<!--  CSS  -->
<link rel="stylesheet" type="text/css" href="${path}/resources/CSS/mypage/userInfo.css">


</head>
<body>


<div class="container">
   
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

</body>
</html>

<% } else{%>
   <script>alert("로그인이 필요합니다"); location.href="../login"</script>
   <%}
%>