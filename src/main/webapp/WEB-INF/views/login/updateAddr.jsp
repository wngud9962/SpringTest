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
		var addr = f.addr.value;
		var u_addr = f.u_addr.value.trim();
		var u_email = f.u_email.value.trim();
		
		if(u_email == ''){
			alert('이메일을 입력해주세요.');
		}
		
		if(!b_emailCheck){
			alert('계정 확인을 완료해주세요.');
			return;
		}
		
		if(u_addr == ''){
			alert('변경할 주소를 입력해 주세요.');
			return;
		}
		
		if(u_addr == addr){
			alert('원래 주소와 같습니다.');
			return;
		}
		
		f.action = "update_addr.do";
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
				alert('계정 정보 확인됨');
				b_emailCheck = true;
			} else{
				alert('이메일이 틀렸어요');
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
	<div class="update_wrapper"> <!-- 값 받기 -->
		<h2>주소 변경</h2>
		<form id="update_form">
			<input type="hidden" id="ori_email" value="${id.u_email}">
			<div class="update">
				<h3>주소</h3>
				<input name="addr" value="${id.u_addr}" readonly> 
				
				<h3>주소를 변경할 계정을 입력해주세요.</h3>
				<input id="u_email" name="u_email" placeholder="Email" onchange="che()"> 
				<input type="button" id="check_email" value="계정 확인" onclick="emailCheck(this.form)">
			
				<h3>변경할 주소를 입력해주세요.</h3>
				<input id="u_addr" name="u_addr" placeholder="Address">
			</div>
			<input type="button"  value="완료" onclick="done(this.form)">
		</form>
		</div>
</body>
</html>