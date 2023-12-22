<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function send(f){
		var u_email = f.u_email.value.trim();
		var u_pwd = f.u_pwd.value.trim();
		
		// 유효성
		if(u_email == ''){
			alert('아이디를 입력해주세요.');
			return;
		}
		
		if(u_pwd == ''){
			alert('비밀번호를 입력해 주세요');
			return;
		}
		
		var url = "login.do";
		var param = "u_email="+encodeURIComponent(u_email)+"&u_pwd="+encodeURIComponent(u_pwd);
		
		sendRequest(url, param, myCheck, "POST");
		
	}
	
	function myCheck(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			var json = (new Function('return'+data))();
			
			if(json[0].param == 'no_id'){
				alert('아이디가 존재하지 않습니다.');
			} else if(json[0].param == 'no_pwd'){
				alert('비밀번호가 일치하지 않습니다.');
			} else {
				alert('로그인 성공');
				location.href='main_home.do';
			}
		
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
			<h2>Login</h2>
			<form id="login-form">
				<c:choose>
					<c:when test="${empty u_email}">
						<input type="text" name="u_email" placeholder="Email"> 
					</c:when>
					<c:when test="${not empty u_email}">
						<input type="text" name="u_email" value="${u_email}" placeholder="Email"> 
					</c:when>
				</c:choose>
				
				<input type="password" name="u_pwd" placeholder="Password"> 
			<!-- 	<label for="remember-check"> 
					<input type="checkbox" id="remember-check">
					아이디 저장하기
				</label>  -->
				<div class="regNfind">
					<a href="find_id.do" class="findId">아이디 찾기</a> |
					<a href="find_pwd.do" class="findPwd">비밀번호 찾기</a> |
					<a href="regster_insert.do" class="reg_a">회원가입</a> 
				</div>
				<input type="button" class="checkbtn" value="Login" onclick="send(this.form)">
			</form>
		</div>
	</div>
</body>
</html>