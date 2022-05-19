<%@page import="com.sist.dao.MemberDAO"%>
<%@page import="com.sist.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="m" class="com.sist.vo.MemberVO"/>
<jsp:useBean id="dao" class="com.sist.dao.MemberDAO"/>
<jsp:setProperty property="*" name="m"/> <%-- 사용자가 요청한 모든 파라미터를 받아서 vo m에다가 담아주세요. --%>

<%
	request.setCharacterEncoding("utf-8");
	/*String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name"); 
	
	
	
	MemberVO m = new MemberVO(id, pwd, name);
	MemberDAO dao = new MemberDAO(); */
	int re = dao.insertMember(m); //dao에게 insert해주세요. 라는 명령
	
	if(re == 1) {
		out.print("회원가입에 성공!");
	} else {
		out.print("회원가입에 실패!");
	}
	
	
%>
</body>
</html>