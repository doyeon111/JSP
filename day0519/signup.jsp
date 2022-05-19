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
	<form action="signup_process.jsp" method="post">
		<fieldset style="width: 200px;">
			<legend>회원가입</legend>
			아이디: <br>
			<input type="text" name="id"><br><br>
			
			비밀번호: <br>
			<input type="password" name="password"><br><br>
			
			이메일: <br>
			<input type="email" name="email"><br><br>
			
			<div align="center">
				<input type="submit" value="가입하기">
				&nbsp;&nbsp;
				<input type="reset" value="다시작성">
			</div>
			
		</fieldset>
	</form>
</body>
</html>