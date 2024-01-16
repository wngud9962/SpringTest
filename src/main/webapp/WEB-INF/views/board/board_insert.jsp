<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/css/board/board_insert.css"
	rel="stylesheet">
<script type="text/javascript">
	function send(f){
		let point = f.point.value;
		let title =f.title.value;
		let content = f.content.value;
		let file = f.file.files[0];

		
		
		if(title.trim().length == 0){
			alert("제목을 입력해 주십시오.");
			return;
		}
		
		if(content.trim().length == 0){
			alert("내용을 입력해 주십시오.");
			return;
		}
		f.action = "board_insert.do";
		f.method = "post";
		f.submit();
	}
		
		
</script>
</head>
<body>
	<input type="hidden" value="${searchField}" id="hiddenSearchField">
	<div class="main_category board_wrapperBox">
		<span class="board_category">커뮤니티 게시판</span>
		<div class="board_category">
			<input type="button" value="메인으로 돌아가기" class="inputBtn"
				onclick="location.href='main_home.do'">
		</div>
	</div>
	<!-- qna_wrapperBox -->

	<div class="board_content">

		<form enctype="multipart/form-data">
			<div id="board_data">
				<div class="headPoint">
				<div class = "headTitle">말머리</div>
					<select name="point">
						<c:if test="${id.u_type=='0'}">
							<option value="0" style="color: red;">공지</option>
						</c:if>
						<option value="1">일반</option>
					</select>
				</div>

				<div class="titleData">
					<div class="title">
						<input type="text" name="title" style="width: 980px;"
							placeholder="제목 입력">
					</div>
				</div>
				<div class="content">
					<textarea name="content"
						style="resize: none; border-width: 0px; width: 980px; overflow: hidden; min-height: 200px;"
						placeholder="내용 입력"></textarea>
				</div>

				<div class="download">
					<span>첨부파일</span> <input name="file" type="file" id="fileInput">
				</div>
				<!-- 게시글 영역 끝 -->

				<!-- 버튼 영역 시작 -->
				<div class="actionButton dflex"
					style="justify-content: space-between;">
					<input class="actionButtons" type="button" value="목록"
						onclick="location.href='board_main.do'">
					<div>
						<input class="actionButtons" type="button" value="등록"
							onclick="send(this.form)"> <input class="actionButtons"
							type="button" value="취소" onclick="location.href='board_view.do'">
					</div>
				</div>
				<!-- 버튼 영역 끝 -->
			</div>
		</form>
	</div>

</body>
</html>