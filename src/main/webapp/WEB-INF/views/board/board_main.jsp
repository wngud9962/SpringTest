<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/board/board_main.css" rel="stylesheet">
</head>
	<body>
	<input type="hidden" value="${searchField}" id="hiddenSearchField">
	<div class="qna_wrapperBox">
		<span class="board_category">커뮤니티 게시판</span>	
		<div class="qna_category">
				<input type="button" value="메인으로 돌아가기" class="inputBtn" onclick="location.href='main_home.do'">
				<c:if test="${id!=null}">
					<input type="button" value="글쓰기" class="inputBtn" onclick="location.href='board_form.do'">
				</c:if>
		</div>
	</div> <!-- qna_wrapperBox -->


	

	
	<div class="qna_wrapperBox" id="center">
	
		<hr>
		<table align = "center" style="border-collapse: collapse;">
		
		<tr>
		<th style="width: 60px;">번호</th>
		<th style="width: 60px;">말머리</th>
		<th style="width: 500px;">제목</th>
		<th style="width: 150px;">글쓴이</th>
		<th style="width: 100px;">작성일</th>
		<th style="width: 50px;">조회</th>
		<th style="width: 50px;">추천</th>
		</tr>
		<c:choose>
		<c:when test="${list[0] != null }">
		<c:forEach items="${list}" var="boardData">
		<tr class="listData">
		<td>${boardData.b_idx}</td>
		<td>일반</td>
		<td style="text-align: left; padding-left: 15px;"><a href="#">${boardData.title}</a></td>
		<td>${boardData.u_idx}</td>
		<td>${boardData.regdate}</td>
		<td>0</td>
		<td>0</td>
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<tr>
		<td colspan="7" class="endLine">게시글이 없습니다.</td>
		</tr>
		</c:otherwise>
		</c:choose>
		</table>
	</div>
	
		<div class="qna_wrapperBox" >
		<div class="list_search" style="background-color:white">
			<form class="searchform" name="list_search_form">
				<fieldset>
					<select id="searchField">
						<option value="idx">글 번호</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<c:choose>
					<c:when test="${searchWord!=null}">
						<input class="search" id="searchWord" type="text" value="${searchWord}" placeholder="검색어를 입력하세요">
					</c:when>
					<c:otherwise>
							<input class="search" id="searchWord" type="text" style="width: 855px;"
								placeholder="검색어를 입력하세요">
						</c:otherwise>
					</c:choose>
					<button class="submit" type="button" onclick="send()" ><img src="https://www.coffeebeankorea.com/images/btn/btn_list_search.png"></button>
				</fieldset>
			</form>
		</div>
	</div>
	
</body>
</html>