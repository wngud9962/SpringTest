<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 올리기</title>
	<script>
		function send(f){
			f.submit();
		}
	</script>
</head>
<body>
	<form method="post" action="product_insert" enctype="multipart/form-data" >
		<table>
			<tr>
				<th>상품명</th>
				<td><input name="p_name"></td>
			</tr>
			<tr>
				<th>입고 수량</th>
				<td><input name="p_stockcount"></td>
			</tr>
			<tr>
				<th>할인율</th>
				<td><input name="p_discount"></td>
			</tr>
			<tr>	
				<td><input type="file" name="files" multiple required></td>
			</tr>
			<tr>	
				<td><input type="button" value="완료" onclick="send(this.form)"></td>
			</tr>
		</table>
	</form>
</body>
</html>