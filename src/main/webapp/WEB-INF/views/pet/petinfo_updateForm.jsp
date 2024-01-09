<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.rrr{font-family: 'Gamja Flower', sans-serif;
	font-size:20px;
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pet/petupdate.css">
	<script type="text/javascript">
	function isImageFile(input) {
	    // 허용된 이미지 파일의 MIME 타입 배열
	    var allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];

	    // 파일 입력 요소에서 선택한 파일이 있는지 확인
	    if (input.files.length > 0) {
	        // 선택한 파일의 MIME 타입 확인
	        var fileType = input.files[0].type;

	        // 허용된 이미지 파일인지 여부 반환
	        return allowedTypes.includes(fileType);
	    }

	    // 파일이 선택되지 않았을 경우도 false 반환
	    return false;
	}
		function update(f){
			
			var p_name = f.p_name.value.trim();
			var p_type = f.p_type.value;
			var p_age = f.p_age.value.trim();
			var p_gender = f.p_gender.value;
			var photoInput = f.photo;
			
			// 유효성 검사
			if(p_name == ''){
				alert('이름을 입력하세요');
				return;
			}
			
			if(p_name.length > 15){
				alert('이름은 15글자 미만으로 입력해주세요');
				return;
			}
			
			if(p_type == ''){
				alert('반려동물 종을 선택해주세요');
				return;
			}
			
			if(p_age == ''){
				alert('나이를 입력해주세요');
				return;
			}
			
			var intAge = parseInt(p_age);
			
			if(isNaN(intAge)){
				alert('나이는 숫자로만 입력이 가능합니다.');
				return;
			}
			
			if(intAge >= 30){
				alert('1 ~ 30 사이의 숫자를 입력해주세요');
				return;
			}
			
			if(p_gender == ''){
				alert('성별을 선택해주세요');
				return;
			}
			
			if (photoInput.files.length > 0) {
	            if (!isImageFile(photoInput)) {
	                alert('이미지 파일만 첨부 가능합니다.');
	                return;
	            }
	        }
			
			f.action = "petinfo_update.do";
			f.submit();
			
		}
		
		function isIamgeFile(input){
			var allowedType = ['image/jpeg', 'image/png', 'image/gif'];
			return input.files.length > 0 && allowedTypes.includes(input.files[0].type);
		}
		
		function openImage(imageSrc){
			window.open(imageSrc, '_blank', 'width=1000, height=800' );
		}
	</script>
</head>
<body class="body"  
	style="	background-repeat: no-repeat;
			background-size:100%;
			background-color:#E7D7B2;">
					
	<div class="wrapper">
	<jsp:include page="/WEB-INF/views/template/headerTemplate.jsp"/>
	</div>
				
     <form method="POST" enctype="multipart/form-data">
     	<input type="hidden" name="p_idx" value="${vo.p_idx}">
     	<table border="1" align="center" class="rrr">
     		<caption> <h2>반려동물 정보 수정하기</h2></caption>
     		<tr>
     			<th>반려동물 사진</th>
     			<td><img src="${pageContext.request.contextPath}/resources/petImg/${vo.p_photo}"
	             	     width="100" height="100" onclick="openImage('${pageContext.request.contextPath}/resources/petImg/${vo.p_photo}')"
	             	     style="cursor: pointer;">
	             </td>
     		</tr>
     		<tr>
     			<th>반려동물 이름</th>
     			<td>
     				<input name="p_name" value="${vo.p_name}">
     			</td>
     		</tr>
     		<tr>
     			<th>반려동물 종</th>
     			<td>
     				<select name="p_type">
     					<option></option>
     					<option>강아지</option>
     					<option>고양이</option>
     				</select>
     			</td>
     		</tr>
     		<tr>
     			<th>반려동물 나이</th>
     			<td>
     				<input name="p_age" value="${vo.p_age}">
     			</td>
     		</tr>
     		<tr>
     			<th>반려동물 성별</th>
     			<td>
     				<input type="radio" name="p_gender" value="남">남
     				<input type="radio" name="p_gender" value="여">여
     			</td>
     		</tr>
     		<tr>
     			<th>이미지 첨부</th>
     			<td><input type="file" name="photo"></td>
     		</tr>
     		<tr>
     			<td colspan="2" align="center">
     			<input type="button" value="수정하기"  class="btn" onclick="update(this.form)">
     			<input type="button" value="수정취소"  class="btn" onclick="location.href='petinfo_main.do'">
     		</tr>
     	</table>
     </form>
	<jsp:include page="/WEB-INF/views/template/footerTemplate.jsp"/>
</body>
</html>