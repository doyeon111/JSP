<%@page import="java.sql.PreparedStatement"%>
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
	
	String sql = "delete members where id = ? and password = ?";
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.35.4:1521:XE";
	String dbUser = "c##scott";
	String dbPwd = "tiger";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, dbUser, dbPwd);
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	
	int re = pstmt.executeUpdate();
	
	if(re == 1) {
		out.print("회원탈퇴 성공");
	} else {
		out.print("회원탈퇴 실패");
	}
	
	pstmt.close();
	conn.close();
%>
</body>
</html>