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
		//http://localhost:8080/day0516_a/imageTest03.jsp?fname=ball2.jpg&width=100&height=100 ==> 이페이지를 실행하기 위해서는 다음과 같은 입력값을 넣어줘야 한다.
		String fname = request.getParameter("fname");
		String width = request.getParameter("width");
		String height = request.getParameter("height");
	%>
	
	
	<img src="goods/<%=fname %>" width="<%=width %>" height="<%=height %>"> 
</body>
</html>