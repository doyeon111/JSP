<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	
	String sql = "insert into members(id, password, email, signuptime) values('"+id+"','"+password+"','"+email+"',sysdate)";
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.35.4:1521:XE";
	String dbUser = "c##scott";
	String dbPwd = "tiger";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, dbUser, dbPwd);
	Statement stmt = conn.createStatement();
	int re = stmt.executeUpdate(sql);
	if(re == 1) {
		out.print("회원가입 성공");
	} else {
		out.print("회원가입 실패");
	}
	stmt.close();
	conn.close();
	
%>
</body>
</html>