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
<script
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	

	
	function del(b_idx) {
		
		let url = "board_delete.do";
		let param = "b_idx="+b_idx;
		let method = "POST";
		
		sendRequest(url, param, delAfter, method);
	}
	function delAfter() {
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			let JSON = eval(data);
		
			if(JSON[0].res == 'no'){
				alert("게시물 삭제에 실패하였습니다.");
				return;
			}
			if(JSON[0].res == 'yes'){
				alert("게시물이 삭제되었습니다.");
				location.href = 'board_main.do';
			}
	
		}
	}
	
	function commentSend(f) {
		let commentArea = f.content.value.trim();
		
		if(commentArea == ''){
			alert('댓글 내용이 비워져 있습니다.');
			return;
		}
		
		f.method = "POST";
		f.action = "commentInsert.do";
		f.submit();
		
		
	}

	function commentInput(rank){
		let displayOnTag = document.getElementsByClassName('hiddenArea');
		if(displayOnTag[rank-1].style.display == 'none'){
		displayOnTag[rank-1].style.display = 'flex';			
		} else{
			displayOnTag[rank-1].style.display = 'none';	
		}
	}
	
	function commentInCommentSend(f){
		let content = f.commentContent.value.trim();
		
		if(content == ''){
			alert('답글 내용이 비워져 있습니다.');
			return;
		}
		
		f.method = 'POST';
		f.action = 'commentInCommentInsert.do';
		f.submit();
	}

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



	<hr>

	<!-- 게시글 영역 시작 -->
	<div id="board_data">
		<div class="titleData">
			<div class="title">
				<span>${boardData.title}</span>
			</div>
			<c:if test="${boardData.filename!=null}">
				<div class="download">
					<span>첨부파일</span> <a
						href="board_download.do?filename=${boardData.filename}&b_idx=${boardData.b_idx}">
						<img
						src="${pageContext.request.contextPath}/resources/img/saveImg.png"
						style="width: 10px;"> ${boardData.filename}
					</a>
				</div>
			</c:if>
			<div class="nickAndDateAndReadHit dflex">
				<div class="nickAndDate">
					<span class="nickname">${boardData.u_nickname}</span> <span
						class="date">${boardData.regdate}</span>
				</div>
				<div class="readHit">
					<span>조회</span> ${boardData.select}
				</div>
			</div>

		</div>
		<div class="content">
			<span>${boardData.content}</span>
		</div>
		<!-- 게시글 영역 끝 -->

		<!-- 버튼 영역 시작 -->
		<div class="actionButton dflex"
			style="justify-content: space-between;">
			<input class="actionButtons" type="button" value="목록"
				onclick="location.href='board_main.do'">
			<div>
				<c:if test="${id!=null && id.u_idx == boardData.u_idx}">
					<input class="actionButtons" type="button" value="수정"
						onclick="location.href='board_update.do?b_idx=${boardData.b_idx}'">
					<input class="actionButtons" type="button" value="삭제"
						onclick="del(${boardData.b_idx})">
				</c:if>
			</div>
		</div>
		<!-- 버튼 영역 끝 -->

		<!-- 댓글 영역 -->
		<div class="comment">
			<span>댓글</span>
			<div class="commentDatas">
				<c:if test="${id!=null}">
					<form>
						<div class="myComment dflex">
							<input type="hidden" name="b_idx" value="${boardData.b_idx}">
							<textarea name="content" class="myCommentArea"
								placeholder="댓글 입력"></textarea>
							<input class="commentButton" type="button" value="댓글 쓰기"
								onclick="commentSend(this.form)">
						</div>
					</form>
				</c:if>



				<c:if test="${commentData[0] != null}">
					<c:forEach items="${commentData}" var="commentData">
						<form>
							<c:choose>

								<c:when test="${commentData.depth == 0}">
									<div class="commentData">
										<div class="dflex">
											<div class="commentNickName">
												<span>${commentData.u_idx}</span>
											</div>
											<div class="commentText">
												<span>${commentData.content}</span>
											</div>
											<div class="commentRegdate">
												<span>${commentData.regdate}</span>
											</div>
										</div>
										<c:if test="${id!=null}">
											<div class="commentAfter">
												<input class="actionButtons" type="button" value="수정">
												<input class="actionButtons" type="button" value="답글"
													onclick="commentInput(${commentData.rank})">
											</div>
										</c:if>
										<div class="commentInCommentArea hiddenArea"
											style="display: none;">
											<input type="hidden" name="commentRef" value="${commentData.ref}">
											<input type="hidden" name="commentStep" value="${commentData.step}">
											<div class="commentInComment">
												<textarea placeholder="답글 입력" name="commentContent"></textarea>
											</div>
											<div class="commentInCommentButtons">
												<input class="commentInCommentButton" type="button"
													value="답글 쓰기" onclick="commentInCommentSend(this.form)">
											</div>
										</div>
									</div>
								</c:when>

								<c:otherwise>
									<div class="commentAndCommentDatas hiddenArea">
										<div class="left"></div>
										<div class="right">
											<div class="commentAndCommentData">
												<div class="commentNickName">
													<span>${commentData.u_idx}</span>
												</div>
												<div class="commentText">
													<span>${commentData.content}</span>
												</div>
												<div class="commentRegdate">
													<span>${commentData.regdate}</span>
												</div>
											</div>
										</div>
									</div>
								</c:otherwise>


							</c:choose>

						</form>
					</c:forEach>
				</c:if>



			</div>
		</div>

	</div>





</body>
</html>