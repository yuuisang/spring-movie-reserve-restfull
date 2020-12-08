<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

  
<c:choose>
   <c:when test="${result == 0 }">
      <script>
         alert("수정실패 !!!");
         history.back();
      </script>
   </c:when>
   <c:when test="${error == 1 }">
      <script>
         alert("id를 입력해 주세요");
         history.back();
      </script>
   </c:when>
   <c:when test="${error == 2 }">
      <script>
         alert("이름을 입력해 주세요");
         history.back();
      </script>
   </c:when>
   <c:when test="${error == 3 }">
      <script>
         alert("pw를 입력해 주세요");
         history.back();
      </script>
   </c:when>
   <c:when test="${error == 4 }">
      <script>
         alert("생년월일을 입력해 주세요");
         history.back();
      </script>
   </c:when>
   <c:when test="${error == 5 }">
      <script>
         alert("전화번호를 입력해 주세요");
         history.back();
      </script>
   </c:when>
   <c:when test="${error == 6 }">
      <script>
         alert("이메일을 입력해 주세요");
         history.back();
      </script>
   </c:when>
   <c:otherwise>
      <script>
         alert("수정성공");
         location.href = "${pageContext.request.contextPath }/admin/managerMemberList";
      </script>
   </c:otherwise>
</c:choose>