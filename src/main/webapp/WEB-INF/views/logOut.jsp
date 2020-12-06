<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.invalidate();
	System.out.print("유저 세션 종료");
%>

<script>
alert("로그아웃 되었습니다. 감사합니다.");
location.href = "${pageContext.request.contextPath }";
</script>

