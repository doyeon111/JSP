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
	String name = "홍길동";
%>
이름: <%=name %><br>
<jsp:include page="age02.jsp"/> <%-- main02와 age02의 서블릿이 별도로 생성된다.! 즉 두개 생성됨. --%>
</body>
</html>