<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/writeMovie.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="allDiv">
	<h1>영화 등록</h1>
	<form action="writeMovieOk" method="post" enctype="multipart/form-data">
	<table id="writeMovieTable">
		<tr>
			<td>제목</td>
			<td><input type="text" name="mov_title"/></td>
		</tr>
		<tr>
			<td>감독</td>
			<td><input type="text" name="mov_director"/></td>
		</tr>
		<tr>
			<td>배우</td>
			<td><input type="text" name="mov_actors"/></td>
		</tr>
		<tr>
			<td>장르</td>
			<td><input type="text" name="mov_genre"/></td>
		</tr>
		<tr>
			<td>러닝타임</td>
			<td><input type="text" name="mov_runtime"/></td>
		</tr>
		<tr>
			<td>개봉일</td>
			<td><input type="date" name="mov_openDate"/></td>
		</tr>
		<tr>
			<td>심의등급</td>
			<td><input type="text" name="mov_grade"/></td>
		</tr>
		<tr>
			<td>소개</td>
			<td><input type="text" name="mov_intro"/></td>
		</tr>
		<!-- 
		<tr>
			<td>포스터</td>
			<td><input type="file" name="mov_poster" accept=".jpg,.gif,.png,.jpeg"></td>
		</tr>
		<tr>
			<td>스틸컷1</td>
			<td><input type="file" name="mov_still1" accept=".jpg,.gif,.png,.jpeg"></td>
		</tr>
		<tr>
			<td>스틸컷2</td>
			<td><input type="file" name="mov_still2" accept=".jpg,.gif,.png,.jpeg"></td>
		</tr>
		<tr>
			<td>스틸컷3</td>
			<td><input type="file" name="mov_still3" accept=".jpg,.gif,.png,.jpeg"></td>
		</tr>	
		 -->	
	</table>
	
	<input type="file" name="mov_poster" accept=".jpg,.gif,.png,.jpeg"><br>
	<input type="file" name="mov_still1" accept=".jpg,.gif,.png,.jpeg"><br>
	<input type="file" name="mov_still2" accept=".jpg,.gif,.png,.jpeg"><br>
	<input type="file" name="mov_still3" accept=".jpg,.gif,.png,.jpeg"><br>
	 
	
	<button type="button" onclick="location.href='${pageContext.request.contextPath }/movieAdmin/managementMovie?page=1'">취소</button>
	<input type="submit" value="등록"/>
	</form>
</div>
</body>
</html>