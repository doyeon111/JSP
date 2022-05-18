<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="yellow">
	<h2>yellow 입니다.</h2>
	<%
		String title = request.getParameter("title");
	%>
	title: <%=title %>
</body>
</html>