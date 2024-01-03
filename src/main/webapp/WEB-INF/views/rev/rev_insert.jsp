<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/rev/rev_pop.css">
<script type="text/javascript">
	function next(f){
		var userId = f.userId.value;
		var rv_day = f.rv_day.value;
		
		
		if(rv_day == ''){
			alert('날짜를 선택해 주세요.');
			return;
		}
		
		console.log(rv_day);
		
		
		f.action = "rev_time.do";
		f.submit();
	}
</script>
</head>
<body style="background-repeat: no-repeat;
			background-size:100%;
			background-color:#E7D7B2;">
	
	<div class="wrapper">
		
		<div class="txt1">
			<h2>예약하실<br> 날짜를 선택해주세요.</h2>

			<form>
				<input type="hidden" name="userId" id="userId" value="${successLoginUser}">
			<div class="date">
				<label for="rev_date">예약 날짜 고르기</label><br>
		        <input type="date" min="${today}" name="rv_day" id="rev_Date">
	        </div>
	        <div class="next">
	        	<input type="button" value="다음" onclick="next(this.form)"
	        	       style="cursor:pointer;">
	        </div>
			</form>
		</div>
	</div>
</body>
</html>