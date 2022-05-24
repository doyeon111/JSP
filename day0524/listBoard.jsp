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
	<h2>게시물 목록</h2> 
	<hr>
	<a href="InsertBoard">새 글 작성</a><br>
	<table border="1" width="80%">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="b" items="${list }"> <%-- 상태유지한 list 목록을 반복문 --%>
				<tr>
					<td>${b.no }</td>
					<td><a href="DetailBoard?no=${b.no }">${b.title }</a></td>
					<td>${b.writer }</td>
					<td>${b.hit }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
</body>
</html>