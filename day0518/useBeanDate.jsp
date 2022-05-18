<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>useBean 액션 태그로 오늘 날짜와 시간 출력</h2>
	<hr>
	<jsp:useBean id="nowTime" class="java.util.Date"/>
	<%=nowTime.toLocaleString() %>
</body>
</html>