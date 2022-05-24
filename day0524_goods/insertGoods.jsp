<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>상품 등록</h2>
	<hr>
	<form action="InsertGoods" method="post" enctype="multipart/form-data">
		상품이름: <br>
		<input type="text" name="item"><br><br>
		
		수량: <br>
		<input type="number" name="qty"><br><br>
		
		가격: <br>
		<input type="number" name="price"><br><br>
		
		상품이미지: <br>
		<input type="file" name="fname"><br><br>
		
		<input type="submit" value="등록">
		&nbsp;&nbsp;
		<input type="reset" value="다시작성">
	</form>
</body>
</html>