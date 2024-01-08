<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn{
cursor:pointer;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/update.css?after">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/regster.css">
<script src="resources/js/httpRequest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	let isAvailableNickname = true;
	let isAvailableEmail = true;
	let isAvailablePassword = true;
	let isAvailableTel = true;
	
	  // email = id 수준
    function changed_id() {
    	isAvailableEmail = false;
    } // changed_id()

    // 중복체크용
    function changed_nickname() {
    	isAvailableNickname = false;
    } // changed_nickname()

    // 중복체크용
    function changed_tel() {
    	isAvailableTel = false;
    } // changed_tel()
    
    function send(f){
    	if(!isAvailableNickname){
    		alert('닉네임 중복체크를 하세요.');
    		document.getElementById('u_Nname').focus();
    		return;
    	}
    	if(!isAvailableEmail){
    		alert('이메일(아이디) 중복체크를 하세요.');
    		document.getElementById('u_email').focus();
    		return;
    	}
    	if(!isAvailablePassword){
    		alert('비밀번호가 일치하지 않습니다.');
    		document.getElementById('u_pwd').focus();
    		return;
    		
    	}
    	if(!isAvailableTel){
    		alert('전화번호 중복체를 하세요.');
    		document.getElementById('u_tel').focus();
    		return;
    	}
    	
    	f.method='post';
    	f.action="update_userinfo";
    	f.submit();
    }


    // 닉네임 중복체크
    function nNameCheck() {
        var u_nickName_tag = document.getElementById("u_Nname");
        var u_nickName = u_nickName_tag.value.trim();

        if (u_nickName === '') {
            alert('사용하실 닉네임을 입력해주세요.');
            u_nickName_tag.focus();
            return;
        }
        
        //닉네임 정규식 추가 (특수문자 비허용)
        let exclude_special_regular_expression = /^[a-zA-Z0-9가-힣]+$/;
        if(!exclude_special_regular_expression.test(u_nickName)){
        	alert('닉네임에는 특수문자를 허용하지 않습니다.');
        	u_nickName_tag.focus();
        	return;
        }
        
        var url = "nNameCheck.do";
        var param = "u_nickName=" + encodeURIComponent(u_nickName);

        sendRequest(url, param, after_NnameCheck, "POST");
    }

    // 콜백
    function after_NnameCheck() {
        if (xhr.readyState === 4 && xhr.status === 200) {

            var data = xhr.responseText;
            var json = (new Function('return' + data))();

            if (json[0].res === 'no') {
                alert('이미 사용중인 닉네임입니다.');
                document.getElementById("u_Nname").focus();
            } else {
                alert('사용 가능한 닉네임입니다.');
                isAvailableNickname = true;
            }
        }
    } // after_NnameCheck()

    // 아이디 중복체크
    function idCheck() {
    	var u_email_tag = document.getElementById("u_email");
        var u_email = u_email_tag.value.trim();

        if (u_email === '') {
            alert('사용하실 이메일을 입력해주세요.');
            u_email_tag.focus();
            return;
        }
		//이메일 정규식 검사로직
    	//이메일 정규식 추가
    	let email_regular_expression = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        if(!email_regular_expression.test(u_email)){
        	alert('이메일 형식을 맞춰주세요');
        	return;
        }

        var url = "idCheck.do";
        var param = "u_email=" + encodeURIComponent(u_email);

        sendRequest(url, param, after_idCheck, "POST");
    } // idCheck()

    // 콜백
    function after_idCheck() {
        if (xhr.readyState === 4 && xhr.status === 200) {

            var data = xhr.responseText;
            var json = (new Function('return' + data))();

            if (json[0].res === 'no') {
                alert('이미 가입된 이메일입니다.');
            } else {
                alert('사용 가능한 이메일입니다.');
                isAvailableEmail = true;
            }
        }
    } // after_idCheck()

    // 전화번호 중복체크
    function telCheck() {
        var u_tel_tag = document.getElementById("u_tel"); 
        var u_tel = u_tel_tag.value.trim();

        let check = /^[0-9]+$/;
        
        if (u_tel === '') {
            alert('전화번호를 입력해주세요.');
            u_tel_tag.focus();
            return;
        }
        
        if (!check.test(u_tel)){
        	alert("형식에 맞게 입력해주세요.");
        	u_tel_tag.focus();
        	return;
        }

        var url = "telCheck.do";
        var param = "u_tel=" + encodeURIComponent(u_tel);

        sendRequest(url, param, after_telCheck, "POST");
    }

    // 콜백
    function after_telCheck() {
        if (xhr.readyState === 4 && xhr.status === 200) {

            var data = xhr.responseText;
            var json = (new Function('return' + data))();

            if (json[0].res === 'no') {
                alert('이미 가입된 전화번호입니다.');
            } else {
                alert('사용가능한 번호입니다.');
                isAvailableTel = true;
            }
        }
    } // after_telCheck()
    
    
 	function password_check_onchange(){
       	let $password = $("input[name='u_pwd']").val();
       	let $passwordCheck = $("input[name='pwd2']").val();
       	
       	var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$/;
       	if(!passwordRegex.test($password)){
       		isAvailablePassword=false;
       		return;
       	}
       	
       	if($password === $passwordCheck){
       		isAvailablePassword=true;
       	}else{
       		isAvailablePassword=false;
       	}
   	}
    
/* 
	function upNname(){
		
		var url = "updateNname.do";
	    var size = "width=450px, height=500px, scrollbars=no";

	    var leftPosition = (window.screen.width - 450) / 2; // 화면 가로 중앙
	    var topPosition = (window.screen.height - 500) / 2; // 화면 세로 중앙

	    var windowFeatures = size + ", top=" + topPosition + ", left=" + leftPosition;

	    window.open(url, '닉네임변경', windowFeatures);
	}
	
	function upName(){
		var url = "updateName.do";
	    var size = "width=450px, height=500px, scrollbars=no";

	    var leftPosition = (window.screen.width - 450) / 2; // 화면 가로 중앙
	    var topPosition = (window.screen.height - 500) / 2; // 화면 세로 중앙

	    var windowFeatures = size + ", top=" + topPosition + ", left=" + leftPosition;

	    window.open(url, '이름변경', windowFeatures);
	}
	
	function upEmail(){
		var url = "updateEmail.do";
	    var size = "width=450px, height=500px, scrollbars=no";

	    var leftPosition = (window.screen.width - 450) / 2; // 화면 가로 중앙
	    var topPosition = (window.screen.height - 500) / 2; // 화면 세로 중앙

	    var windowFeatures = size + ", top=" + topPosition + ", left=" + leftPosition;

	    window.open(url, '이메일변경', windowFeatures);
	}
	
	function upPwd(){
		var url = "updatePwd.do";
	    var size = "width=450px, height=500px, scrollbars=no";

	    var leftPosition = (window.screen.width - 450) / 2; // 화면 가로 중앙
	    var topPosition = (window.screen.height - 500) / 2; // 화면 세로 중앙

	    var windowFeatures = size + ", top=" + topPosition + ", left=" + leftPosition;

	    window.open(url, '비밀번호변경', windowFeatures);
	}
	
	function upTel(){
		var url = "updateTel.do";
	    var size = "width=450px, height=500px, scrollbars=no";

	    var leftPosition = (window.screen.width - 450) / 2; // 화면 가로 중앙
	    var topPosition = (window.screen.height - 500) / 2; // 화면 세로 중앙

	    var windowFeatures = size + ", top=" + topPosition + ", left=" + leftPosition;

	    window.open(url, '전화번호변경', windowFeatures);
	}
	
	function upAddr(){
		var url = "updateAddr.do";
	    var size = "width=450px, height=500px, scrollbars=no";

	    var leftPosition = (window.screen.width - 450) / 2; // 화면 가로 중앙
	    var topPosition = (window.screen.height - 500) / 2; // 화면 세로 중앙

	    var windowFeatures = size + ", top=" + topPosition + ", left=" + leftPosition;

	    window.open(url, '주소변경', windowFeatures);
	} */
</script>

<script>
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("u_addr").value = addr;
	        }
	    }).open();
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
		<div class="reg_wrapper update_wrapper"> <!-- 값 받기 -->
			<h2>내정보</h2>
			<h4 align="right"><a href="deleteInfo.do">탈퇴하기</a></h4>
			<form id="update_form">
				<div class="update">
					<div class="id_input">
						<h3>NickName</h3>
						<input id="u_Nname" name="u_nickName" value="${id.u_nickName}" onchange="changed_nickname()">
                    	<input type="button"  class="checkbtn" id="check_nName" value="중복확인" onclick="nNameCheck(this.form)">
					</div>					
					
					<div class="id_input">
						<h3>Name</h3>
						<input id="u_name" name="u_name" value="${id.u_name}">
					</div>
					
					<div class="id_input">
						<h3>Email</h3>
						<input id="u_email" name="u_email" value="${id.u_email}" onchange="changed_id()">
                    	<input type="button" class="checkbtn" id="check_id" value="Check ID" onclick="idCheck(this.form)">
					</div>
					
					<div class="id_input">
						<h3>Password</h3>
						<input type="password" id="u_pwd" name="u_pwd" value="${id.u_pwd}" oninput="password_check_onchange()">
						<input type="password" name="pwd2" value="${id.u_pwd}" oninput="password_check_onchange()">
					</div>
					
					<div class="id_input">
					</div>
										
					<div class="id_input">
						<h3>Tel (-없이 입력해주세요)</h3>
						<input id="u_tel" name="u_tel" value="${id.u_tel}" onchange="changed_tel()">
                    	<input type="button" class="checkbtn" id="check_tel" value="Check Tel" onclick="telCheck(this.form)">
					</div>
					
					<div class="id_input">
						<h3>Address</h3>
						<input id="u_addr" name="u_addr" value="${id.u_addr}">
						<!-- <input type="button" class="btn"  value="수정" onclick="upAddr()"> -->
						<input type="button" class="btn"  value="우편번호 검색" onclick="execDaumPostcode()">
					</div>
				</div>
				
				<input type="button" id="update_btn"class="checkbtn" value="수정 완료" onclick="send(this.form)">
			</form>
		</div>
	</div>
</body>
</html>