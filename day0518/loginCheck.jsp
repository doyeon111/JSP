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
</body>
</html>