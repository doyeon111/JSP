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
	request.setCharacterEncoding("utf-8");
	/*int bookid = Integer.parseInt(request.getParameter("bookid"));
	String bookname = request.getParameter("bookname");
	String publisher = request.getParameter("publisher");
	int price = Integer.parseInt(request.getParameter("price"));
	
	BookVO b = new BookVO(bookid, bookname, publisher, price);
	BookDAO dao = new BookDAO();*/
	
	

%>
<jsp:useBean id="b" class="com.sist.vo.BookVO"/>
<jsp:setProperty property="*" name="b"/>
<jsp:useBean id="dao" class="com.sist.dao.BookDAO"/>
<%
	int re = dao.updateBook(b);

	if(re == 1) {
		out.print("도서의 정보를 수정하였습니다.");
	} else {
		out.print("도서정보 수정에 실패하였습니다.");
	}
%>


<a href="listBook.jsp">도서목록</a>
</body>
</html>