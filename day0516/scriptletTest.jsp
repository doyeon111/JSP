<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>jsp 스크립트의 표현</h2>
<% 
	//스크립트릿이며, 모든 자바문법을 표현할 수 있다.
	String name; //메소드 안의 지역변수
	name = "홍길동";
	
	//public String getName() {
	//	
	//}==> 스크립트릿 안에는 메소드를 만들 수 없다.
	
%>
	이름은 <%=name %>입니다.
<hr>
<%
	Date today = new Date();
	ArrayList list = new ArrayList();
%>
	현재 날짜와 시간: <%=today %>
	
<%!
	//선언문이며, 생성되는 서블릿의 멤버변수나 멤버메소드를 정의할 수 있다.
	int age = 20; //멤버변수로 간다.
	 
	//선언문 안에서 메소드를 만들 수 있다.
	public int getAge() {
		return age;
		
	}
	
%>

나이: <%=age %>
<hr>
나이: <%=getAge() %>

<!-- 이것은 html 주석입니다. -->
<%-- 이것은 jsp 주석입니다. (페이지 소스코드를 볼 때 사용자에게 주석이 노출되지 않는다.) --%>

</body>
</html>
