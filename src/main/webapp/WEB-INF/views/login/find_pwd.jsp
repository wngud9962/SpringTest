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
	href="${pageContext.request.contextPath}/resources/css/login/find_pwd.css">
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function send(f){
		var u_name = f.u_name.value.trim();
		var u_email = f.u_email.value.trim();
		
		// 유효성 검사
		if(u_name == ''){
			alert('이름을 입력해주세요.');
			return;
		} else if(u_email == ''){
			alert('이메일을 입력해주세요.');
			return;
		}
		
		var url = "select_pwd.do";
		var param = "u_name="+encodeURIComponent(u_name)+"&u_email="+encodeURIComponent(u_email);
		
		sendRequest(url, param, resultFn, "POST");

	} // send()
	
	// 콜백
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			var json = (new Function('return'+data))();
			
			if(json[0].res == "no"){
				alert('가입 내역이 존재하지 않습니다. 입력한정보가 맞는지 확인해 주세요');
				return;
			} else {
				 alert('비번 찾음?');

				location.href="find_pwd2.do";
			}
			
		}
			
	}
	
</script>
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
		</div> <!-- 헤더 -->
		<div class="find_wrapper"> <!-- 값 받기 -->
			<h2>Forget Your Password?</h2>
			<form id="find_form">
				<input type="text" name="u_name" placeholder="Name">
				<input type="text" name="u_email" placeholder="Email">
				<input type="button" class="checkbtn" value="Find!!" onclick="send(this.form)">
			</form>
		</div>
	</div>
</body>
</html>