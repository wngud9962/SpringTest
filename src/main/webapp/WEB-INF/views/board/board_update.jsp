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

	function send(f) {
	
		let title = f.title.value.trim();
		let content = f.content.value.trim();
		
		if(title==''){
			alert('제목이 비워져있슶니다.');
			return;
		}
		if(content==''){
			alert('내용이 비워져있습니다.');
			return;
		}
		
		f.method = 'POST';
		f.action = 'board_updateProcess.do';
		f.submit();
		
	}
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
		<form enctype="multipart/form-data">
	<div id="board_data">
		<input type="hidden" name="b_idx" value="${updateData.b_idx}">
		<input type="hidden" name="u_idx" value="${updateData.u_idx}">
			<div class="titleData">
				<div class="title">
					<input type="text" name="title" value="${updateData.title}"
						style="width: 980px;" placeholder="제목 입력">
				</div>

			</div>
			<div class="content">
				<textarea
					name="content" style="resize: none; border-width: 0px; width: 980px; overflow: hidden; min-height: 200px;" placeholder="내용 입력">${updateData.content}</textarea>
			</div>

			<div class="download">
				<span>첨부파일</span> <input name="file" type="file" value="${updateData.filename}"
					id="fileInput">
			</div>
		<!-- 게시글 영역 끝 -->

		<!-- 버튼 영역 시작 -->
		<div class="actionButton dflex"
			style="justify-content: space-between;">
			<input class="actionButtons" type="button" value="목록"
				onclick="location.href='board_main.do'">
			<div>
				<input class="actionButtons" type="button" value="수정"
					onclick="send(this.form)">
				<input class="actionButtons" type="button" value="취소"
					onclick="location.href='board_view.do?idx=${updateData.b_idx}'">
			</div>
		</div>
		<!-- 버튼 영역 끝 -->
	</div>
		</form>





</body>
</html>