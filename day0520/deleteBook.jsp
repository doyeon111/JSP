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

	int re = dao.deleteBook(bookid);

	if(re == 1) {
		out.print("도서를 삭제하였습니다.");
	} else {
		out.print("도서 삭제를 실패하였습니다.");
	}
%>

<a href="listBook.jsp">도서목록</a>

</body>
</html>