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

<%
		String session_id = session.getId();
		long last_time = session.getLastAccessedTime(); //가장 마지막에 접속했던 시간
		long start_time = session.getCreationTime(); //가장 처음 접속했던 시간
		long keping_time = (last_time - start_time) / 1000; //머물러있던 시간
		
		out.print("1. 세션 아이디: " + session_id + "<br>");
		out.print("2. 세션이 생성된 시간: " + keping_time + "초");
%>
<hr>
<%
	Enumeration enums = session.getAttributeNames();
	while(enums.hasMoreElements()) {
		String name = (String)enums.nextElement();
		out.print(name+"<br>");
		out.print(session.getAttribute(name));
		out.print("<hr>");
	}
%>
</body>
</html>