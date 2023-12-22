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
<script type="text/javascript">
	function done(f){
		var u_idx = f.u_idx.value;
		
		f.action = "delete_info.do";
		f.submit();
		
	}
</script>
</head>
<body class="body"  style="	background-repeat: no-repeat;
			background-size:100%;
			background-color:#E7D7B2;">
	<div class="header_wrapper">
			<div class="logo_wrapper">
				<a href="main_home.do" class="logo">
						MY PET DOC
					</a>
			</div>
		</div>
	<div class="update_wrapper"> <!-- 값 받기 -->
		<h2>회원 탈퇴하기</h2>
		<form id="update_form">
			<input type="hidden" name="u_idx" value="${id.u_idx}"> 
			<div class="update">
				<h3>정말 탈퇴하실건가요??</h3>
				<h4>회원 탈퇴시 가입시 사용한 모든 정보와 <br>
				이용 내역이 사라집니다.?</h4>
			</div>
			<input type="button" class="checkbtn" value="탈퇴하기" onclick="done(this.form)">
		</form>
		</div>
</body>
</html>