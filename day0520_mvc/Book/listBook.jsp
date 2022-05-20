<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- 반복문을 사용하기 위한 라이브러리 사용 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>${title }</h2> <%-- controller에서 상태유지한 title 값을 상태유지 할 수 있다. --%>
	<a href="InsertBook">도서 등록</a>
	<br>
	<table>
		<thead>
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="b" items="${list }"> <%-- 상태유지한 list 목록을 반복문 --%>
				<tr>
					<td>${b.bookid }</td> <%-- ${b.bookid} = <%=b.getBookid() %> 와 같은 말! --%>
					<td><a href="DetailBook?bookid=${b.bookid }">${b.bookname }</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>

<%-- ${list } => 표현언어라고 부름 --%>