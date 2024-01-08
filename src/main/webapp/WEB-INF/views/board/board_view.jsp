<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/css/board/board_view.css"
	rel="stylesheet">
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="main_category board_wrapperBox">
		<span class="board_category">커뮤니티 게시판</span>
		<div class="board_category">
			<input type="button" value="메인으로 돌아가기" class="inputBtn"
				onclick="location.href='main_home.do'">
		</div>
	</div>
	<!-- qna_wrapperBox -->


	<hr>

	<!-- 게시글 영역 시작 -->
	<div id="board_data">
		<div class="titleData">
			<div class="title">
				<span>${boardData.title}</span>
			</div>
			<div class="nickAndDateAndReadHit dflex">
				<div class="nickAndDate">
					<span class="nickname">${boardData.u_nickname}</span> <span
						class="date">${boardData.regdate}</span>
				</div>
				<div class="readHit">
					<span>조회</span> ${boardData.select}
				</div>
			</div>
		</div>
		<div class="content">
			<span>${boardData.content}</span>
		</div>
			<!-- 게시글 영역 끝 -->
			
			<!-- 버튼 영역 시작 -->
		<div class="actionButton">
			<input class="actionButtons" type="button" value="수정"> <input
				class="actionButtons" type="button" value="삭제">
		</div>
			<!-- 버튼 영역 끝 -->
			
				<!-- 댓글 영역 -->
	<div class="comment">
	<span>댓글</span>
			<div class="commentDatas">
				<div class="commentData dflex">
					<div class="commentNickName">
						<span>노지학</span>
					</div>
					<div class="commentText">
						<span>자살각</span>
					</div>
					<div class="commentRegdate">
						<span>24.01.08 07:32:25</span>
					</div>
				</div>
			</div>
		</div>
			
	</div>





</body>
</html>