<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/pet/petinsert.css?after">
<script src="resources/js/httpRequest.js"></script>
	<script type="text/javascript">
		function insert_send(f){
			var p_name = f.p_name.value.trim();
			var p_type = f.p_type.value;
			var p_age = f.p_age.value.trim();
			var p_gender = f.p_gender.value;
			/* var p_photo = f.p_photo.value; */
			var u_idx = f.u_idx.value;
			var photoInput = f.photo; // 파일 입력 요소에 대한 참조
			
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
			
			if(photoInput.files.length > 0){
				if(!isImageFile(photoInput)){
					alert('이미지 파일만 첨부 가능합니다.');
					return;
				}
			}
			
			f.action = "pet_insert.do";
			f.submit();
		}
		
		function cancel_send(f){
			var insertConfirm = confirm("등록을 취소하시겠습니까?");
			if(insertConfirm){
				window.location.href = "petinfo_main.do";
			}
		}
		
		// 이미지 파일인지 확인하는 함수
		function isImageFile(input){
			var allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
			return input.files.length > 0 && allowedTypes.includes(input.files[0].type);
		}
	</script>
</head>
<body style="	background-repeat: no-repeat;
			background-size:100%;
			background-color:#E7D7B2;">
					
	<div class="wrapper">
	
	<jsp:include page="/WEB-INF/views/template/headerTemplate.jsp"/>
	</div>
	
				
	
	
					
	<form method="POST" enctype="multipart/form-data">
		<table border="1" align="center" class="rrr">
			<caption><h2>마이 펫 등록하기</h2></caption>
			<tr>
				<th>이름</th>
				<td>
					<input name="p_name">
				</td>
			</tr>
			<tr>
			 	<th>종</th>
			 	<td>
			 		<select name="p_type">
			 			<option></option>
			 			<option>강아지</option>
			 			<option>고양이</option>
			 		</select>
			 	</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input name="p_age">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="p_gender" value="남"> 남
					<input type="radio" name="p_gender" value="여"> 여
				</td>
			</tr>
			<tr>
				<th>이미지 첨부</th>
				<td><input type="file" name="photo"  ></td>
			</tr>	
			<tr>
			   <td colspan="2" align="center">
             	<input name="u_idx" type="hidden" value="${id.u_idx}">
			      <input type="button" class="btn" value="등록하기" onclick="insert_send(this.form)">
			      <input type="button" class="btn" value="등록취소" onclick="cancel_send(this.form)">
			   </td>
			</tr>
		</table>
	</form>

	<jsp:include page="/WEB-INF/views/template/footerTemplate.jsp"/>

</body>
</html>