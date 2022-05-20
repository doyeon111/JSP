<%@page import="com.sist.dao.BookDAO"%>
<%@page import="com.sist.vo.BookVO"%>
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
	request.setCharacterEncoding("utf-8");
	int bookid = Integer.parseInt(request.getParameter("bookid"));
	String bookname = request.getParameter("bookname");
	String publisher = request.getParameter("publisher");
	int price = Integer.parseInt(request.getParameter("price"));
	
	BookVO b = new BookVO(bookid, bookname, publisher, price);
	BookDAO dao = new BookDAO();
	
	int re = dao.insertBook(b);
	
	if(re == 1) {
		out.print("책 등록 성공!");
	} else {
		out.print("책 등록 실패!");
	}
	
	
%>
</body>
</html>