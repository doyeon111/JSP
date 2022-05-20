<%@page import="com.sist.dao.BookDAO"%>
<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>도서목록</h2>
	<hr>
<%
	BookDAO dao = new BookDAO();
	ArrayList<BookVO> list = dao.listBook();

%>
	<table>
		<thead>
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
			</tr>
		</thead>
		
		<tbody>
			<%
				for(BookVO b : list) {
					%>
					<tr>
						<td><%=b.getBookid() %></td>
						<td><a href="detailBook.jsp?bookid=<%=b.getBookid()%>"><%=b.getBookname() %></a></td>
					<%
				}
			%>
		</tbody>
	</table>


</body>
</html>