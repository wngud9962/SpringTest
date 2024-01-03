<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/rev/rev_select.css">
<script type="text/javascript">
	function rev_cancle(f){
		var u_idx = f.u_idx.value;
		var rv_idx = f.rv_idx.value;

		if(!confirm("예약을 취소하시겠습니까?")){
			return;
		} else {
				
			f.action = "rev_cancle.do";
			f.submit();
		}
		
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
		<form>
			<input type="hidden" name="u_idx" value="${id.u_idx }">
			
			<div class="txt1">
				<h1 align="center">내 예약 정보</h1>
				
				<div class="line"></div>
				
				<div class="next">
					<input type="button" value="완료" onclick="location.href='rev_main.do'"
					       style="cursor: pointer;">
				</div>
			</div>
				
			
			<div class="txt2">
				<c:if test="${empty list }">
					<p>예약된 정보가 없습니다.</p>
				</c:if>
				<table class="table">
					<c:forEach var="vo" items="${list}">
						<tr>
							<td colspan="2"><div class="line2"></div></td>
						</tr>
						<tr>
							<th>예약자 : </th>
							<td>${vo.u_name}</td>
						</tr>
				
						<tr>
							<th>예약 날짜</th>
							<td>${vo.rv_day}</td>
						</tr>
						<tr>
							<th>예약 시간</th>
							<td>${vo.rv_time}</td>
						</tr>
						<tr>
							<td colspan="2"><div class="line2"></div></td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<input type="hidden" name="rv_idx" value="${vo.rv_idx}" >
								<input type="button" value="예약취소" onclick="rev_cancle(this.form)"
									   style="cursor: pointer;">
							</td>
						</tr>
						<tr>
							<td colspan="2"><div class="line2"></div></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</form>
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