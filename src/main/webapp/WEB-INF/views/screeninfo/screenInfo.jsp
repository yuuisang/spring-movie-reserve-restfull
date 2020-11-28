<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 관리</title>
</head>
<body>
		<hr>
		<h2>리스트</h2>
		<table>
			<tr>
				<th>상영관명</th>
				<th>좌석 행</th>
				<th>좌석 열</th>
				<th>삭제</th>
			</tr>

		
		<%--
		<c:choose>
			<c:when test="${empty list || fn:length(list) == 0 }">
			</c:when>
		
			<c:otherwise>
				<c:forEach var="dto" items="${list }"> 
					<tr>
						<td>${dto.uid }</td>
						<td><a href="view.do?uid=${dto.uid }">${dto.subject }</a></td>
						<td>${dto.name }</td>
						<td>${dto.viewCnt }</td>			
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		 --%>
			
		</table>
		<br>
		<button onclick="location.href = 'write.do'">신규등록</button>

</body>
</html>