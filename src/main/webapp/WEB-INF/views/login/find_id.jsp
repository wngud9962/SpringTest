<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	href="${pageContext.request.contextPath}/resources/css/login/find_id.css">
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function send(f){
		var u_name = f.u_name.value.trim();
		var u_tel = f.u_tel.value.trim();
		
		// 유효성
		if(u_name== ''){
			alert('이름을 입력해주세요.');
			return;
		}
		
		if(u_tel == ''){
			alert('전화번호를 입력해 주세요.');
			return;
		}
		
		var url = "select_email.do";
		var param = "u_name="+encodeURIComponent(u_name)+"&u_tel="+encodeURIComponent(u_tel);
		
		sendRequest(url, param, resultFn, "POST");
		
	}
	
	// 콜백
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			var json = (new Function('return'+data))();
			
			if(json[0].res == "no"){
				alert('가입 내역이 존재하지 않습니다.');
				return;
			}  else {
				// alert('아이디 찾음?');
				location.href="find_id2.do";
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
		</div> <!-- 헤더 -->
		<div class="find_wrapper"> <!-- 값 받기 -->
			<h2>Forget Your ID?</h2>
			<form id="find_form">
				<input type="text" name="u_name" placeholder="Name"> 
				<input type="text" name="u_tel" placeholder="Tel">
				<input type="button" class="checkbtn" value="Find!!" onclick="send(this.form)">
			</form>
		</div>
	</div>
</body>
</html>