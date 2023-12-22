<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/rev/rev_pop.css">
<script type="text/javascript">

	var t_choose = false;

	function time(t){
	
		var element = document.getElementById("rv_time");
		
		element.value = t;
	
	    // 요소의 콘텐츠를 출력합니다.
	    console.log(element.value);
	    t_choose = true;
	}

	function go(f) {
	  	var rv_time = f.rv_time.value.trim();
	    var rv_day = f.rv_day.value;
	    
	    if(!t_choose){
	    	alert('시간을 골라주세요');
	    	return;
	    }
	    
	    f.action = "rev_info.do";
	    f.submit();
	}


</script>
</head>
<body style="background-repeat: no-repeat;
			background-size:100%;
			background-color:#E7D7B2;">
			
	<div class="wrapper">
		
		<div class="txt1">
			<h2>예약하실 <br> 시간을 선택해주세요</h2>
		<form>
			<input type="hidden" value="${rv_day}" name="rv_day">
			<div class="timearea">
				<input type="text" name="rv_time" id="rv_time" readonly>
				<c:choose>
					<c:when test="${empty time}">
						예약이 모두 끝났습니다 ㅠ
						<input type="button" value="완료" onclick="window.close()">
					</c:when>
					<c:when test="${not empty time}">
						<div class="btnarea">
						<ul class="btl">
							<c:forEach var="time" items="${time}">
								<li class="li"><input type="button" id="${time}" value="${time}" onClick="time('${time}')"
									style="cursor:pointer";></li>
							</c:forEach>
						</ul>
						</div>
						<div class="next2">
							<input type="button" value="다음" onclick="go(this.form)"
								   style="cursor: pointer;">
						</div>
					</c:when>
				</c:choose>
			</div>
		</form>
		</div>
	</div>	
</body>
</html>