<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/update.css">
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
	var b_telCheck = false;
	
	function done(f){
		var name = f.name.value;
		var u_name = f.u_name.value.trim();
		
		if(u_name == ''){
			alert('사용할 이름을 입력해주세요.');
			return;
		}
		
		if(!b_telCheck){
			alert('전화번호 확인 필요!');
			return;
		}
		
		if(u_name == name){
			alert('기존에 사용하던 이름과 같습니다.');
			return;
		}
		
		// 이름 정규식: 한글 또는 영문 대소문자만 허용
        var nameRegex = /^[가-힣a-zA-Z]+$/;
        if (!nameRegex.test(u_name)) {
            alert('이름은 한글 또는 영문만 입력 가능합니다.');
            return;
        }
		
		f.action = "update_name.do";
		f.submit();
		
	}
	
	// 전화번호 중복체크
	function telCheck(){
		var ori_tel = document.getElementById("ori_tel").value;
		var u_tel = document.getElementById("u_tel").value.trim();
		
		if(u_tel == ''){
			alert('전화번호를 입력해주세요.');
			return;
		}
		
		if(u_tel != ori_tel){
		alert('가입된 정보와 다릅니다.');
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
				alert('전화번호 확인 완료');
				b_telCheck = true;
			} else{
				alert('가입 정보가 없습니다.');
				return;
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
		<h2>이름 변경</h2>
		<form id="update_form">
			<div class="update">
				<input type="hidden" id="ori_tel" value="${id.u_tel }">
				<h3>사용중인 이름</h3>
				<input name="name" value="${id.u_name}" readonly> 
				
				<h3>새로운 이름을 입력해주세요.</h3>
				<input id="u_name" name="u_name" placeholder="Name"> 
				
				<h3>가입에 사용한 전화번호를 입력해주세요.</h3>
				<input id="u_tel" name="u_tel" placeholder="tel" onchange="che()">
				<input type="button" id="check_name" value="중복확인" onclick="telCheck(this.form)">
			</div>
			<input type="button"  value="완료" onclick="done(this.form)">
		</form>
		</div>

</body>
</html>