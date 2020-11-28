<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.rating {
    float:left;
    width:300px;
}
.rating span { float:right; position:relative; }
.rating span input {
    position:absolute;
    top:0px;
    left:0px;
    opacity:0;
}
.rating span label {
    display:inline-block;
    width:30px;
    height:30px;
    text-align:center;
    color:#FFF;
    background:#ccc;
    font-size:30px;
    margin-right:2px;
    line-height:30px;
    border-radius:50%;
    -webkit-border-radius:50%;
}
.rating span:hover ~ span label,
.rating span:hover label,
.rating span.checked label,
.rating span.checked ~ span label {
    background:#F90;
    color:#FFF;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

   <!-- jQuery library -->

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

   <!-- Latest compiled and minified CSS -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

   <!-- Popper JS -->

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

   <!-- Latest compiled JavaScript -->

   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</head>
<body>
<h1>영화 상세보기</h1>

제목 : ${list.mov_title }<br>
영화 포스터 : <div><img class="card-img-top" src="../resources/upload/${list.mov_poster}" style="width:300px; height:300px;"></div><br>
감독 : ${list.mov_director }<br>
배우 : ${list.mov_actors }<br>
장르 : ${list.mov_genre }<br>
러닝타임 : ${list.mov_runtime }<br>
개봉일 : ${list.mov_openDate }<br>
심의 등급 : ${list.mov_grade }<br>
소개 : ${list.mov_intro }<br>
총점 : ${list.mov_totalStar }<br>
별점 갯수 : ${list.mov_countStar }<br>
쇼 플래그 : ${list.mov_showFlag }<br>
등록일 : ${list.mov_regDate }<br>
스틸컷1 : <div><img class="card-img-top" src="../resources/upload/${list.mov_still1 }" style="width:300px; height:300px;"></div><br>
스틸컷2 : <div><img class="card-img-top" src="../resources/upload/${list.mov_still2 }" style="width:300px; height:300px;"></div><br>
스틸컷3 : <div><img class="card-img-top" src="../resources/upload/${list.mov_still3 }" style="width:300px; height:300px;"></div><br>
<br>


</body>
</html>

