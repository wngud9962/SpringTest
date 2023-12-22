<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/regster.css">
    <script src="resources/js/httpRequest.js"></script>
    <script type="text/javascript">

        var b_idCheck = false;
        var b_NnameCheck = false;
        var b_telCheck = false;

        function send(f) {
            var u_nickName = f.u_nickName.value.trim();
            var u_email = f.u_email.value.trim();
            var u_pwd = f.u_pwd.value.trim();
            var pwd2 = f.pwd2.value.trim();
            var u_name = f.u_name.value.trim();
            var u_tel = f.u_tel.value.trim();
            var u_addr = f.u_addr.value.trim();

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
            }

            // 서버로 전송
            f.action = "insert_user.do";
            f.submit();
        }

        // 닉네임 중복체크
        function nNameCheck() {
            var u_nickName = document.getElementById("u_Nname").value.trim();

            if (u_nickName === '') {
                alert('사용하실 닉네임을 입력해주세요.');
                return;
            }

            var url = "nNameCheck.do";
            var param = "u_nickName=" + encodeURIComponent(u_nickName);

            sendRequest(url, param, resultFn2, "POST");
        }

        // 콜백
        function resultFn2() {
            if (xhr.readyState === 4 && xhr.status === 200) {

                var data = xhr.responseText;
                var json = (new Function('return' + data))();

                if (json[0].res === 'no') {
                    alert('이미 사용중인 닉네임입니다.');
                } else {
                    alert('사용 가능한 닉네임입니다.');
                    b_NnameCheck = true;
                }
            }
        } // ResultFn2()

        // 아이디 중복체크
        function idCheck() {
            var u_email = document.getElementById("u_email").value.trim();

            if (u_email === '') {
                alert('사용하실 이메일을 입력해주세요.');
                return;
            }

            var url = "idCheck.do";
            var param = "u_email=" + encodeURIComponent(u_email);

            sendRequest(url, param, resultFn, "POST");
        } // idCheck()

        // 콜백
        function resultFn() {
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
        } // resultFn()

        // 전화번호 중복체크
        function telCheck() {
            var u_tel = document.getElementById("u_tel").value.trim();

            if (u_tel === '') {
                alert('전화번호를 입력해주세요.');
                return;
            }

            var url = "telCheck.do";
            var param = "u_tel=" + encodeURIComponent(u_tel);

            sendRequest(url, param, resultFn3, "POST");
        }

        // 콜백
        function resultFn3() {
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
        } // resultFn()

        // 중복체크용
        function che() {
            b_telCheck = false;
        } // che()

        // 중복체크용
        function che2() {
            b_idCheck = false;
        } // che()

        // 중복체크용
        function che3() {
            b_NnameCheck = false;
        } // che()

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
                    <input type="text" id="u_Nname" name="u_nickName" placeholder="NickName" onchange="che2()"> 
                    <input type="button"  class="checkbtn" id="check_nName" value="중복확인" onclick="nNameCheck(this.form)">
                </div>

                <h3>Name</h3>
                <input type="text" name="u_name" placeholder="Name">

                <div class="id_input">
                    <h3>Email</h3>
                    <input type="text" id="u_email" name="u_email" placeholder="Email" onchange="che()"> 
                    <input type="button" class="checkbtn" id="check_id" value="Check ID" onclick="idCheck(this.form)">
                </div>

                <h3>Password</h3>
                <input type="password" name="u_pwd" placeholder="Password">
                <input type="password" name="pwd2" placeholder="Password Check">

                <div class="id_input">
                    <h3>Tel (-없이 입력해주세요)</h3>
                    <input id="u_tel" name="u_tel" placeholder="Tel" onchange="che3()">
                    <input type="button" class="checkbtn" id="check_tel" value="Check Tel" onclick="telCheck(this.form)">
                </div>
                <h3>Address</h3>
                <input type="text" name="u_addr" placeholder="Address">

                <input type="button"  class="checkbtn" value="Sign Up" onclick="send(this.form)">
            </form>
        </div>
    </div>
</body>
</html>
