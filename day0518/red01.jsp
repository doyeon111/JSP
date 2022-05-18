<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="red">
	<h2>red 입니다.</h2>
	<hr>
	<jsp:forward page="yellow01.jsp">
		<jsp:param value="Hello JSP" name="title"/> <%-- 값을 전달해주고 싶을 때 param! --%>
	</jsp:forward>
</body>
</html>