<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

  
<script>
			alert("삭제 성공");
			location.href = "${pageContext.request.contextPath }/movieAdmin/managementMovie?page=1"; <%-- 삭제후에는 list 로 가자 --%>
</script>
