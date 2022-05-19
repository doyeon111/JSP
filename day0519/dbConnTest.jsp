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
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.35.4:1521:XE";
	String username = "c##sist";
	String password = "sist";
	Connection conn = null;
	try {
		Class.forName(driverName);
		conn = DriverManager.getConnection(url, username, password);
		out.print(">>연결성공: " + conn);
	} catch(Exception e) {
		out.print("예외발생: " + e.getMessage());
	} finally { //예외가 나거나 나지않거나 반드시 동작하는 것
		
		if(conn != null) {
			conn.close();
		}
		
	}
	
%>
</body>
</html>