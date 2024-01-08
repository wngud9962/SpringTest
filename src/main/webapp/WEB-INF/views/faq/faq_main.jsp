<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/faq/faq_main.css" rel="stylesheet">
<script type="text/javascript">

//검색하면 필드 세팅
	window.onload = function(){
		let $hiddenSearchField = document.getElementById('hiddenSearchField').value; 
		let fieldData = document.getElementById('searchField');
		switch($hiddenSearchField){
		case 'idx':
			fieldData.selectedIndex = 0;
			break;
		case 'title':
			fieldData.selectedIndex = 1;
			break;
		case 'content':
			fieldData.selectedIndex = 2;
			break;
		}
	}

	function refresh(){
		location.reload();
	}

	function send(){
		//검색창에 조회했을때 조회값 가져오기
		let searchField = document.getElementById('searchField').value;
		let searchWord = document.getElementById('searchWord').value;
		
		if(searchField == 'idx'){
			var check = /^[0-9]+$/;
			if(!check.test(searchWord)){
				alert('sdsss');
				return;
			}
		}

		location.href ="faq_search.do?searchField="+ searchField + "&searchWord="+ searchWord ;
		
	}
	
	function testfn(){
		document.getElementById("test").style.maxHeight = "100%";
		
		document.getElementById("testBtn").style.display = "none"
		
	}
</script>
</head>
	<body>
	<input type="hidden" value="${searchField}" id="hiddenSearchField">
	<div class="faq_wrapperBox">
		<span class="faq_category">FAQ 카테고리</span>	
		<div class="faq_category">
				<input type="button" value="공지사항" class="inputBtn" onclick="location.reload()">
				<input type="button" value="메인으로 돌아가기" class="inputBtn" onclick="location.href='main_home.do'">
				
				
				<c:if test="${not empty id && id.u_type == '0'}">
					<input type="button" value="글쓰기" class="inputBtn" onclick="location.href='faq_form.do'">
				</c:if>
				
				
		</div>
	</div> <!-- faq_wrapperBox -->

	<div class="faq_wrapperBox">
		<span class="faq_category">
			필독 공지사항
		</span>
	</div>
	
	<div class="faq_wrapperBox" >
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
							<input class="search" id="searchWord" type="text"
								placeholder="검색어를 입력하세요">
						</c:otherwise>
					</c:choose>
					<button class="submit" type="button" onclick="send()" ><img src="https://www.coffeebeankorea.com/images/btn/btn_list_search.png"></button>
				</fieldset>
			</form>
			<p class="bestSearch"><strong>BEST 검색어 : </strong>예약 리뷰 펫등록</p>
		</div>
	</div>
	
	
	<div class="faq_wrapperBox" id="center">
	
		<hr>
		<div id="test">
			<c:forEach var="faq" items="${list}">
				<div class="listBox" onclick="location.href='faq_view.do'">
					
					
					<a href="faq_view.do?f_idx=${faq.f_idx}">
						<div class="table">
							<span class="th">번호</span>
							<span class="align">${faq.f_idx }</span>
						</div>
						<div class="table">
							<span class="th">제목</span>
							<span class="align">${faq.f_title}</span>
						</div>
						<div class="table">
							<span class="th">일자</span>
							<span class="align">${faq.f_regdate}</span>
						</div> 
							<c:if test="${faq.f_filename!='no_file'}">
						<div class="table">
							<span class="th">파일</span>
							<span class="align">
							<img src="${pageContext.request.contextPath}/resources/upload/faq/${faq.f_filename}" width="100px" height="100px">
								
							</span>
						</div> 
							</c:if>
					</a>
				</div>
			</c:forEach>
		</div>


		<c:if test="${size > 2}">
			<input id="testBtn" type="button" class="inputBtn" value="더보기 +" onclick="testfn()">
		</c:if>
	</div>
	
</body>
</html>