<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/update.css?after">
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
	var b_emailCheck = false;
	
	function done(f){
		var email = f.email.value;
		var u_email = f.u_email.value.trim();
		
		if(u_email == ''){
			alert('사용할 이메일을 입력해주세요.');
			return;
		}
		
		if(!b_emailCheck){
			alert('이메일 중복체크 필요');
			return;
		}
		
		// 이메일 정규식
        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailRegex.test(u_email)) {
            alert('올바른 이메일 형식이 아닙니다.');
            return;
        }
		
		f.action = "update_email.do";
		f.submit();
		
	}
	
	// 이메일 중복체크
	function emailCheck(){
		var u_email = document.getElementById("u_email").value.trim();
		
		if(u_email == ''){
			alert('사용하실 이메일을 입력해주세요.');
			return;
		}
		
		var url = "idCheck.do";
		var param = "u_email="+encodeURIComponent(u_email);
		
		sendRequest(url, param, resultFn, "POST");
	}
	
	// 콜백
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
	
			var data = xhr.responseText;
			var json = (new Function('return'+data))();
			
			if(json[0].res == 'no'){
				alert('이미 가입된 이메일입니다.');
				return;
			} else{
				alert('사용 가능한 이메일입니다.');
				b_emailCheck = true;
			}
			
		}
	} // resultFn()
	
	// 이메일 중복체크용
	function che() {
		b_emailCheck = false;
	} // che()

</script>
</head>
<body>
		
	<div class="update_wrapper"> <!-- 값 받기 -->
		<h2>이메일 변경</h2>
		<form id="update_form">
			<div class="update">
				<h3>사용중인 이메일</h3>
				<input name="email" value="${id.u_email}" readonly> 
				
				<h3>새로운 이메일을 입력해주세요.</h3>
				<input id="u_email" name="u_email" placeholder="Email" onchange="che()"> 
				<input type="button" id="check_email" value="중복확인" onclick="emailCheck(this.form)">
			</div>
			<input type="button"  value="완료" onclick="done(this.form)">
		</form>
		</div>
	
</body>
</html>