<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>도서 등록</h2>
	<hr>
	<form action="InsertBook" method="post">
		도서번호: <input type="number" name="bookid" value="${bookid }"><br>
		도서명: <input type="text" name="bookname"><br>
		출판사: <input type="text" name="publisher"><br>
		가격: <input type="number" name="price"><br>
		<input type="submit" value="도서등록">
		&nbsp;&nbsp;
		<input type="reset" value="취소">
	</form>
</body>
</html>