<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/css/board/board_main.css"
	rel="stylesheet">
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

	<div class="board_wrapperBox" id="center">

		<hr>
		<table align="center">
			<tr>
			<th>말머리</th>
			<td>
			<select>
			<option>공지</option>
			<option>일반</option>
			</select>
			</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text"></td>
			</tr>
			<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="50" style="resize: none;"></textarea></td>
			</tr>

		</table>

	</div>

	<div class="board_wrapperBox">
		<div id="inputButtons">
			<div class="arraysButton">
				<input type="button" value="공지"> 
				<input type="button" value="일반">
			</div>
			<c:if test="${id!=null}">
				<input type="button" value="글쓰기" onclick="location.href='board_form.do'">
			</c:if>
		</div>
		<div class="paging" style="text-align: center;">
		1 2 3 4 5
		</div>
		<div class="list_search" style="background-color: white">
			<form class="searchform" name="list_search_form">
				<fieldset>
					<select id="searchField">
						<option value="idx">글 번호</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<c:choose>
						<c:when test="${searchWord!=null}">
							<input class="search" id="searchWord" type="text"
								value="${searchWord}" placeholder="검색어를 입력하세요">
						</c:when>
						<c:otherwise>
							<input class="search" id="searchWord" type="text"
								style="width: 855px;" placeholder="검색어를 입력하세요">
						</c:otherwise>
					</c:choose>
					<button class="submit" type="button" onclick="send()">
						<img
							src="https://www.coffeebeankorea.com/images/btn/btn_list_search.png">
					</button>
				</fieldset>
			</form>
		</div>
	</div>

</body>
</html>