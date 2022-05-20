<%@page import="com.sist.vo.BookVO"%>
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
	int bookid = Integer.parseInt(request.getParameter("bookid"));
	BookDAO dao = new BookDAO();
	BookVO b = dao.getBook(bookid);
%>
	<h2>도서 수정</h2>
	<hr>
	<form action="updateBook_process.jsp" method="post">
		<input type="hidden" name="bookid" value="<%=b.getBookid() %>"><br><br>
		도서이름: <input type="text" name="bookname" value="<%=b.getBookname() %>"><br><br>
		출판사: <input type="text" name="publisher" value="<%=b.getPublisher() %>"><br><br>
		가격: <input type="number" name="price" value="<%=b.getPrice() %>"><br><br>
		<input type="submit" value="수정">
		&nbsp;&nbsp;
		<input type="reset" value="취소">
	</form>
</body>
</html>