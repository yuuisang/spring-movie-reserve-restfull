<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

  
<script>

</script>
  
<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("등록실패 !!!");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${error == 1 }">
		<script>
			alert("예약이 되어있는 영화입니다.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${error == 2 }">
		<script>
			alert("상영등록이 되어있는 영화입니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
		alert("삭제 성공");
		location.href = "${pageContext.request.contextPath }/movieAdmin/managementMovie"; <%-- 삭제후에는 list 로 가자 --%>
		</script>
	</c:otherwise>
</c:choose>