<%@page import="com.sist.vo.memberVO"%>
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
	/*
		memberVO m = new memberVO();
		m.setId("tiger");
		m.setPwd("1234");
		m.setName("홍길동");
		out.print("아이디: " + m.getId() + "<br>");
		out.print("비밀번호: " + m.getPwd() + "<br>");
		out.print("이름: " + m.getName() + "<br>");
		*/
	%>
	<jsp:useBean id="m" class="com.sist.vo.memberVO"/>
	<jsp:setProperty property="id" name="m" value="tiger"/>
	<jsp:setProperty property="pwd" name="m" value="1234"/>
	<jsp:setProperty property="name" name="m" value="홍길동"/>
	아이디: <jsp:getProperty property="id" name="m"/><br>
	비밀번호: <jsp:getProperty property="pwd" name="m"/><br>
	이름: <jsp:getProperty property="name" name="m"/><br>

</body>
</html>