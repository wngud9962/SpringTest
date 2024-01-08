<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/css/board/board_update.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
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
				<input type="text" value="${updateData.title}" style="width: 980px;">
			</div>

		</div>
		<div class="content">
			<textarea
				style="resize: none; border-width: 0px; width: 980px; overflow: hidden; min-height: 200px;">${updateData.content}</textarea>
		</div>

		<div class="download">
			<span>첨부파일</span>
			<input type="file" value="${updateData.filename}">
		</div>
		<!-- 게시글 영역 끝 -->

		<!-- 버튼 영역 시작 -->
		<div class="actionButton dflex"
			style="justify-content: space-between;">
			<input class="actionButtons" type="button" value="목록"
				onclick="location.href='board_main.do'">
			<div>
				<input class="actionButtons" type="button" value="수정"
					onclick="location.href='board_update.do?b_idx=${boardData.b_idx}'">
				<input class="actionButtons" type="button" value="취소"
					onclick="location.href='board_view.do?idx=${updateData.b_idx}'">
			</div>
		</div>
		<!-- 버튼 영역 끝 -->

	</div>





</body>
</html>