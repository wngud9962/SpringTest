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
	href="${pageContext.request.contextPath}/resources/css/login/update.css">
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
	
	var b_emailCheck = false;
	
	function done(f){
		
		var u_email = f.u_email.value.trim();
		var pwd = f.pwd.value;
		var u_pwd = f.u_pwd.value.trim();
		var pwd2 = f.pwd2.value.trim();
		
		if(u_email == ''){
			alert('사용할 이메일을 입력해주세요.');
			return;
		}
		
		if(!b_emailCheck){
			alert('이메일 중복체크 필요');
			return;
		}
		
		if(u_pwd == ''){
			alert('사용할 비밀번호를 입력해주세요.');
			return;
		}
		
		
		if(pwd2 == ''){
			alert('비밀번호 확인란을 작성해주세요');
			return;
		}
		
		if(u_pwd != pwd2){
			alert('비밀번호가 다릅니다.');
			return;
		}
		
		if(u_pwd == pwd){
			alert('현재 비밀번호와같습니다.');
			return;
		}
		
		// 비밀번호 정규식: 최소 8자 이상, 영문과 숫자 포함
        var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$/;
        if (!passwordRegex.test(u_pwd)) {
            alert('비밀번호는 영문과 숫자를 조합하여 8자이상 입력가능합니다.');
            return;
        }
		
		f.action = "update_pwd.do";
		f.submit();
		
	}
	
	// 이메일 중복체크
	function emailCheck(){
		var ori_email = document.getElementById("ori_email").value;
		var u_email = document.getElementById("u_email").value.trim();
		
		if(u_email == ''){
			alert('사용하실 이메일을 입력해주세요.');
			return;
		}
		
		if(u_email != ori_email){
			alert('계정정보가 다릅니다.');
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
				alert('이메일 확인 완료');
				b_emailCheck = true;
			} else{
				alert('가입 정보가 없습니다.');
				return;
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
	<div class="update_wrapper"> 
		<h2>비밀번호 변경</h2>
		<form id="update_form">
			<input type="hidden" id="ori_email" value="${id.u_email}">
			<div class="update">
				<h3>사용중인 비밀번호</h3>
				<input name="pwd" value="${id.u_pwd}" readonly>
				
				<h3>변경하려는 계정의 이메일을 입력해주세요.</h3>
				<input id="u_email" name="u_email" placeholder="Email" onchange="che()"> 
				<input type="button" class="checkbtn" id="check_email" value="중복확인" onclick="emailCheck(this.form)">
				
				<h3>사용할 비밀번호를 입력해주세요.</h3>
				<input type="password" id="u_pwd" name="u_pwd" placeholder="Password">
				<input type="password" name="pwd2" placeholder="Password Check">
			</div>
			<input type="button" class="checkbtn" value="완료" onclick="done(this.form)">
		</form>
		</div>
</body>
</html>