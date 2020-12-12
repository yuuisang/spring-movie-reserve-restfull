<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
   <c:set var="path" value="${pageContext.request.contextPath}" />
<%
   int writePages = 10;
%>
    <!-- 현재상영작 -> 상세정보-->
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
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   <link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

   
   <!-- 구글폰트 -->
   <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
   
   <!-- CSS파일 -->

   <link rel="stylesheet" type="text/css" href="${path}/resources/CSS/main/nowMovieInfo.css">

    
   <!-- 파비콘 설정-->
   <link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">



<title>KOREA BOX</title>
</head>
<body>

   <jsp:include page="../theme.jsp" />
  
  
  <!-- 
     <div class="container mt-3">
      <hr>
   <ul class="nav nav-tabs">
  
  <li class="nav-item">
    <a class="nav-link disabled">홈 </a>
  </li>
  <li class="nav-item">
    <a class="nav-link " href="#">Movie</a> 
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#">현재 상영작</a>
  </li>
</ul>
</div>
-->


<!-- 메뉴바 밑 컨테이너 -->
<div class = "container-fluid" >
<hr>
<div class = "container">
홈
</div>
<hr>
</div>

<!-- 영화 상세 윗부분-->

<!-- 영화 상세 내용 컨테이너-->
   <div class="container" id="">
      <div class="row" id="movieInfo">
         <div class="col-sm-12 text-center">
            <h2>${list.mov_title }</h2>
         </div>
      </div>
      <!-- 포스터 부분 / 상세 정보 -->
      <div class="row" id="poster">
         <div class="col-md-4 text-center" id = "posterProfile">
            <img class="card-img-top" src="${path }/resources/upload/${list.mov_poster}" style="width:300px; height:400px;">
         </div>

         <!-- 상세 내용
                  평점(별)
                  개봉일
                  상영시간
                  감독
                  출연진
                  장르
                   -->

         <div class="col-md-8" id="box1">

            <div class="col-sm-12 text-left" id="MovieBox">

               <p>평점 : ${star_rating}</p>
               <br>
               <p>개봉일 : ${list.mov_openDate }</p>
               <br>
               <p>상영시간 : ${list.mov_runtime }</p>
               <br>
               <p>감독 : ${list.mov_director }</p>
               <br>
               <p>출연진 : ${list.mov_actors }</p>
               <br>
               <p>장르 : ${list.mov_genre }</p>
               <br>
            </div>

         </div>
      </div>

      <!-- 영화 줄거리 -->
      <div class="row">
         <div class="col-md-12" id="box2">
            <div class="col-sm-12 text-center">
               <h4>영화 줄거리</h4>
               <div class="col-sm-12 text-center" id="MovieStory">
                  <p>${list.mov_intro }</p>
               </div>
            </div>

         </div>
      </div>

      <!-- 영화 스틸컷 -->
      <div class="row" id="box3">
         <div class="col-md-12">
            <div class="col-sm-12 text-center">
               <h4>영화 스틸컷</h4>

               <!-- 사진  -->
               <div class="container mt-5">
                  <div class="carousel-container position-relative row">

                     <!-- 메인 사진 -->
                     <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                           <!--사진1 -->
                           <div class="carousel-item active card-img "
                              data-slide-number="0" >
                              <img src="${path }/resources/upload/${list.mov_still1 }"  style="width : 1200px; height: 100% ;object-fit:contain;"
                                 class="d-block img-fluid" alt="..."
                                 data-type="image" data-toggle="lightbox"
                                 data-gallery="example-gallery">
                           </div>
                           <!--사진2 -->
                           <div class="carousel-item card-img" data-slide-number="1"  >
                              <img src="${path }/resources/upload/${list.mov_still2 }"
                                 style="width : 1200px; height: 100% ;object-fit:contain;"
                                 class=" d-block img-fluid" alt="..."
                                 data-type="image" data-toggle="lightbox"
                                 data-gallery="example-gallery">
                           </div>
                           <!--사진3 -->
                           <div class="carousel-item card-img" data-slide-number="2">
                              <img src="${path }/resources/upload/${list.mov_still3 }"
                                 style="width : 1200px; height: 100% ;object-fit:contain;"
                                 class="d-block img-fluid" alt="..."
                                 data-type="image" data-toggle="lightbox"
                                 data-gallery="example-gallery">
                           </div>
                        </div>
                     </div>

                     <!-- 하단사진 -->
                     <div id="carousel-thumbs" class="carousel slide"
                        data-ride="carousel">
                        <div class="carousel-inner">
                           <div class="carousel-item active">
                              <div class="row mx-0">
                                 <!--사진1 -->
                                 <div id="carousel-selector-0 card-img"
                                    class="d-block img-fluid col-4 col-sm-2 px-1 py-2 card-img"
                                    data-target="#myCarousel" data-slide-to="0">
                                    <img src="${path }/resources/upload/${list.mov_still1 }" style="width: 200px; height: 100%;"
                                       class="img-fluid" alt="...">
                                 </div>
                                 <!--사진2 -->
                                 <div id="carousel-selector-1 card-img"
                                    class="d-block img-fluid col-4 col-sm-2 px-1 py-2"
                                    data-target="#myCarousel" data-slide-to="1">
                                    <img src="${path }/resources/upload/${list.mov_still2 }" style="width: 200px; height: 100%;"
                                       class="img-fluid" alt="...">
                                 </div>
                                 <!--사진3 -->
                                 <div id="carousel-selector-2 card-img"
                                    class="d-block img-fluid col-4 col-sm-2 px-1 py-2"
                                    data-target="#myCarousel" data-slide-to="2">
                                    <img src="${path }/resources/upload/${list.mov_still3 }" style="width: 200px; height: 100%;"
                                       class="img-fluid" alt="...">
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!--  -->


            </div>

         </div>
      </div>
      
    <%
   // 현재 로그인 상태인지 확인
   if(session.getAttribute("mem_id") != null){
   String mem_id = (String)session.getAttribute("mem_id");
   %>
      <!-- 평점 / 리뷰 쓰는 곳 -->
      <div class="row" id="box4">
         <div class="col-md-12 text-center">
               <h4>평점 / 리뷰</h4>
         </div>
               <div class = "col-lg-12 text-left" id ="review">
                  <div class="card border-light">
                     <h5 class="card-header">평점</h5>
                     <!-- 별점 -->
                     <form action="commentWriteOk">
                        <div class = "rating" id = "star">
                           <input type="hidden" name="cmt_memberId" value="${mem_id }">
                           <label class="fa fa-star"><input type="radio" class="custom-control-input" name="cmt_star" id="str1" value="1"></label>
                           <label class="fa fa-star"><input type="radio" class="custom-control-input" name="cmt_star" id="str2" value="2"></label>
                           <label class="fa fa-star"><input type="radio" class="custom-control-input" name="cmt_star" id="str3" value="3"></label>
                           <label class="fa fa-star"><input type="radio" class="custom-control-input" name="cmt_star" id="str4" value="4"></label>
                           <label class="fa fa-star"><input type="radio" class="custom-control-input" name="cmt_star" id="str5" value="5"></label>
                           <input type="hidden" name="cmt_movieNum" value="${list.mov_num }"/>
                           <input type="hidden" name="cmt_movieName" value="${list.mov_title }"/>
                           <input type="hidden" name="cmt_memberUid" value="${mem_uid }"/>
                        </div>
                     
                     
                     <!-- 댓글(글자수 제한) --> 
                     <div class="card-body" >
                           
                           <textarea name = "cmt_content" class="form-control" id="comment" placeholder="댓글 입력..."></textarea>
                           <br>
                           <div align="right" id = "reviewBtn">
                        <button type="submit" class="btn btn-outline-secondary " >댓글 작성</button>
                           </div>
                           </div>
                           </form>
                     </div>
                  </div>
            
         </div>
      <% } %>
      <div class="row" id="box5">
         <div class="col-md-12">
         <div class="col-sm-12 text-left">
         <h4>Review</h4>
         </div>
         <hr>
      
      <c:choose>
         <c:when test="${empty listComment || fn:length(listComment) == 0 }">
         </c:when>

         <c:otherwise>
            <c:forEach var="dto" items="${listComment }" varStatus="status">  <%-- request.getAttribute("list") --%>
      <!-- 리뷰 리스트 -->
         <!-- 댓글  리스트 -->
         <div class="col-sm-12 text-left">
            <div class="card shadow" id = "reviewCard">
              <div class="col-sm-12 text-left">
              <!-- 아이디 -->
                 <div id="commentWrite"><h5 class="h5 g-color-gray-dark-v1 mb-0">${dto.cmt_memberId }</h5></div>
                 <div class="col-sm-12 text-rigth" id="commentDate" align="right">${dto.cmt_regDate }</div>
              </div>
                <!-- 별점 -->
                 <div class = "col-sm-12 text-left" id = "star1">
                 <c:if test="${dto.cmt_star==1 }">
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star"></span>
                 <span class="fa fa-star"></span>
                 <span class="fa fa-star"></span>
                 <span class="fa fa-star"></span>
                    </c:if>
                    <c:if test="${dto.cmt_star==2 }">
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star"></span>
                 <span class="fa fa-star"></span>
                 <span class="fa fa-star"></span>
                    </c:if>
                    <c:if test="${dto.cmt_star==3 }">
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star"></span>
                 <span class="fa fa-star"></span>
                    </c:if>
                    <c:if test="${dto.cmt_star==4 }">
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star"></span>
                    </c:if>
                    <c:if test="${dto.cmt_star==5 }">
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star checked"></span>
                 <span class="fa fa-star checked"></span>
                    </c:if>
              </div>
              <!-- 댓글 내용 -->
           <div class = "col-sm-12 text-left" id = "reviewContent">   
              <p>${dto.cmt_content }</p>
              </div>
              <div align="right" id = "reviewBtn">
              
         <c:if test="${mem_uid == dto.cmt_memberUid }">
            <button type="button" class="btn btn-outline-danger" onclick="location.href='commentDeleteOk?cmt_num=${dto.cmt_num}&cmt_movieNum=${dto.cmt_movieNum }'">삭제</button>
            <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#updateModal${status.index}">수정</button>
         </c:if>
           </div>
                  <form action="commentUpdateOk">
                     <div class="modal fade" id="updateModal${status.index}">
                        <div class="modal-dialog">
                           <div class="modal-content">

                              <!-- Modal Header -->
                              <div class="modal-header">
                                 <h4 class="modal-title">댓글 수정</h4>
                                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                              </div>

                              <input type="hidden" name="cmt_movieNum" value="${dto.cmt_movieNum }" />
                              <input type="hidden" name="cmt_num" value="${dto.cmt_num}" />

                              <!-- Modal body -->
                              <div class="modal-body">
                                 <textarea class="commentContent" style="resize: none; width: 100%;"
                                    name="cmt_content">${dto.cmt_content }</textarea>
                              </div>
                              <!-- Modal footer -->
                              <div class="modal-footer">
                                 <button type="submit" class="btn btn-primary">수정</button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </form>
            
         </div>
         </div>
         <br>
            </c:forEach>
         </c:otherwise>
      </c:choose>
      </div>
   </div>
      
       <jsp:include page="pagination.jsp">
         <jsp:param value="<%= writePages %>" name="writePages"/>
         <jsp:param value="${totalPage }" name="totalPage"/>
         <jsp:param value="${curPage }" name="curPage"/>
      </jsp:include>
      
</div>


   <!-- 푸터 -->
   <jsp:include page="../footer.jsp" />

   <!-- JS파일 -->
   <!-- Popper JS -->
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

   <!-- Latest compiled JavaScript -->
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 
   	<script type="text/javascript" src="${path}/resources/JS/main/nowMovieInfo.js"></script>
 -->
</body>

<script>
$(document).ready(function(){
    // Check Radio-box
    $(".rating input:radio").attr("checked", false);

    $(".rating input").click(function () {
        $(".rating label").removeClass('fa fa-star checked');
        $(".rating label").addClass('fa fa-star');
        $(this).parent().addClass('fa fa-star checked').prevAll("label").addClass("fa fa-star checked");
    });

    $('input:radio').change(
      function(){
        var userRating = this.value;
    }); 
});
</script>

</html>
