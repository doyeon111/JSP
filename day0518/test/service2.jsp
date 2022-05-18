<%@page import="com.sist.vo.memberVO"%>
<%@page import="com.sist.dao.memberDAO"%>
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
	memberVO member = null;
	String name = "";

	//로그인을 안했으면 로그인 페이지로 이동시킵니다.
	if(session.getAttribute("member") == null) {
		response.sendRedirect("login.jsp");
	}else {
		member = (memberVO)session.getAttribute("member");
		name = member.getName();
		
	}
%>

<%=name %>님 로그인 하였습니다.
	<a href="logout.jsp">로그아웃</a>
	<h2>서비스 2입니다.</h2>
</body>
</html>