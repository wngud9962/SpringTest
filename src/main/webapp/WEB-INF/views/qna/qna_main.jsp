<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/qna/qna_main.css" rel="stylesheet">
<script type="text/javascript">

	function refresh(){
		location.reload();
	}

	function send(){
		//검색창에 조회했을때 조회값 가져오기
		let searchField = document.getElementById('searchField').value;
		let searchWord = document.getElementById('searchWord').value;

		location.href ="qna_search.do?searchField="+ searchField + "&searchWord="+ searchWord ;
		
	}
	
	function testfn(){
		document.getElementById("test").style.maxHeight = "100%";
		
		document.getElementById("testBtn").style.display = "none"
		
	}
</script>
</head>
	<body>
	
	<div class="qna_wrapperBox">
		<span class="qna_category">Q&A 카테고리</span>	
		<div class="qna_category">
				<input type="button" value="공지사항" class="inputBtn" onclick="location.reload()">
				<input type="button" value="메인으로 돌아가기" class="inputBtn" onclick="location.href='main_home.do'">
				
				<%-- <c:if test="${ id.u_type == 1}"> --%>
				<c:if test="${ not empty id}">
					<input type="button" value="글쓰기" class="inputBtn" onclick="location.href='qna_form.do'">
				</c:if>
				
				
		</div>
	</div> <!-- qna_wrapperBox -->

	<div class="qna_wrapperBox">
		<span class="qna_category">
			필독 공지사항
		</span>
	</div>
	
	<div class="qna_wrapperBox" >
		<div class="list_search" style="background-color:white">
			<form class="searchform" name="list_search_form">
				<fieldset >
					<select id="searchField">
						<option value="idx">글 번호</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input class="search" id="searchWord" type="text" placeholder="검색어를 입력하세요">
					<button class="submit" type="button" onclick="send()" ><img src="https://www.coffeebeankorea.com/images/btn/btn_list_search.png"></button>
				</fieldset>
			</form>
			<p class="bestSearch"><strong>BEST 검색어 : </strong>예약 리뷰 펫등록</p>
		</div>
	</div>
	
	
	<div class="qna_wrapperBox" id="center">
	
		<hr>
		<div id="test">
			<c:forEach var="qna" items="${list }">
				<div class="listBox" onclick="location.href='qna_view.do'">
					
					
					<a href="qna_view.do?q_idx=${qna.q_idx }">
						<div class="table">
							<span class="th">번호</span>
							<span class="align">${qna.q_idx }</span>
						</div>
						<div class="table">
							<span class="th">제목</span>
							<span class="align">${qna.q_title }</span>
						</div>
						<div class="table">
							<span class="th">일자</span>
							<span class="align">${qna.q_regdate }</span>
						</div> 
						<div class="table">
							<span class="th">파일</span>
							<span class="align">
								<img src="${pageContext.request.contextPath}/resources/upload/qna/${qna.q_filename}" width="100px" height="100px">
							</span>
						</div> 
					</a>
				</div>
			</c:forEach>
		</div>

	<!-- <c:if test="${not empty big}"> !-->
		<c:if test="${size > 2}">
			<input id="testBtn" type="button" class="inputBtn" value="더보기 +" onclick="testfn()">
		</c:if>
	</div>
	
</body>
</html>