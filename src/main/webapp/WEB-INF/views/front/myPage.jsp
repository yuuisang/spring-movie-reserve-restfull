<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 마이페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- 아이콘 -->
	<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
	
	<!-- 구글폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
	
	<!-- CSS파일 -->
	<link rel="stylesheet" type="text/css" href="CSS/myPage.css">
	
	<!-- 파비콘 설정-->
	<link rel="shortcut icon" href="img/movie_favicon.ico" type="image/x-icon">

<title>KOREA BOX</title>
</head>
<body>


		<!-- 메뉴바  -->
	<jsp:include page="theme.jsp" />
	
     <div class="container">
    <h2>회원 정보 수정</h2>
    
    <span>* 회원님의 정보를 정확히 수정해 주세요.</span>
    <hr>
    <div class="row text-center" >
    <div class="col-sm-12">
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6" id = "form1">
    <form action="MemberJoinProc.jsp" method="post">
        <table class="table table-boardered">
            <tr>
                <th>아이디</th>
                <td><input type="text" class="form-control" name="id" placeholder="id를 넣으세요"></td>        
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" class="form-control" name="name" placeholder="비밀번호는 영문만 넣어주세요"></td>      
            </tr>
             
            <tr>
                <th>생년월일</th>
                <td><input type="number" class="form-control" name="birth"></td>        
            </tr>
             
            <tr>
                <th>이메일</th>
                <td><input type="email" class="form-control" name="email"></td>       
            </tr>
             
            <tr>
                <th>비밀번호</th>
                <td><input type="password" class="form-control" name="password1"></td>       
            </tr>
            
            <tr>
                <th>비밀번호 확인</th>
                <td><input type="password" class="form-control" name="password2"></td>       
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="number" class="form-control" name="tel"></td>       
            </tr>
            <tr>
            <th></th>
            <td>
            <div align="right">
              <button type="button" class="btn btn-info btn-sm">탈퇴하기</button>     
              </div>      
             </td>
             </tr>
            <tr>
                <td colspan="2">
                <input type="reset" class="btn btn-danger" value="취소">
                <input type="submit" class="btn btn-primary" value="변경">
                </td>
            </tr>
             
             
        </table>

     
    </form>
    </div>
     
    </div>
    </div>
</div>



	<jsp:include page="footer.jsp" />


	<!-- JS파일 -->
	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>