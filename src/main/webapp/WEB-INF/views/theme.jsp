<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!-- 메뉴 바 고정-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- CSS파일 -->
<link rel="stylesheet" href="${path }/resources/CSS/main/theme.css">


<title>Insert title here</title>
</head>
<body>
<%
   // 현재 로그인 상태인지 확인
   if(session.getAttribute("mem_id") != null){
   String mem_id = (String)session.getAttribute("mem_id");
%>
   <header class="header">
      <nav class="navbar navbar-expand-lg fixed-top ">
         <div class="container">
            <a href="${path }/" class="navbar-brand text-uppercase font-weight-bold">KOREA
               BOX</a>
            <button type="button" data-toggle="collapse"
               data-target="#navbarSupportedContent"
               aria-controls="navbarSupportedContent" aria-expanded="false"
               aria-label="Toggle navigation"
               class="navbar-toggler navbar-toggler-right">
               <i class="fa fa-bars"></i>
            </button>

            <div id="navbarSupportedContent" class="collapse navbar-collapse">
               <ul class="navbar-nav ml-auto">
                  <li class="nav-item active dropdown"><a
                     class="nav-link dropdown-toggle font-weight-bold" 
                     id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false"> MOVIE </a>
                     <div class="dropdown-menu"
                        aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="${path }/movieUser/openMovieList">현재 상영작</a> <a
                           class="dropdown-item" href="${path }/movieUser/expectedMovieList">상영 예정작</a>
                     </div></li>
                  <li class="nav-item"><a href="${path }/movieUser/openMovieList"
                     class="nav-link text-uppercase font-weight-bold">Ticketing</a></li>
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle font-weight-bold" 
                     id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false"> MY PAGE </a>
                     <div class="dropdown-menu"
                        aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="${path }/mypage/resManage">예매 확인/취소</a> <a
                           class="dropdown-item" href="${path }/mypage/userInfo">회원 정보수정 /탈퇴</a>
                     </div></li>
                  <button type="button" class="btn btn-secondary btn-sm">${mem_id }</button>
                  &nbsp;
                  <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${path}/logOut'">로그아웃</button>&nbsp;
                  <%
                  if(session.getAttribute("mem_id").equals("admin")){
                  %>
                  <button type = "button" class="btn btn-secondary btn-sm" onclick="location.href='${path}/movieAdmin/managementMovie'">관리자 페이지</button>
                  <%
                  }
                  %>
               </ul>
            </div>
         </div>
      </nav>
   </header>
<%
   } else {
      
%>      <!-- 로그아웃 -->      
   <header class="header">
      <nav class="navbar navbar-expand-lg fixed-top ">
         <div class="container">
            <a href="${path }" class="navbar-brand text-uppercase font-weight-bold">KOREA
               BOX</a>
            <button type="button" data-toggle="collapse"
               data-target="#navbarSupportedContent"
               aria-controls="navbarSupportedContent" aria-expanded="false"
               aria-label="Toggle navigation"
               class="navbar-toggler navbar-toggler-right">
               <i class="fa fa-bars"></i>
            </button>

            <div id="navbarSupportedContent" class="collapse navbar-collapse">
               <ul class="navbar-nav ml-auto">
                  <li class="nav-item active dropdown"><a
                     class="nav-link dropdown-toggle font-weight-bold" 
                     id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false"> MOVIE </a>
                     <div class="dropdown-menu"
                        aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="${path }/movieUser/openMovieList">현재 상영작</a> <a
                           class="dropdown-item" href="${path }/movieUser/expectedMovieList">상영 예정작</a>
                     </div></li>
                  <li class="nav-item"><a href="${path }/movieUser/openMovieList"
                     class="nav-link text-uppercase font-weight-bold">Ticketing</a></li>
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle font-weight-bold"
                     id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false"> MY PAGE </a>
                     <div class="dropdown-menu"
                        aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="${path }/mypage/resManage">예매 확인/취소</a> <a
                           class="dropdown-item" href="${path }/mypage/userInfo">회원 정보수정 /탈퇴</a>
                     </div></li>
                  <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${path}/login'">로그인</button>
                  &nbsp;
                  <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${path}/signUp'">회원가입</button>
               </ul>
            </div>
         </div>
      </nav>
   </header>
<%            } %>
   <div id="themeDiv">
      <br>
   </div>

   <script type="text/javascript" src="${path }/resources/JS/main/theme.js"></script>

</body>
</html>