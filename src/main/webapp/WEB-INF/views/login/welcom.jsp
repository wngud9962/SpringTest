<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.checkbtn{
	cursor:pointer;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/welcom.css">
</head>
<body class="body" class="body" style="	background-repeat: no-repeat;
			background-size:100%;
			background-color:#E7D7B2;">
	<div class="wrapper">
		<div class="header_wrapper">
			<div class="logo_wrapper">
					<a href="main_home.do" class="logo">
						MY PET DOC
					</a>
			</div>
		</div>
		<div class="id_wrapper">
			<h2>Welcome!!!!</h2>
			<div id="id_div">
				<h3 align="center">가입을 환영합니다!!</h3>
				<input type="button" class="checkbtn"  value="로그인 하러가기" onclick="location.href='login_main.do'">
			</div>
		</div>
	</div>
</body>
</html>