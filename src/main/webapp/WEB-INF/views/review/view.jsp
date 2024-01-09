
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review/reviewinsert.css">
<script type="text/javascript">
	function del(f) {
		var u_idx = f.u_idx.value;
		var r_idx = f.r_idx.value;

		if (!confirm("리뷰를 삭제하시겠습니까?")) {
			return;
		} else {

			f.action = "delReview.do";
			f.submit();
		}
	}

	function re(f) {
		var r_content = f.r_content.value.trim();
		var r_content2 = f.r_content.value;
		var u_idx = f.u_idx.value;
		var r_idx = f.r_idx.value;
		var photoInput = f.photo;

		if (r_content == '' && r_content != r_content2) {
			alert('리뷰를 작성해주세요 ㅠ');
			return;
		}

		if (photoInput.files.length > 0) {
			if (!isImageFile(photoInput)) {
				alert('이미지 파일만 첨부 가능합니다.');
				return;
			}
		}

		if (!confirm('수정하시겠습니까?')) {
			return;
		}

		f.action = "upReview.do";
		f.submit();
	}

	// 이미지 파일인지 확인하는 함수
	function isImageFile(input) {
		var allowedTypes = [ 'image/jpeg', 'image/png', 'image/gif' ];
		return input.files.length > 0
				&& allowedTypes.includes(input.files[0].type);
	}

	function openImage(imageSrc) {
		window.open(imageSrc, '_blank', 'width=1000, height=800');
	}
</script>
</head>
<body class="body"
	style="background-repeat: no-repeat; background-size: 100%; background-color: #E7D7B2;">

	<div class="wrapper">

		<jsp:include page="/WEB-INF/views/template/headerTemplate.jsp" />


		<div class="content">
			<form method="POST" enctype="multipart/form-data">
				<input type="hidden" value="${vo.u_idx}" name="u_idx"> <input
					type="hidden" value="${vo.r_idx}" name="r_idx">

				<div class="list">
					<table class="rrr">
						<caption>
							<h2>리뷰 수정하기</h2>
						</caption>
						<tr>
							<td colspan="2"><div class="line"></div></td>
						</tr>
						<tr>
							<td colspan="2" id="n">작성자 : ${vo.u_nickName}</td>
						</tr>
						<tr>
							<c:choose>
								<c:when test="${vo.r_photo != 'no_file' and vo.r_photo!=null}">

									<td><img
										src="${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}"
										width="150" height="150"
										onclick="openImage('${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}')"
										style="cursor: pointer;"></td>
								</c:when>
								<c:when test="${vo.r_photo == 'no_file' or vo.r_photo==null}">
									<td><img
										src="${pageContext.request.contextPath}/resources/reviewImg/defaultImg.jpg"
										width="150" height="150"></td>
								</c:when>
							</c:choose>
							<td id="c"><textarea name="r_content"
									class="col-auto form-control" id="reviewContents"
									placeholder="${vo.r_content }"></textarea></td>
						</tr>

						<tr>
							<td colspan="2"><div class="line"></div></td>
						</tr>

						<tr>
							<th>이미지 수정</th>
							<td align="left" class="btn3"><label for="file">파일찾기</label>
								<input type="file" name="photo" id="file"></td>
						</tr>

						<tr>
							<td colspan="2"><div class="line"></div></td>
						</tr>

						<tr>
							<td colspan="2" align="right"><input type="button"
								class="btn2" value="수정하기" onclick="re(this.form)"> <input
								type="button" class="btn2" value="삭제하기" onclick="del(this.form)">
								<input type="button" class="btn2" value="목록으로"
								onclick="location.href='review_main.do'"></td>
						</tr>
						<tr>
							<td colspan="2"><div class="line"></div></td>
						</tr>
					</table>
				</div>
			</form>
		</div>

		<div class="line"></div>


		<jsp:include page="/WEB-INF/views/template/footerTemplate.jsp" />

	</div>
</body>
</html>