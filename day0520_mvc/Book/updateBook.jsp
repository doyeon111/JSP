<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>도서 수정</h2>
	<hr>
	<form action="UpdateBook" method="post">
		<input type="hidden" name="bookid" value="${re.bookid }"><br>
		도서명: <input type="text" name="bookname" value="${re.bookname }"><br>
		출판사: <input type="text" name="publisher" value="${re.publisher }"><br>
		가격: <input type="number" name="price" value="${re.price }"><br>
		<input type="submit" value="도서수정">
		&nbsp;&nbsp;
		<input type="reset" value="취소">
	</form>
</body>
</html>