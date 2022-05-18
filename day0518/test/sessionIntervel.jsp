<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

-- 세션 유효시간 변경 전 --<br>
<%
	int s_time = session.getMaxInactiveInterval() / 60; //현재 설정되어있는 세션의 유지시간을 60으로 나눈 시간
	out.print("세션의 유효시간:["+s_time+"]분 <br><br>");
%>

-- 세션 유효시간 변경 후 --<br>
<%
	session.setMaxInactiveInterval(60*5);
	s_time = session.getMaxInactiveInterval() / 60; //현재 설정되어있는 세션의 유지시간을 60으로 나눈 시간
	out.print("세션의 유효시간:["+s_time+"]분 <br><br>");
%>
</body>
</html>