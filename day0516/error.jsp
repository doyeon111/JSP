<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%--
	request, response ==> 모든 jsp 내장객체
	page isErrorPage="true" 라고 설정된 jsp에서는 예외의 정보를 갖고 있는  Exception 내장객체가 생성된다.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>죄송합니다. 서비스 중에 다음과 같은 문제가 발생하였습니다.</h3>
	<hr>
	<%= exception.getMessage() %>
</body>
</html>