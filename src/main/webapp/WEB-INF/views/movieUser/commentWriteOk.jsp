<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

  
<c:choose>
   <c:when test="${error == 1 }">
      <script>
         alert("별점을 선택해 주세요");
         location.href = "${pageContext.request.contextPath }/movieUser/openViewMovie?mov_num=${cmt_movieNum }&page=1";
      </script>
   </c:when>
   <c:when test="${error == 2 }">
      <script>
         alert("댓글내용을 입력해 주세요");
         location.href = "${pageContext.request.contextPath }/movieUser/openViewMovie?mov_num=${cmt_movieNum }&page=1";
      </script>
   </c:when>
   <c:when test="${error == 3 }">
      <script>
         alert("로그인을 해주세요");
         location.href = "${pageContext.request.contextPath }/login";
      </script>
   </c:when>
   <c:when test="${error == 4 }">
      <script>
         alert("이미 댓글을 작성 하셨습니다.");
         history.back();
      </script>
   </c:when>
   <c:when test="${result == 0 }">
      <script>
         alert("등록실패 !!!");
         history.back();
      </script>
   </c:when>
   <c:otherwise>
      <script>
         alert("등록 성공, 리스트를 출력합니다");
         location.href = "${pageContext.request.contextPath }/movieUser/openViewMovie?mov_num=${cmt_movieNum }&page=1";
      </script>
   </c:otherwise>
</c:choose>