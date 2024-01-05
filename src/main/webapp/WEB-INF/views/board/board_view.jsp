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

	<div class="board_content">

		<hr>

		<form method="post" enctype="multipart/form-data">
			<table align="center">

				<tr>
					<th>제목</th>
					<td>${boardData.title}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${boardData.content}</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
					<c:if test="${id.u_idx == boardData.u_idx}">
						<input type="button" value="수정" onclick="location.href='board_update.do?b_idx=${boardData.b_idx}'">
					</c:if>
						<input type="button" value="목록" onclick="location.href='board_main.do'"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>