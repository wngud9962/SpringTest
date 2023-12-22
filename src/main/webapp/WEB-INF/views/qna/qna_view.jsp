<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/qna/qna_view.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript">

	function refresh(){
		location.reload();
	}	
	
	//삭제시
	function qna_del(){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		
		let pwd = "${id.u_pwd}"; //관리자 비번?
		let c_pwd = document.getElementById("c_pwd").value; //입력한 비밀번호
		
		if(pwd != c_pwd){
			alert("비밀번호 불일치");
			return;
		}
		
		let url = "qna_del.do"; 
		let param = "q_idx=${qnaVO.q_idx}";
		
		sendRequest(url,param,delCheck,"POST");
	}
	
	function delCheck(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data =xhr.responseText; //xhr = new XMLHttpRequest(); 를 담는 변수
			
			let json = eval(data);
			
			if(json[0].result == 'yes'){
				alert("삭제 성공");
				location.href="qna_main.do";  
			} else {
				alert("삭제 실패");
			}
		}
	}
	
	//수정시
	function qna_edit_form(){
		if(!confirm("수정하시겠습니까?")){
			return;
		}
		
		let pwd = "${id.u_pwd}"; //관리자 비번?
		let c_pwd = document.getElementById("c_pwd").value; //입력한 비밀번호
		
		if(pwd != c_pwd){
			alert("비밀번호를 입력하세요");
			return;
		}
		
		let q_idx = ${qnaVO.q_idx};
		location.href="qna_edit_form.do?q_idx="+q_idx;
		//이거 idx값 삭제하라는 말인가?
		
		sendRequest(url,param,delCheck,"POST");
	}
	
	

</script>
</head>
<body>
	
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
	
		<hr />
		<div class="listBox">
			<div class="table">
				<span class="th">제목</span>
				<span class="align">${qnaVO.q_title}</span>
			</div>
			
			<div class="table">
				<span class="th">번호</span>
				<span class="align">${qnaVO.q_idx }</span>
			</div>
			
			<div class="table">
				<span class="th">일자</span>
				<span class="align">${qnaVO.q_regdate }</span>
			</div>
			
			<div class="table">
				<span class="th">내용</span>
				<span class="align" width="500px" height="200px">
					<div class="nopadding">
					<img src="${pageContext.request.contextPath}/resources/upload/qna/${qnaVO.q_filename}"
					width="300px" height="300px">
					
					</div>
					${qnaVO.q_content }
				</span>
				
			</div>
			
			<div class="table">
				<span class="th">비밀번호</span>
				<spqn class="align">	
					<input type="text" id="c_pwd" placeholder="비밀번호를 입력하세요">
				</spqn>
			</div>
			
			<div class="btnBox">
				<input type="button" value="수정" class="Btn" onclick="qna_edit_form()">
				<input type="button" value="삭제" class="Btn" onclick="qna_del()">
			</div>
		</div>
	</div>
</body>
</html>