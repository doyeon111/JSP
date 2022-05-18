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
	String name = "김유신";
%>

이름: <%=name %><br>
<%@ include file="age01.jsp" %> <%-- (main)의 서블릿이 한개만 만들어진다. age01의 서블릿은 만들어지지 않음.--%>
</body>
</html>