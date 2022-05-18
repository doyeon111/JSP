<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="red">
	<h2>red입니다.</h2>
	<hr>
	<%
		//response.sendRedirect("yellow.jsp");
	%>
	
	<jsp:forward page="yellow.jsp"/>
</body>
</html>