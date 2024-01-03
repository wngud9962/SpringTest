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
	href="${pageContext.request.contextPath}/resources/css/login/find_idCheck.css">
</head>
<body class="body"  style="	background-repeat: no-repeat;
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
			<h2>We Find Your Password!!!</h2>
			<form id="id_form">
				<h3 align="center"></h3>
				<h3 align="center">${u_pwd}</h3>
				<input type="button" class="checkbtn" value="로그인 하러가기" onclick="location.href='login_main.do'">
			</form>
		</div>
	</div>
</body>
</html>