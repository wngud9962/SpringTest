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

	var b_NnameCheck = false;

	function done(f){
		var nickName = f.nickName.value;
		var u_nickName = f.u_nickName.value.trim();
		
		if(u_nickName == ''){
			alert('사용할 닉네임을 입력해주세요.');
			return;
		}
		
		if(!b_NnameCheck){
			alert('닉네임 중복체크 필요');
			return;
		}
		
		// 닉네임 정규식: 한글만 허용
        var nicknameRegex = /^[가-힣]+$/;
        if (!nicknameRegex.test(u_nickName)) {
            alert('닉네임은 한글만 사용 가능합니다.');
            return;
        }
		
		f.action = "update_Nname.do";
		f.submit();
		
	}
	
	// 닉네임 중복체크
	function nNameCheck(){
		var u_nickName = document.getElementById("u_Nname").value.trim();
		
		if(u_nickName == ''){
			alert('사용하실 닉네임을 입력해주세요.');
			return;
		}
		
		var url = "nNameCheck.do";
		var param = "u_nickName="+encodeURIComponent(u_nickName);
		
		sendRequest(url, param, resultFn2, "POST");
	}
	
	// 콜백
	function resultFn2(){
		if(xhr.readyState == 4 && xhr.status == 200){

			var data = xhr.responseText;
			var json = (new Function('return'+data))();
			
			if(json[0].res == 'no'){
				alert('이미 사용중인 닉네임입니다.');
				return;
			} else{
				alert('사용 가능한 닉네임입니다.');
				b_NnameCheck = true;
			}
			
		}
	} // resultFn2()
	
	// 닉네임 중복체크용
	function che() {
		b_NnameCheck = false;
	} // che()
	
</script>
</head>
<body>

	<div class="update_wrapper"> <!-- 값 받기 -->
		<h2>닉네임 변경</h2>
		<form id="update_form">
			<div class="update">
				<h3>사용중인 닉네임</h3>
				<input name="nickName" value="${id.u_nickName}" readonly> 
				
				<h3>사용할 닉네임을 입력해주세요.</h3>
				<input id="u_Nname" name="u_nickName" placeholder="NickName" onchange="che()"> 
				<input type="button" class="checkbtn" id="check_nName" value="중복확인" onclick="nNameCheck(this.form)">
			</div>
			<input type="button"  class="checkbtn" value="완료" onclick="done(this.form)">
		</form>
		</div>
	
</body>
</html>