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

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/update.css?after">
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
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
		<div class="update_wrapper"> <!-- 값 받기 -->
			<h2>내정보</h2>
			<h4 align="right"><a href="deleteInfo.do" >탈퇴하기</a></h4>
			<form id="update_form">
				<div class="update">
					<h3>NickName</h3>
					<input id="u_Nname" value="${id.u_nickName }" readOnly>
					<input type="button" class="btn" value="수정" onclick="upNname()">
				
					<h3>Name</h3>
					<input id="u_name" value="${id.u_name }" readOnly>
					<input type="button" class="btn"  value="수정" onclick="upName()">
					
					<h3>Email</h3>
					<input id="u_email" value="${id.u_email }" readOnly>
					<input type="button" class="btn"   value="수정" onclick="upEmail()">

					<h3>Password</h3>
					<input type="password" value="${id.u_pwd }" readOnly>
					<input type="button"  class="btn" value="수정" onclick="upPwd()">
					
					<h3>Tel</h3>
					<input id="u_tel" value="${id.u_tel }" readOnly>
					<input type="button" class="btn"  value="수정" onclick="upTel()">
					
					<h3>Address</h3>
					<input id="u_addr" value="${id.u_addr }" readOnly>
					<input type="button" class="btn"  value="수정" onclick="upAddr()">
					
					
				</div>
				<input type="button"   value="완료" onclick="location.href='main_home.do'">
			</form>
		</div>
	</div>
</body>
</html>