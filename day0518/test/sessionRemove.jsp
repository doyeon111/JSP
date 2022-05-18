<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
-- 세션값 지우기 전 -- <br>
<%
	Enumeration enums = session.getAttributeNames();
	while(enums.hasMoreElements()) {
		String name = (String)enums.nextElement();
		out.print(name+"<br>");
		out.print(session.getAttribute(name));
		out.print("<hr>");
	}
%>
<br>
<br>

-- 세션값 year, list 삭제 후 -- <br>

<%
	session.removeAttribute("year");
	session.removeAttribute("list");

	enums = session.getAttributeNames();
	while(enums.hasMoreElements()) {
		String name = (String)enums.nextElement();
		out.print(name+"<br>");
		out.print(session.getAttribute(name));
		out.print("<hr>");
	}
%>
<br><br>

<a href="getSession2.jsp">세션값 확인하기</a>
</body>
</html>