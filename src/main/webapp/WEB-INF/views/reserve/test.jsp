<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dddddd</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<% String mov_p = "'pp.jpg'"; %>

	<form action="reserveuser" name="frm1">
		<input type="hidden" name="mov_num" value="1"/>
		<input type="hidden" name="mov_poster" value="<%= mov_p %>"/>
		<button type="submit" id="aa">예매하기</button>	
	</form>
	
	
	<script>
	

		
	</script>

</body>
</html>