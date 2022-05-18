<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
세선아이디: <%=session.getId() %><hr>
<%
	session.setAttribute("title", "JSP programming");
	session.setAttribute("year", 2022);
	
	Person kim = new Person("홍길동", 20);
	session.setAttribute("kim", kim);
	
	ArrayList<Person> list = new ArrayList<Person>();
	list.add(new Person("김소윤", 20));
	list.add(new Person("고주희", 21));
	list.add(new Person("황예은", 22));
	session.setAttribute("list", list);
	
	
%>

세션에 값을 설정하였습니다.<hr>
<a href="getSession.jsp">세션값 확인하러 가기</a><br>
<a href="getSession2.jsp">세션값 확인하러 가기2</a><br>
<a href="sessionRemove.jsp">세션값 지우기</a><br>
<a href="sessionRemove_all.jsp">세션값 모두 지우기(세션 파기하기)</a>

</body>
</html>