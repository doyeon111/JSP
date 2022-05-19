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
	<h2>도서 상세보기</h2>
	<hr>
	도서번호: <%=b.getBookid() %><br>
	도서명: <%=b.getBookname() %><br>
	출판사: <%=b.getPublisher() %><br>
	가격: <%=b.getPrice() %>
</body>
</html>