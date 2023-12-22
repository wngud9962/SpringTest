<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/qna/qna_form.css" rel="stylesheet">
<script type="text/javascript">
	function send(f){
		
		if(f.q_title.value.trim() == ''){
			alert('제목을 입력하세요');
			f.subject.focus();
			return;
		}
		
		if(f.q_content.value.trim() == ''){
			alert('다섯글자 이상 입력하세요');
			f.content.focus();
			return;
		}
		
		f.method="POST";
		f.action="qna_insert.do";
		f.submit();
			
	}
	
	function refresh(){
		location.reload();
	}

</script>
</head>
<body>
	<!-- Q&A 글쓰기 -->
	<div class="qna_wrapperBox">
		<span class="qna_category">Q&A 카테고리</span>	
		<div class="qna_category">
			<input type="button" value="자주 묻는 질문" class="inputBtn" onclick="location.reload()">
			<input type="button" value="메인으로 돌아가기" class="inputBtn" onclick="location.href='main_home.do'">
			<input type="button" value="QNA홈으로" class="inputBtn" onclick="location.href='qna_main.do'">
			
		</div>
	</div> <!-- qna_wrapperBox -->
	
	<div class="qna_wrapperBox">
		<span class="qna_category">
			자주 묻는 질문 작성하기
		</span>
	</div>	
	
	
	<div class="qna_wrapperBox">
		<span>${id.u_nickName}</span>
	</div>
	
	<form enctype="multipart/form-data">
		<div class="qna_wrapperBox">
			<input class="titleBox" name="q_title" placeholder="제목을 입력해 주세요">
				
			<div class="qna_upload_text">
				<textarea class="titleBox_long" name="q_content" placeholder="5자 이상 내용을 입력해주세요"></textarea>
			</div>
		</div>
		
		<!-- 사진 첨부파일 업로드 폼 -->
		<div class="qna_wrapperBox">
			<span class="qna_category">
				사진 업로드
			</span>
			<div class="qna_imgContainer"></div>
				<input type="file" name="q_file" value="사진첨부" class="inputBtn"	 multiple>
			<p><strong>개당 업로드 용량 : 10MB, 용량을 준수하여 업로드 부탁드립니다</strong></p>
		</div>
			
		<div class="qna_wrapperBox">
			<span>
				<input type="button" value="글 등록하기" class="inputBtn" onclick="send(this.form);">
			</span>
			<span>
				<input type="button" value="취소하기" class="inputBtn" onclick="location.href='qna_main.do'">
			</span>
		</div>
	</form> <!-- 사진 첨부파일 업로드 폼 -->
	
	
	<div class="qna_wrapperBox">
		<ul>
			<li>
				사진 업로드 시, 업로드된 사진 중 첫번째 순서의 사진이 썸네일로 지정됩니다.
			</li>
			<li>
				사진 업로드 후, 수정시에는 파일이 자동으로 삭제됩니다.
			</li>
			<li>
				현 게시판은 반드시 관리자의 권한을 받아 게시글 업로드를 진행합니다.
			</li>
		</ul>
	</div>
</body>
</html>