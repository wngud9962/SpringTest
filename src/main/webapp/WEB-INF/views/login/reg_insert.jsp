<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/regster.css">
    <script src="resources/js/httpRequest.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">

    	var b_NnameCheck = false;
        var b_idCheck = false;
        var b_passwordCheck = false;
        var b_telCheck = false;
        //b_NnameCheck+" "+b_idCheck+" "+b_passwordCheck+" "+b_telCheck
        
        function password_check_onchange(){
        	let $password = $("input[name='u_pwd']").val();
        	let $passwordCheck = $("input[name='pwd2']").val();
        	
        	var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$/;
        	if(!passwordRegex.test($password)){
        		b_passwordCheck=false;
        		return;
        	}
        	
        	if($password === $passwordCheck){
        		b_passwordCheck=true;
        	}else{
        		b_passwordCheck=false;
        	}
        }

        function send(f) {
            var u_nickName = f.u_nickName.value.trim();
            var u_email = f.u_email.value.trim();
            var u_pwd = f.u_pwd.value.trim();
            var pwd2 = f.pwd2.value.trim();
            var u_name = f.u_name.value.trim();
            var u_tel = f.u_tel.value.trim();
            var u_addr = f.u_addr.value.trim();
/* 
            // 닉네임 정규식: 한글만 허용
            var nicknameRegex = /^[가-힣]+$/;
            if (!nicknameRegex.test(u_nickName)) {
                alert('닉네임은 한글만 사용 가능합니다.');
                return;
            }

            // 이메일 정규식
            var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test(u_email)) {
                alert('올바른 이메일 형식이 아닙니다.');
                return;
            }

            // 비밀번호 정규식: 최소 8자 이상, 영문과 숫자 포함
            var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$/;
            if (!passwordRegex.test(u_pwd)) {
                alert('비밀번호는 영문과 숫자를 조합하여 8자이상 입력가능합니다.');
                return;
            }

            // 이름 정규식: 한글 또는 영문 대소문자만 허용
            var nameRegex = /^[가-힣a-zA-Z]+$/;
            if (!nameRegex.test(u_name)) {
                alert('이름은 한글 또는 영문만 입력 가능합니다.');
                return;
            }

            // 전화번호 정규식: 숫자만 허용
            var telRegex = /^\d+$/;
            if (!telRegex.test(u_tel)) {
                alert('전화번호는 - 없이 숫자로만 입력 가능합니다.');
                return;
            }

            if (u_tel.length !== 11) {
                alert('전화번호는 11자리여야 합니다.');
                return;
            }

            // 주소는 추가적인 정규식이 필요할 수 있습니다.

            // 중복체크
            if (!b_idCheck) {
                alert('아이디 중복체크 필요');
                return;
            }

            if (!b_NnameCheck) {
                alert('닉네임 중복체크 필요');
                return;
            }

            if (!b_telCheck) {
                alert('전화번호 확인 필요');
                return;
            } */
            
            /* var b_idCheck = false;
            var b_NnameCheck = false;
            var b_telCheck = false;
            var b_passwordCheck = false; */
            
            if(!b_NnameCheck){
            	alert("닉네임 중복체크를 다시 해주세요");
            	f.u_nickName.focus();
            	return;
            }
            
            if(!b_idCheck){
            	alert("이메일 중복체크를 다시 해주세요");
            	f.u_email.focus();
            	return;
            }
            
            if(!b_telCheck){
                alert('전화번호 체크를 다시 해주세요');
                f.u_tel.focus();
                return;
        	}
            
            if(!b_passwordCheck){
            	if($("input[name='u_pwd']").val().length<8){
                    alert('비밀번호는 8자리 이상,숫자,소문자,@$!%*?& 중 하나이상의 특수문자를 포함해주세요');
                    return;
            	}
                alert('비밀번호가 일치하지 않습니다.');
            	$("input[name='u_pwd']").focus();
                return;
        	}
            
            // 서버로 전송
            f.action = "insert_user.do";
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
                    b_NnameCheck = true;
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
                    b_idCheck = true;
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
                    b_telCheck = true;
                }
            }
        } // after_telCheck()

        // 중복체크용
        function changed_id() {
        	b_idCheck = false;
        } // changed_id()

        // 중복체크용
        function changed_nickname() {
        	b_NnameCheck = false;
        } // changed_nickname()

        // 중복체크용
        function changed_tel() {
        	b_telCheck = false;
        } // changed_tel()

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
	                document.getElementById("address").value = addr;
	            }
	        }).open();
	    }
    </script>
</head>
<body class="body" style="background-repeat: no-repeat; background-size:100%; background-color:#E7D7B2;">
    <div class="wrapper">
        <div class="header_wrapper">
            <div class="logo_wrapper">
                <a href="main_home.do" class="logo">
                    MY PET DOC
                </a>
            </div>
        </div> <!-- 헤더 -->
        <div class="reg_wrapper"> <!-- 값 받기 -->
            <h2>Sign Up</h2>
            <form id="reg_form">
                <div class="id_input">
                    <h3>NickName</h3>
                    <input type="text" id="u_Nname" name="u_nickName" placeholder="NickName" onchange="changed_nickname()"> 
                    <input type="button"  class="checkbtn" id="check_nName" value="중복확인" onclick="nNameCheck(this.form)">
                </div>
										
                <div class="id_input">
	                <h3>Name</h3>
	                <input type="text" name="u_name" placeholder="Name">
                </div>

                <div class="id_input">
                    <h3>Email</h3>
                    <input type="text" id="u_email" name="u_email" placeholder="Email" onchange="changed_id()"> 
                    <input type="button" class="checkbtn" id="check_id" value="Check ID" onclick="idCheck(this.form)">
                </div>

                <h3>Password</h3>
                <input type="password" name="u_pwd" placeholder="Password" oninput="password_check_onchange()">
                <input type="password" name="pwd2" placeholder="Password Check" oninput="password_check_onchange()">

                <div class="id_input">
                    <h3>Tel (-없이 입력해주세요)</h3>
                    <input id="u_tel" name="u_tel" placeholder="Tel" onchange="changed_tel()">
                    <input type="button" class="checkbtn" id="check_tel" value="Check Tel" onclick="telCheck(this.form)">
                </div>
                
                <div class="id_input">
	                <h3>Address</h3>
	                <input type="text" id="address" name="u_addr" placeholder="Address" readonly="readonly">
					<input type="button" class="checkbtn" value="우편번호 검색" onclick="execDaumPostcode()">
				</div>
				
                <input type="button"  class="checkbtn" value="Sign Up" onclick="send(this.form)">
            </form>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</html>
