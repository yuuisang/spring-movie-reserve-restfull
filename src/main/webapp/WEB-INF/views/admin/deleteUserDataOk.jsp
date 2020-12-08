<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

  
<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("삭제실패 !!!");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 1 }">
		<script>
			alert("예약이 되어있는 회원입니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("삭제성공");
			location.href = "${pageContext.request.contextPath }/admin/managerMemberList";
		</script>
	</c:otherwise>
</c:choose>
