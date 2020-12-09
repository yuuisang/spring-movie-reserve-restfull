<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
    
    <!-- 아이디찾기 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- 구글 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">

	<!-- 아이콘  -->
	<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
		
	<!-- 파비콘 설정-->
	<link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">	
		
	<!-- CSS파일 -->
	<link rel="stylesheet" href="${path }/resources/CSS/main/idpwSearch.css">
	<link rel="stylesheet" href="${path }/resources/CSS/main/idpwSearchutil.css">

<title>KOREA BOX</title>
</head>
<body>

<jsp:include page="theme.jsp" />


<section id= "idSearch">


<div class = "container-fluid" >
<hr>
<div class = "container">
아이디 / 비밀번호 찾기
</div>
<hr>
</div>


		<div class="container" align="center" id="searchTab">
			<div class="p-5 bg-white mb-5">

				<!-- tab -->
				<ul id="myTab" role="tablist"
					class="nav nav-tabs nav-pills flex-column flex-sm-row text-center bg-light border-0 rounded-nav">
					<li class="nav-item flex-sm-fill"><a id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true"
						class="nav-link border-0 text-uppercase font-weight-bold active">아이디 찾기</a></li>
					<li class="nav-item flex-sm-fill"><a id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false"
						class="nav-link border-0 text-uppercase font-weight-bold">비밀번호
							찾기</a></li>

				</ul>
				<div id="myTabContent" class="tab-content">

					<!-- id 찾기 -->
					<div id="home" role="tabpanel" aria-labelledby="home-tab"
						class="tab-pane fade px-4 py-5 show active">
						<div class="container" align="center">
							<div class="wrap-login100">
								<form class="login100-form validate-form flex-sb flex-w"
									action="idSearchOk">
									<small class="login100-form-title p-b-32">회원정보에 등록한 내용과 입력한내용이 같을시, 아이디를 찾으실 수 있습니다.</small> <span
										class="txt1 p-b-11"> 이름 </span>
									<div class="wrap-input100 validate-input m-b-36"
										data-validate="Username is required">
										<input class="input100" type="text" name="mem_name">
										<span class="focus-input100"></span>
									</div>

									<span class="txt1 p-b-11"> 전화번호 </span> 
									<div class="wrap-input100 validate-input m-b-12"  id = "phone-number"
										data-validate="Password is required">

										<input class="input100 " type="tel" name="mem_phone"
											id="phone-number"> <span class="focus-input100"></span>
									</div>

									<div class="flex-sb-m w-full p-b-48"></div>

									<div class="container-login100-form-btn" align="center">
										<button type="submit" class="login100-form-btn"
											data-toggle="modal" data-target="#exampleModal">아이디
											찾기</button>


									</div>

								</form>
							</div>
						</div>

					</div>
					<div id="profile" role="tabpanel" aria-labelledby="profile-tab"
						class="tab-pane fade px-4 py-5">
						<!-- pw 찾기 -->
						<div class="container" align="center" id="search">
							<div class="wrap-login100">
								<form class="login100-form validate-form flex-sb flex-w"
									action="pwSearchOk">
									<small class="login100-form-title p-b-32"> 회원님의 이메일을 통해 비밀번호를 찾으실 수 있습니다. </small> <span
										class="txt1 p-b-11"> 아이디 </span>
									<div class="wrap-input100 validate-input m-b-36"
										data-validate="Username is required">
										<input class="input100" type="text" name="mem_id"> <span
											class="focus-input100"></span>
									</div>
									<span class="txt1 p-b-11"> 이름 </span>
									<div class="wrap-input100 validate-input m-b-36"
										data-validate="Username is required">
										<input class="input100" type="text" name="mem_name">
										<span class="focus-input100"></span>
									</div>

									<span class="txt1 p-b-11"> 이메일 </span>
									<div class="wrap-input100 validate-input m-b-12"
										data-validate="Password is required">

										<input class="input100" type="email" name="mem_email">
										<span class="focus-input100"></span>
									</div>

									<div class="flex-sb-m w-full p-b-48"></div>

									<div class="container-login100-form-btn" align="center">
										<button type="submit" class="login100-form-btn">비밀번호
											찾기</button>
									</div>

								</form>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>




	</section>
	



<jsp:include page="footer.jsp" />



	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${path }/resources/JS/main/idpwSearch.js"></script>

	<script type="text/javascript">
	
    //휴대폰번호 입력제한 
    $(document).on("keyup", "#phone-number", function() {
       $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3")
             .replace("--", "-") );
       }
    
    );
	</script>
</body>
</html>