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
	href="${pageContext.request.contextPath}/resources/css/login/login.css">
<script type="text/javascript">
	function send(f){
		var u_pwd = f.u_pwd.value.trim();
		
		if(u_pwd == ''){
			alert('비밀번호를 입력하세요.');
			return;
		}
		
		if(u_pwd == ${id.u_pwd}){
			location.href="updateInfo.do";
		} else{
			alert('비밀번호가 다릅니다.');
			return;
		}
		
	}
	
</script>
</head>
<body class="body" style="	background-repeat: no-repeat;
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
		<div class="login_wrapper">
			<h2>비밀번호 확인</h2>
			<form id="login-form">
				<input type="password" name="u_pwd" placeholder="Password"> 
				<input type="button" class="checkbtn" value="확인" onclick="send(this.form)">
			</form>
		</div>
	</div>
</body>
</html>