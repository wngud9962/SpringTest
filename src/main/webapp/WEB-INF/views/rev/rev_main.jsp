<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/rev/rev_main.css">
<script type="text/javascript">
	function go(){
		var url = "revInsert.do";
	    var size = "width=450px, height=500px, scrollbars=no";

	    var leftPosition = (window.screen.width - 450) / 2; // 화면 가로 중앙
	    var topPosition = (window.screen.height - 500) / 2; // 화면 세로 중앙

	    var windowFeatures = size + ", top=" + topPosition + ", left=" + leftPosition;

	    window.open(url, '예약하기', windowFeatures);
	   
	}
	

	function rev_select(f){
		var u_idx = f.u_idx.value;
		
		f.action = "rev_select.do";
		f.submit();
	}
	
	</script>
</head>
<body style="background-repeat: no-repeat;
			background-size:100%;
			background-color:#E7D7B2;">
					
 <div class="wrapper">
		<div class="intro-bg">
		<div class="header">
			<div class="logo">
					<a href="main_home.do" id="logoa"><img src="resources/img/titleLogo.jpg" width="130px" height="130px"></a>
		        </div>
			<div class="title">
		        	<ul class="nav">
			            <li><a href="info_main.do">병원소개</a></li>
			            <li><a href="review_main.do">리뷰</a></li>
			            <li><a href="qna_main.do">QNA</a></li>
			            <li><a href="rev_main.do">예약</a></li>
			          	<c:choose>
							<c:when test="${empty id}">
								<li><a href="login_main.do">펫 등록</a></li>
								<li><a href="login_main.do">정보수정</a></li>
								<li><a href="login_main.do">로그인</a></li>
							</c:when>
							<c:when test="${not empty id}">
								<li><a href="petinfo_main.do">펫 등록</a></li>
								<li><a href="check_up.do">정보수정</a></li>
								<li><a href="logout.do">로그아웃</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
			</div>
			</div>
				
			<div class="rev">
				<div class="line"></div>
				<div class="text">
					
					<div class="btn">
					<form>
						<c:choose>
							<c:when test="${empty id}">
								<input type="button" value="예약하기" onclick="location.href='login_main.do'">
								<input type="button" value="예약조회" onclick="location.href='login_main.do'">
							</c:when>
							<c:when test="${not empty id}">
								<input type="hidden" name="u_idx" value="${id.u_idx}" >
								<input type="button" value="예약하기" onclick="go()"
									   style="cursor: pointer;">
								<input type="button" value="예약조회" onclick="rev_select(this.form)"
									   style="cursor: pointer;">
							</c:when>
						</c:choose>
					</form>
				</div>
				
				<div class="txt1">
					"예약 및 진료시간"
					<strong>안내</strong>
				</div>
				<div class="txt2">
					진료 및 다양한 서비스 항목에 대한 예약 및 운영시간 안내입니다.
				</div>
				
				<div class="line"></div>
				
				<div class="em"><img src="${pageContext.request.contextPath}/resources/img/em.jpg"></div>
				
				<div class="txt3">
					<strong>ㆍ </strong>원활한 진료를 위하여 전화예약을 먼저 하시면 편리합니다.<br>
					<strong>ㆍ </strong>본원은 24시간 응급진료가 가능합니다.<br>
					<strong>ㆍ </strong>진료시간 변경이 있을 경우에는 미리 공지사항에 공지하도록 하겠습니다.
				</div>
				
				<div class="line"></div>
				
				<div class="tel">
					상담/예약 전화: 02-0000-0000
				</div>
				
				<div class="line"></div>
				
				<div class="txt4">
					<h1>주간 진료시간</h1>
					
					<font class="tt">AM 10:00 ~ PM 20:00</font><br>
					※ 면회시간 10 :00 - PM 10 :00 아가들의 안정과 빠른회복을 
					위해 면회시간을 30분 이내로 협조해주시면 감사드리겠습니다.<br>
					※ 점심시간 PM 1:00 ~ PM 2:00<br>
					※ 회진시간<br>
					- AM 8:30 ~ AM 09:00<br>
					- PM 1:30 ~ PM 2:00<br>
					- PM 5:00 ~ PM 5:30<br>
					- PM 10:00 ~ PM 10:30<br>
				</div>
				
				<div class="line1"></div>
				
				<div class="txt4">
					<h1>야간 진료시간</h1>
					
					<font class="tt">PM 20:00 ~ 익일 AM 10:00</font><br>
					※ 야간진료시간에는 야간 할증비가 청구되오니 일반적인 진료는 주간진료 시간을 이용해 주시길 바랍니다.
				</div>
				
				<div class="line1"></div>
				
				<div class="txt4">
					<h1>24시간 응급진료</h1>
					
					<font class="tt">응급진료는 365일 24시간 연중무휴로 운영됩니다.</font><br>
					※ 내원 전 전화부탁드립니다.<br>
					※ 응급 진료시간에 응급처치나 수술 중에는 전화연결이 어려울 수 있습니다.<br>
					병원은 정상 진료 중이니 내원하셔도 됩니다.
				</div>
			
			</div>
		</div> 
		
		<div class="line"></div>
		
		<div class="footer">
        <div>멍이 냥이 동물병원</div>
        <div id="info">
          CEO. 김가나다 <br>
          Addr. 인천광역시 부평구 시장로 7 MH타워 5층 <br>
          Fax/Tel. 032-262-5890 <br>
          ⓒ2023.hospital name All rights reserved.
        </div>
        <div class="sns">
			<a href="https://www.instagram.com">
				<img src="resources/img/insta.jpg" width="100px" height="100px">
			</a>
		</div>
      </div>
		
	</div>
</body>
</html>