<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>${title }</h2>
	<hr>
	도서번호: ${b.bookid }<br>
	도서명: ${b.bookname }<br>
	출판사: ${b.publisher }<br>
	가격: ${b.price }<br>
	<hr>
	<a href="DeleteBook?bookid=${b.bookid }">삭제</a>
	<a href="UpdateBook?bookid=${b.bookid }">수정</a>
</body>
</html>