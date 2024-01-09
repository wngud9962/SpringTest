<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/template/header.css">
<script type="text/javascript">
</script>
</head>						
		<div class="intro-bg">
		<div class="header">
			<div class="logo">
					<a href="main_home.do" id="logoa"><img src="resources/img/titleLogo.jpg" width="130px" height="130px"></a>
		        </div>
			<div class="title">
		        	<ul class="nav">
			            <li><a href="info_main.do">병원소개</a></li>
			            <li><a href="review_main.do">리뷰</a></li>
			            <li><a href="faq_main.do">FAQ</a></li>
			            <li><a href="rev_main.do">예약</a></li>
			            <li><a href="board_main.do">게시판</a></li>
			          	<c:choose>
							<c:when test="${empty id}">
								<!--  <li><a href="login_main.do">펫 등록</a></li>
								<li><a href="login_main.do">정보수정</a></li>-->
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