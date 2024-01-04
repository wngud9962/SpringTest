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
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function send(f){
		let point = f.point.value;
		let title =f.title.value;
		let content = f.content.value;
		let file = f.file.value;
		
		if(title.trim().length == 0){
			alert("제목을 입력해 주십시오.");
			return;
		}
		
		if(content.trim().length == 0){
			alert("내용을 입력해 주십시오.");
			return;
		}
		
		let url = "board_insert.do";
		let param = "point="+point+"&title="+title+"&content="+content+"&file="+file;
		let method = "POST";
		
		sendRequest(url, param, insertAfter, method);
	}
	
	function insertAfter(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			let JSON = eval(data);
			
			if(JSON[0].param == 'no'){
				alert("등록에 실패하였습니다.");
				return;
			}
			
			if(JSON[0].param == 'yes'){
				alert("등록되었습니다.");
				location.href = "board_main.do";
			}
		}
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

		<hr>

		<form method="post" enctype="multipart/form-data">
			<table align="center">
				<tr>
					<th>말머리</th>
					<td><select name="point">
							<c:if test="${id.u_type=='0'}">
								<option value="0">공지</option>
							</c:if>
							<option value="1">일반</option>
					</select></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" style="width: 360px;"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="50" name="content"
							style="resize: none;"></textarea></td>
				</tr>
				<tr>
					<th>파일 업로드</th>
					<td><input type="file" name="file"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" value="등록"
					onclick="send(this.form)">
						<input type="button" value="취소" onclick="location.href='board_main.do'"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>