<%@page import="java.sql.ResultSet"%>
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
	String drivername = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.35.4:1521:XE";
	String username = "c##scott";
	String password = "tiger";
	
	Connection conn  = null;
	
	Class.forName(drivername);
	conn = DriverManager.getConnection(url, username, password);
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select id, email, signuptime from members");
	
	String str = "";
	int count = 1;
	
	while(rs.next()) {
		
		str += count + ":" + rs.getString(1) + "/" + rs.getString(2) + "/" + rs.getString(3) + "<br>";
		
		//내가 실행한 sql명령어를 기준으로 인덱스의 순서를 따집니다.
		
		//str += count + ":" + rs.getString("id") + "/" + rs.getString("email") + "/" + rs.getString("signuptime") + "<br>";
		count++;
	}
	
	out.print("<h2>회원가입 명단</h2>");
	out.print(str);
	
	rs.close();
	stmt.close();
	conn.close();
	
%>
</body>
</html>