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
	var b_telCheck = false;
	
	function done(f){
		var tel = f.tel.value;
		var u_tel = f.u_tel.value.trim();
		
		if(u_tel == ''){
			alert('사용할 전화번호를 입력하세요');
			return;
		}
		
		if(!b_telCheck){
			alert('전화번호 확인 필요!');
			return;
		}
		
		// 전화번호 정규식: 숫자만 허용
        var telRegex = /^\d+$/;
        if (!telRegex.test(u_tel)) {
            alert('전화번호는 - 없이 숫자로만 입력 가능합니다.');
            return;
        }
		
		f.action = "update_tel.do";
		f.submit();
	}
	
	
	// 전화번호 중복체크
	function telCheck(){
		var u_tel = document.getElementById("u_tel").value.trim();
		
		if(u_tel == ''){
			alert('전화번호를 입력해주세요.');
			return;
		}
		
		var url = "telCheck.do";
		var param = "u_tel="+encodeURIComponent(u_tel);
		
		sendRequest(url, param, resultFn, "POST");
	}
	
	// 콜백
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){

			var data = xhr.responseText;
			var json = (new Function('return'+data))();
			
			if(json[0].res == 'no'){
				alert('이미 가입된 번호입니다.');
				return;
			} else{
				alert('사용 가능한 번호입니다.');
				b_telCheck = true;
			}
					
		}
	} // resultFn()
	
	// 전화번호 중복체크용
	function che() {
		b_telCheck = false;
	} // che()

</script>
</head>
<body>
	<div class="update_wrapper"> <!-- 값 받기 -->
		<h2>전화번호 변경</h2>
		<form id="update_form">
			<div class="update">
				<h3>사용중인 전화번호</h3>
				<input name="tel" value="${id.u_tel}" readonly> 
				
				<h3>새로운 전화번호를 입력해주세요.</h3>
				<input id="u_tel" name="u_tel" placeholder="Tel" onchange="che()"> 
				<input type="button"  id="check_tel" value="전화번호 확인" onclick="telCheck(this.form)">
			</div>
			<input type="button"  value="완료" onclick="done(this.form)">
		</form>
		</div>
</body>
</html>