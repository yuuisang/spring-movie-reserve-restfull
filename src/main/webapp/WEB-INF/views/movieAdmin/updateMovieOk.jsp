<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

  
<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("등록실패 !!!");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 1 }">
		<script>
			alert("빈칸을 입력해 주세요");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${error == 0 }">
		<script>
			alert("러닝타임은 숫자로 입력해 주세요");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("등록 성공, 리스트를 출력합니다");
			location.href = "${pageContext.request.contextPath }/movieAdmin/managementMovie";
		</script>
	</c:otherwise>
</c:choose>
