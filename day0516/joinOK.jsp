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
	


	//사용자가 요청한 데이터는 한글임을 설정합니다.
	request.setCharacterEncoding("utf-8");

	

	//사용자가 요청한 이름, 나이를 받아온다.
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
	
%>

이름: <%=name %><br>
나이: <%=age %>




<hr>

</body>
</html>