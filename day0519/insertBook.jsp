<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	BookDAO dao = new BookDAO();
	int no = dao.getNextBookId();
%>


	<h2>새로운 도서 등록</h2>
	<hr>
	<form action="insertBookOk.jsp" method="post">
		책 번호: <input type="number" name="bookid" value="<%=no %>"><br><br>
		책 이름: <input type="text" name="bookname"><br><br>
		출판사: <input type="text" name="publisher"><br><br>
		가격: <input type="number" name="price"><br><br>
		<input type="submit" value="책 등록하기">
		&nbsp;&nbsp;
		<input type="reset" value="취소">
	</form>
</body>
</html>