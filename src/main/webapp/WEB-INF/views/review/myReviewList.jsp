<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review/review_main.css">
<script type="text/javascript">
	function go(f){
		var u_idx = f.u_idx.value;
		
		if(u_idx == ''){
			alert('로그인이 필요합니다.');
			location.href = "login_main.do";
		} else{
			f.action = "reivewInsert.do";
			f.submit();
		}
	}

	function openImage(imageSrc) {
	 	window.open(imageSrc, '_blank', 'width=1000, height=800');
	 } 
</script>
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
	
		<div class="content">
			<form >
				<div class="r_bt">
					<input class="bt" type="button" value="목록으로" onclick="location.href='review_main.do'">
				</div>	
			<div class="list">
				<table class="rrr">
					<c:choose>
						<c:when test="${empty list }">
							<h2>작성한 리뷰가 없습니다.</h2>
						</c:when>
						<c:when test="${not empty list }">
							<caption><h2>내가 쓴 리뷰</h2></caption>
							<tr>
								<td colspan="2"><div class="line"></div></td>
							</tr>
							<c:forEach var="vo" items="${list }">
								<input type="hidden" name="u_idx" value="${vo.u_idx}">
								<input type="hidden" value="${vo.r_idx}" name="r_idx">
								
								<tr>
									<td colspan="2" id="n">작성자 : ${vo.u_nickName}</td>
								</tr>
								
								<tr>
									<c:choose>
										<c:when test="${vo.r_photo != 'no_file' and vo.r_photo!=null}">
											<td>
												<img src="${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}"
												width="150" height="150" onclick="openImage('${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}')"
												style="cursor: pointer;">
											</td>
										</c:when>
										
										<c:when test="${vo.r_photo == 'no_file' or vo.r_photo==null}">
											<td>
												<img src="${pageContext.request.contextPath}/resources/reviewImg/defaultImg.jpg"
												width="150" height="150">
											</td>
										</c:when>
									</c:choose>
									<td id="c">
										<textarea class="col-auto form-control"
											id="reviewContents" placeholder="${vo.r_content }" readonly></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" id="d">작성일 : ${vo.r_regdate}</td>
								</tr>
								
								<tr>
									<td colspan="2"><div class="line"></div></td>
								</tr>
								
								<tr>
									<td colspan="2" align="right">
										<input type="button"  value="수정" class="btn2" onclick="location.href='view.do?r_idx=${vo.r_idx}'">
									</td>
								</tr>
								
								<tr>
									<td colspan="2"><div class="line"></div></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
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