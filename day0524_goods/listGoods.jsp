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
	<h2>상품 목록</h2> 
		<hr>
		<a href="InsertGoods">상품 등록</a><br>
		<table border="1" width="80%">
			<thead>
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="g" items="${list }"> <%-- 상태유지한 list 목록을 반복문 --%>
					<tr>
						<td>${g.no }</td>
						<td><a href="DetailGoods?no=${g.no }">${g.item }</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</body>
</html>