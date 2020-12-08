<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

  
<c:choose>
   <c:when test="${result == 0 }">
      <script>
         alert("정확한 정보를 입력해 주세요");
         history.back();
      </script>
   </c:when>
   <c:when test="${error == 1 }">
      <script>
         alert("아이디를 입력해 주세요");
         history.back();
      </script>
   </c:when>
   <c:when test="${error == 2 }">
      <script>
         alert("비밀번호를 입력해 주세요");
         history.back();
      </script>
   </c:when>
   <c:when test="${result == 2 }">
      <script>
         alert("관리자 로그인 성공");
         location.href = "${pageContext.request.contextPath }/movieAdmin/managementMovie";
      </script>
   </c:when>
   <c:otherwise>
      <script>
         alert("로그인 성공");
         location.href = "${pageContext.request.contextPath }";
      </script>
   </c:otherwise>
</c:choose>