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
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	memberDAO dao = new memberDAO();
	
	memberVO member = dao.isMember(id, pwd);
	if(member != null) { //올바른 회원입니까?
		session.setAttribute("member", member);
		response.sendRedirect("index.jsp");
	} else {
		response.sendRedirect("login.jsp");
	}
	
%>
</body>
</html>