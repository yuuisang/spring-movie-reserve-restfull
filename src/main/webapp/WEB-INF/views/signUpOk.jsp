<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

  
<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("회원 가입 실패 !!!");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 1 }">
		<script>
			alert("이름을 입력해 주세요");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 2 }">
		<script>
			alert("아이디를 입력해 주세요");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 3 }">
		<script>
			alert("비밀번호를 입력해 주세요");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 4 }">
		<script>
			alert("비밀번호확인이 비밀번호와 일치하지 않습니다");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 5 }">
		<script>
			alert("생년월일을 선택해 주세요");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 6 }">
		<script>
			alert("휴대폰 번호를 입력해 주세요");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 7 }">
		<script>
			alert("이메일을 입력해 주세요");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 8 }">
		<script>
			alert("중복된 아이디 입니다");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 9 }">
		<script>
			alert("중복된 전화번호 입니다");
			history.back();
		</script>
	</c:when>
	<c:when test="${error == 10 }">
		<script>
			alert("중복된 이메일 입니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("회원 가입 성공");
			location.href = "${pageContext.request.contextPath }/login";
		</script>
	</c:otherwise>
</c:choose>
