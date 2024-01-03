<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.footer{
position:fixed;
bottom:0;
width:1870px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review/reviewinsert.css">
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">

		function send(f){
			var r_content = f.r_content.value.trim();
			var u_idx = f.u_idx.value;
			var photoInput = f.photo;
			
			if(r_content == ''){
				alert('리뷰를 작성해주세요 ㅠ');
				return;
			}
			
			if(photoInput.files.length > 0){
				if(!isImageFile(photoInput)){
					alert('이미지 파일만 첨부 가능합니다.');
					return;
				}
			}
			
			f.action = "review_insert.do";
			f.submit();
		}
		
		// 이미지 파일인지 확인하는 함수
		function isImageFile(input){
			var allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
			return input.files.length > 0 && allowedTypes.includes(input.files[0].type);
		}
</script>
</head>
<body class="body"  
	style="	background-repeat: no-repeat;
			background-size:100%;
			background-color:#E7D7B2;">
					
	<div class="wrapper">
		<div class="intro-bg">
		<div class="header">
			<div class="logo">
				<a href="main_home.do" id="logoa"><img src="resources/img/titleLogo.jpg" width="130px" height="130px"></a>
		    </div>
			<div class="title">
		        	<ul class="nav">
			            <li><a href="info_main.do">병원소개</a></li>
			            <li><a href="review_main.do">리뷰</a></li>
			            <li><a href="qna_main.do">QNA</a></li>
			            <li><a href="rev_main.do">예약</a></li>
			          	<c:choose>
							<c:when test="${empty id}">
								<li><a href="login_main.do">펫 등록</a></li>
								<li><a href="login_main.do">정보수정</a></li>
								<li><a href="login_main.do">로그인</a></li>
							</c:when>
							<c:when test="${not empty id}">
								<li><a href="petinfo_main.do">펫 등록</a></li>
								<li><a href="check_up.do">정보수정</a></li>
								<li><a href="logout.do">로그아웃</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
			</div>
		</div> <!-- 헤더 -->



	<div class="content">
		<form method="POST" enctype="multipart/form-data">
			<input type="hidden" name="u_idx" value="${id.u_idx}">
			
			<div class="list">
				<table class="rrr">
					<caption><h2>리뷰 작성하기</h2></caption>
					<tr>
						<td colspan="2"><div class="line"></div></td>
					</tr>
					
					<tr>
						<th colspan="2">이용 후기를 남겨주세요</th>
					</tr>
					
					<tr>
						<td colspan="2"><div class="line"></div></td>
					</tr>
					
					<tr>
						<th>리뷰 작성</th>
						<td id="c">
							<textarea  name="r_content" class="text" id="reviewContents"></textarea>
						</td>
					</tr>
					
					<tr>
						<td colspan="2"><div class="line"></div></td>
					</tr>
					
					<tr>
						<th>이미지 첨부</th>
						<td align="left" class="btn3">
							<label for="file">파일찾기</label>
							<input type="file" name="photo" id="file" >
						</td>
					</tr>
					
					<tr>
						<td colspan="2"><div class="line"></div></td>
					</tr>
					
					<tr>
						<td colspan="2" align="right">
						<input type="button" class="btn2" value="취소하기" onclick="location.href='review_main.do'">
						<input type="button" class="btn2" value="작성하기" onclick="send(this.form)"></td>
					</tr>
					
					<tr>
						<td colspan="2"><div class="line"></div></td>
					</tr>
				</table>
			</div>
		</form>
	</div>

	<div class="line"></div>
	
	<div class="footer">
        <div>멍이 냥이 동물병원</div>
        <div id="info">
          CEO. 김가나다 <br>
          Addr. 인천광역시 부평구 시장로 7 MH타워 5층 <br>
          Fax/Tel. 032-262-5890 <br>
          ⓒ2023.hospital name All rights reserved.
        </div>
        <div class="sns">
			<a href="https://www.instagram.com">
				<img src="resources/img/insta.jpg" width="100px" height="100px">
			</a>
		</div>
      </div>
	
	</div>
</body>
</html>