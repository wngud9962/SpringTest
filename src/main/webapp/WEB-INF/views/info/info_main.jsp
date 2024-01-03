<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/info/info.css?after">
</head>
<body class="body"  
	style="	background-repeat: no-repeat;
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
		</div> <!-- 헤더 -->
		
		<div class="info">
			<div class="context1">
				<div class="line"></div>
				<h2 align="center">멍이 냥이 동물병원 인사말</h2>
				<div class="line"></div>
			</div>
		</div>
		<div class="insamal"
		style="
		
		background-image: url('${pageContext.request.contextPath}/resources/img/infoimg3.jpg');">
			<div class="context2">
				<h1>안녕하십니까</h1>
				
				<p>멍이 냥이 동물병원 원장입니다.</p>
					
				<p>멍이 냥이 동물병원은 2023년 개원 이래 각 전공 분야의 실력있는 수의사들이<br>
				1년 365일 24시간 최선을 다해 진료하는 반려동물 임상 클리닉 센터입니다.</p>
				
				<h1>우리 동물병원은</h1>
				
				<p>- 환자를 우선으로 생각하는 따뜻한 마음<br>
			    - 전문적인 수의의료서비스<br>
				- 경인지역 서부권에서 가장 신뢰받는 병원<br>
				- 지역주민을 위한 봉사활동<br>
				- 다년간 축적된 노하우<br>
				- 끊임없이 연구하는 최상의 치료방법으로<br>
				항상 좋은 결과를 통해 보답하겠습니다.</p>
			</div>
		</div>
		
		<div class="line"></div>

	<div class="last">
		<h1>마지막으로</h1>
		<div class="context3">
			저희 동물의료센터를 찾아주신 반려동물 보호자님께 감사의 말씀을 전합니다.
		</div>
		<div class="line"></div>
	</div>
	
	 <div class="where">
        	<ul class="here">
        		<li>
        			<label id="i">찾아 오시는 길</label>
		     		<div class="mapp">
		       			<img src="${pageContext.request.contextPath}/resources/img/mapp.jpg">
		       		</div>
		       	</li>
		       	<li>
		       		<label>
		       			> 주소안내 : 
		       		</label>
		       		<strong>
		       			인천광역시 부평구 시장로 7 MH타워 5층
		       		</strong>
		       	</li>	
	       		<li>
	       		<label>
	       			> 지하철 : 
	       		</label>
	       		<strong>
	       			부평역 (21-B출구)
	       		</strong>
		       	</li>	
       		</ul>
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