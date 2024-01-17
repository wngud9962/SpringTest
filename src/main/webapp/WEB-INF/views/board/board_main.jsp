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
<script type="text/javascript">
	function search() {
		let check = /^[0-9]*$/;
		let searchTypeHead = document.getElementById('searchField').value;
		let searchContent = document.getElementById('searchWord').value.trim();

		if (searchTypeHead == 'idx') {
			if (!check.test(searchContent)) {
				alert('숫자만 입력해 주세요');
				return;
			}
		}
		
		if(searchContent == ''){
			alert('내용을 입력해 주세요.');
			return;
		}
		
		location.href='board_main.do?searchTypeHead='+searchTypeHead+'&searchContent='+searchContent;
		
	}
</script>
</head>
<body>
	<input type="hidden" value="${searchField}" id="hiddenSearchField">
	<div class="main_category board_wrapperBox">
		<span class="board_category" onclick="location.href='board_main.do'">커뮤니티
			게시판</span>
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
				<th style="width: 60px;">번호</th>
				<th style="width: 60px;">말머리</th>
				<th style="width: 500px;">제목</th>
				<th style="width: 150px;">글쓴이</th>
				<th style="width: 100px;">작성일</th>
				<th style="width: 50px;">조회</th>
				<th style="width: 50px;">추천</th>
			</tr>
			<c:if test="${noticeList[0] != null }">
				<c:forEach items="${noticeList}" var="noticeData">
					<c:if test="${noticeData.delinfo == 0}">
						<tr class="listData">
							<td>${noticeData.b_idx}</td>
							<td style="color: red; font-weight: bold;">공지</td>
							<td style="text-align: left; padding-left: 15px;"><a
								href="board_view.do?idx=${noticeData.b_idx}&page=${nowPage}&searchType=${searchType}">${noticeData.title}</a>

								<c:if test="${noticeData.filename != null}">
									<img
										src="${pageContext.request.contextPath}/resources/img/saveImg.png"
										style="width: 10px;">
								</c:if> <span style="color: red; font-weight: bold">[${noticeData.commentCount}]</span>
							</td>
							<td><c:if test="${noticeData.u_type == '0'}">
									<img
										src="${pageContext.request.contextPath}/resources/img/admin.png"
										style="width: 10px; height: 10px;">
								</c:if> ${noticeData.u_nickname}</td>
							<td>${noticeData.regdate}</td>
							<td>${noticeData.select}</td>
							<td>${noticeData.follow}</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>

			<c:if test="${nomalList[0] != null }">
				<c:forEach items="${nomalList}" var="nomalData">
					<tr class="listData">
						<td>${nomalData.b_idx}</td>
						<td>일반</td>
						<c:choose>
							<c:when test="${nomalData.delinfo > 0}">
								<td style="text-align: left; padding-left: 15px;">삭제된 게시물
									입니다.</td>
							</c:when>
							<c:otherwise>
								<td style="text-align: left; padding-left: 15px;"><a
									href="board_view.do?idx=${nomalData.b_idx}&page=${nowPage}&searchType=${searchType}">${nomalData.title}</a>
									<c:if test="${nomalData.filename != null}">
										<img
											src="${pageContext.request.contextPath}/resources/img/saveImg.png"
											style="width: 10px;">
									</c:if> <span style="color: red; font-weight: bold">[${nomalData.commentCount}]</span></td>
							</c:otherwise>
						</c:choose>
						<td><c:if test="${nomalData.u_type == '0'}">
								<img
									src="${pageContext.request.contextPath}/resources/img/admin.png"
									style="width: 10px; height: 10px;">
							</c:if> ${nomalData.u_nickname}</td>
						<td>${nomalData.regdate}</td>
						<td>${nomalData.select}</td>
						<td>${nomalData.follow}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${noticeList[0]==null && nomalList[0]==null}">
				<tr class="listData">
					<td colspan="7">게시글이 없습니다.</td>
				</tr>
			</c:if>
		</table>

	</div>

	<div class="board_wrapperBox">
		<div id="inputButtons">
			<div class="arraysButton" style="margin-left: 10px;">
				<input type="button" value="공지"
					onclick="location.href='${mapping}?page=1&searchType=notice'">
				<input type="button" value="일반"
					onclick="location.href='${mapping}?page=1&searchType=nomal'">
			</div>
			<c:if test="${id!=null}">
				<input type="button" value="글쓰기" style="margin-right: 10px;"
					onclick="location.href='board_form.do'">
			</c:if>
		</div>

		<c:if test="${searchType != 'notice'}">
			<jsp:include page="../paging/paging.jsp"></jsp:include>
		</c:if>

		<div class="list_search" style="background-color: white">
			<form class="searchform" name="list_search_form">
				<fieldset>
					<select id="searchField">
						<option value="idx">글 번호</option>
						<option value="title">제목</option>
						<option value="writter">작성자</option>
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
					<button class="submit" type="button" onclick="search()">
						<img
							src="https://www.coffeebeankorea.com/images/btn/btn_list_search.png">
					</button>
				</fieldset>
			</form>
		</div>
	</div>

</body>
</html>