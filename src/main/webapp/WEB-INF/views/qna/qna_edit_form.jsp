<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/qna/qna_form.css" rel="stylesheet">
<script type="text/javascript">

	function refresh(){
		location.reload();
	}
	
	function qna_update(f){
		
		 if(!confirm("수정완료 하시겠습니까?")){
			return;
		} 
		
		f.method="POST";
		f.action="qna_update.do";
		f.submit();	
		
		
		//sendRequest(url,param,delCheck,"POST");
		//(어디에서, 어떤값을가지고, (컨트롤러 가서 처리후) 받아온 값을 처리할 함수, 전달방식)
	}
	
	function displayImg(){
		let fileInput = document.getElementById('q_file');
		let img = document.getElementById('img_id');
		
		let file = fileInput.files[0];
		
		if(file){
			let reader = new FileReader();
			
			reader.onload = function(e){
				img.src = e.target.result;
			};
			
			reader.readAsDataURL(file);
		}
	}

</script>
</head>

<body>
	<!-- Q&A 수정 글쓰기 -->
	<div class="qna_wrapperBox">
		<span class="qna_category">Q&A 카테고리</span>	
		<div class="qna_category">
				<input type="button" value="상세보기" class="inputBtn" onclick="location.reload()">
				<input type="button" value="메인으로 돌아가기" class="inputBtn" onclick="location.href='main_home.do'">
				<input type="button" value="공지사항" class="inputBtn" onclick="location.href='qna_main.do'">
				<input type="button" value="글쓰기" class="inputBtn" onclick="location.href='qna_form.do'">
		</div>
	</div> <!-- qna_wrapperBox -->

	<div class="qna_wrapperBox">
		<span class="qna_category">
			공지사항 상세보기
		</span>
	</div>
	
	
	<div class="qna_wrapperBox">
		<hr>	
		
	</div>
	
	<form enctype="multipart/form-data">
		<div class="qna_wrapperBox">
		
			<input class="titleBox" name="q_title" value="${qnaVO.q_title}">
			<input type="hidden" name="q_idx" value="${qnaVO.q_idx}">
			<input type="hidden" name="q_filename" value="${qnaVO.q_filename}">
				
			<div class="qna_upload_text">
				<textarea class="titleBox_long" name="q_content" >${qnaVO.q_content}</textarea> 
			</div>
		</div>
		
		<!-- 사진 첨부파일 업로드 폼 -->
		<div class="qna_wrapperBox">
			<span class="qna_category">
				사진 업로드
			</span>
			<img id="img_id" src="${pageContext.request.contextPath}/resources/upload/qna/${qnaVO.q_filename}">
			<div class="qna_imgContainer"></div>
				<input type="file" id="q_file" onchange="displayImg()" name="q_file" value="${pageContext.request.contextPath}/resources/upload/qna/${qnaVO.q_filename}"
						width="200px" height="200px" class="inputBtn">
			<p><strong>개당 업로드 용량 : 10MB, 용량을 준수하여 업로드 부탁드립니다</strong></p>
		</div>
			
		<div class="qna_wrapperBox">
			<span>
				<input type="button" value="수정완료" class="inputBtn" onclick="qna_update(this.form);">
			</span>
			<span>
				<input type="button" value="돌아가기" class="inputBtn" onclick="location.href='qna_view.do?q_idx=${qnaVO.q_idx}'">
		</div>
	</form> <!-- 사진 첨부파일 업로드 폼 -->
	
	
	<div class="qna_wrapperBox">
		<ul>
			<li>
				관리자의 권한으로 내용 수정시, 수정내용은 저장되지 않으며 수정완료 후 복구가 어렵습니다.
			</li>
			<li>
				현 게시판은 관리자의 권한으로 수정되기 때문에 반드시 관리자가 수정할 것을 권장합니다.
			</li>
		</ul>
	</div>
</body>
</html>