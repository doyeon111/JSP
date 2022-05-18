<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
-- 세션값 지우기 전 -- <br>
<%
	Enumeration enums = session.getAttributeNames();
	while(enums.hasMoreElements()) {
		String name = (String)enums.nextElement();
		out.print(name+"<br>");
		out.print(session.getAttribute(name));
		out.print("<hr>");
	}
%>
<br>
<br>

-- 세션값 모두 삭제 후 (세션 파기 후)-- <br>

<%
	session.invalidate(); //세션을 모두 삭제

	if(request.isRequestedSessionIdValid() == true) { //세션아이디가 유효한가?
		out.print("세션이 유효합니다.");
	} else {
		out.print("세션이 유효하지 않습니다.");
	}
	
	
	/*
	enums = session.getAttributeNames();
	//invalidate()으로 세션을 파기하였기 때문에 session 변수를 사용할 수 없다!
	
	while(enums.hasMoreElements()) {
		String name = (String)enums.nextElement();
		out.print(name+"<br>");
		out.print(session.getAttribute(name));
		out.print("<hr>");
	}
	*/
%>

<br><br>

<a href="getSession2.jsp">세션값 확인하기</a>

</body>
</html>