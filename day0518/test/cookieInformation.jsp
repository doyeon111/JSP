<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>쿠키 정보 확인하기</h2>
<hr>
<%
	Cookie []cooks = request.getCookies();
	

	if(cooks != null) { //기록된 쿠키의 길이가 적어도 하나 이상이 있다면
		out.print("쿠키의 개수: " + cooks.length);	
		out.print("<br>");
		
		for(int i=0; i<cooks.length; i++) {
			out.print("쿠키이름: " + cooks[i].getName() + "<br>"); //쿠키이름 확인
			out.print("쿠키의 값: " + cooks[i].getValue() + "<br>"); //쿠키의 값 확인
			out.print("<hr>");
		}
	}
	
%>
</body>
</html>