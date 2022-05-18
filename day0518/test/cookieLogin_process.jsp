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
		Cookie cooks_id = new Cookie("userID", id);
		Cookie cooks_pw = new Cookie("userPW", pwd);
		
		response.addCookie(cooks_id);
		response.addCookie(cooks_pw);
		
		out.print("쿠키를 생성하였습니다.<br>");
		out.print(id + "님이 입장하였습니다.");
	
	} else {
		response.sendRedirect("cookieLogin_failure.jsp");
	}
	
%>
</body>
</html>