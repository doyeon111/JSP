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
	session.invalidate(); //로그아웃 하기 위해서 세션을 완전히 삭제
	
%>

-- 로그아웃 하였습니다. --

<hr>
<a href="index.jsp">메인으로 가기</a>
</body>
</html>