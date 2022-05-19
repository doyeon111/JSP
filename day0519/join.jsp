<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	<hr>
	<form action="joinOK.jsp" method="post">
		아이디: <br>
		<input type="text" name="id"><br><br>
		
		비밀번호: <br>
		<input type="password" name="pwd"><br><br>
	
		이름: <br>
		<input type="text" name="name"><br><br>
		<input type="submit" value="가입">
		&nbsp;&nbsp;&nbsp;
		<input type="reset" value="취소">
	</form>
</body>
</html>