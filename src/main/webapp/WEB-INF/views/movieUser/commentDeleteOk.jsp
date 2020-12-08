<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

  
<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("삭제 실패 !!!");
			history.back();
		</script>
	</c:when>

	<c:otherwise>
		<script>
			alert("삭제 성공");
			location.href = "${pageContext.request.contextPath }/movieUser/openViewMovie?mov_num=${cmt_movieNum }&page=1";
		</script>
	</c:otherwise>
</c:choose>
