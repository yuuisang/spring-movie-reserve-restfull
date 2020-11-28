<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/updateMovie.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="allDiv">
	<h1>영화 수정</h1>
	<form action="updateMovieOk">
	<table id="updateMovieTable">
		<input type="hidden" name="mov_num" value="${list.mov_num}"/>
		<tr>
			<td>제목</td>
			<td><input type="text" name="mov_title" value="${list.mov_title }"/></td>
		</tr>
		<tr>
			<td>감독</td>
			<td><input type="text" name="mov_director" value="${list.mov_director }"/></td>
		</tr>
		<tr>
			<td>배우</td>
			<td><input type="text" name="mov_actors" value="${list.mov_actors }"/></td>
		</tr>
		<tr>
			<td>장르</td>
			<td><input type="text" name="mov_genre" value="${list.mov_genre }"/></td>
		</tr>
		<tr>
			<td>러닝타임</td>
			<td><input type="text" name="mov_runtime" value="${list.mov_runtime }"/></td>
		</tr>
		<tr>
			<td>개봉일</td>
			<td><input type="text" name="mov_openDate" value="${list.mov_openDate }"/></td>
		</tr>
		<tr>
			<td>심의등급</td>
			<td><input type="text" name="mov_grade" value="${list.mov_grade }"/></td>
		</tr>
		<tr>
			<td>소개</td>
			<td><input type="text" name="mov_intro" value="${list.mov_intro }"/></td>
		</tr>
		<tr>
			<td>포스터이미지</td>
			<td><input type="button" value="파일선택"/></td>
		</tr>
		<tr>
			<td>스틸컷1</td>
			<td><input type="button" value="파일선택"/></td>
		</tr>
		<tr>
			<td>스틸컷2</td>
			<td><input type="button" value="파일선택"/></td>
		</tr>
		<tr>
			<td>스틸컷3</td>
			<td><input type="button" value="파일선택"/></td>
		</tr>
	</table>
	<img class="card-img-top" src="../resources/upload/${list.mov_poster}" style="width:300px; height:300px;">
	<button type="button" onclick="location.href='${pageContext.request.contextPath }/movieAdmin/managementMovie?page=1'">취소</button>
	<input type="submit" value="수정"/>
	</form>
</div>
</body>
</html>