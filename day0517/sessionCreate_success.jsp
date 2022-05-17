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
	String u_id = request.getParameter("id");
	String u_pw = request.getParameter("passwd");
	
	//아이디가 tiger이고 암호가 1234이면 올바른 회원으로 보고 로그인을 성공했다 라는 표시로 세션에 상태유지를 할 것.
	
	if(u_id.equals("tiger") && u_pw.equals("1234")) {
		session.setAttribute("memberID", u_id); //아이디가 맞다면 상태유지
		session.setAttribute("memberPW", u_pw); //비밀번호가 맞다면 상태유지
		
		out.println("새로운 세션 생성 성공!");
		out.print("["+u_id + "]님이 입장하였습니다.");
	} else {
		out.println("세션 생성 실패!");
		out.print("다시 시도해보세요.");
		
	}
%>
</body>
</html>