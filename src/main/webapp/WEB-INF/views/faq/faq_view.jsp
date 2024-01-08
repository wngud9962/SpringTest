<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/faq/faq_view.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript">

	function refresh(){
		location.reload();
	}	
	
	//삭제시
	function faq_del(){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		
		let url = "faq_del.do"; 
		let param = "f_idx=${faqVO.f_idx}";
		
		sendRequest(url,param,delCheck,"POST");
	}
	
	function delCheck(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data =xhr.responseText; //xhr = new XMLHttpRequest(); 를 담는 변수
			
			let json = eval(data);
			
			if(json[0].result == 'yes'){
				location.href="faq_main.do";  
			} else {
				alert("실패");
			}
		}
	}
	
	//수정시
	function faq_edit_form(){
		if(!confirm("수정하시겠습니까?")){
			return;
		}
		
		let f_idx = ${faqVO.f_idx};
		location.href="faq_edit_form.do?f_idx="+f_idx;
		
		sendRequest(url,param,delCheck,"POST");
	}

</script>
</head>
<body>
	
	<div class="faq_wrapperBox">
		<span class="faq_category">FAQ 카테고리</span>	
		<div class="faq_category">
				<input type="button" value="상세보기" class="inputBtn" onclick="location.reload()">
				<input type="button" value="메인으로 돌아가기" class="inputBtn" onclick="location.href='main_home.do'">
				<input type="button" value="공지사항" class="inputBtn" onclick="location.href='faq_main.do'">
				
				<c:choose>
					<c:when test="${not empty id && id.u_type == '0'}">
						<input type="button" value="글쓰기" class="inputBtn" onclick="location.href='faq_form.do'">
					</c:when>
				</c:choose>
		</div>
	</div> <!-- faq_wrapperBox -->

	<div class="faq_wrapperBox">
		<span class="faq_category">
			공지사항 상세보기
		</span>
	</div>
	
	<div class="faq_wrapperBox">
	
		<hr />
		<div class="listBox">
			<div class="table">
				<span class="th">제목</span>
				<span class="align">${faqVO.f_title}</span>
			</div>
			
			<div class="table">
				<span class="th">번호</span>
				<span class="align">${faqVO.f_idx }</span>
			</div>
			
			<div class="table">
				<span class="th">일자</span>
				<span class="align">${faqVO.f_regdate }</span>
			</div>
			
			<div class="table">
				<span class="th">내용</span>
				<span class="align" width="500px" height="200px">
					<div class="nopadding">
					<c:if test="${faqVO.f_filename!='no_file'}">
					<img src="${pageContext.request.contextPath}/resources/upload/faq/${faqVO.f_filename}"
					width="300px" height="300px">
					</c:if>				
					</div>
					${faqVO.f_content}
				</span>
			</div>
			
			<c:choose>
				<c:when test="${id.u_type==0}">
					<div class="btnBox">
						<input type="button" value="수정" class="Btn" onclick="faq_edit_form()">
						<input type="button" value="삭제" class="Btn" onclick="faq_del()">
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
</body>
</html>