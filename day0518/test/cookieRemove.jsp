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
	//클라이언트에 등록된 모든 쿠키들을 읽어온다.
	Cookie []cooks = request.getCookies();

	for(int i=0; i<cooks.length; i++) {
		//쿠키의 유효기간을 설정
		cooks[i].setMaxAge(0);
		response.addCookie(cooks[i]);
		
	}
%>

-- 쿠키를 모두 삭제하였습니다. --
</body>
</html>