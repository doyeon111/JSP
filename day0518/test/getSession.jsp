<%@page import="com.sist.vo.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션값 확인하기</h2>
	<hr>
<%
	String title = (String)session.getAttribute("title");
	int year = (Integer)session.getAttribute("year");
	Person kim = (Person)session.getAttribute("kim");
	ArrayList<Person> list = (ArrayList<Person>)session.getAttribute("list");
%>
title: <%=title %><br>
year: <%=year %><br>
kim: <%=kim %><br>
<br>
<h2>회원목록</h2>
<%
	for(int i=0; i<list.size(); i++) {
		out.print(list.get(i) + "<br>");
	}
%>
<hr>
</body>
</html>