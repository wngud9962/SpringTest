<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

div{
	margin: 0 auto;
		align-content: center;
}
	
	.wrapper{
		margin: 0 auto;
		
	}

	input{
		width: 100%;
	    height: 48px;
	    padding: 0 auto;
	    box-sizing: border-box;
	    margin-bottom: 10px;
	    margin-left: 3px;
	    border-radius: 6px;
	    background-color: #E7DAFF;
	    color: #535159;
	    font-size: 13px;
		font-weight: bold;
		color: #171717; /* 버튼 글자색 */
  	  	font-size: 16px;
   	 	background-color: #A582CF; /* 버튼 배경색 */
   	 	margin-top: 20px;
   	 	
	}
	
.checkbtn{
	cursor:pointer;
}
</style>
</head>
<body>
	<div>
		<div class="wrapper">
			<h2 align="center">완료되었습니다.</h2>
			<input type="button" class="checkbtn" value="닫기" onclick="window.close()">
		</div>
	</div>
</body>
</html>