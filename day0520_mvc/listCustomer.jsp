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
	<h2>${title }</h2> <%-- controller에서 상태유지한 title 값을 상태유지 할 수 있다. --%>
	<a href="InsertCustomer">고객 등록</a>
	<br>
	<table>
		<thead>
			<tr>
				<th>고객번호</th>
				<th>고객이름</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="c" items="${list }"> <%-- 상태유지한 list 목록을 반복문 --%>
				<tr>
					<td>${c.custid }</td> 
					<td><a href="DetailCustomer?custid=${c.custid }">${c.name }</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>