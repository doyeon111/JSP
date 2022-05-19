<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 탈퇴</h2>
	<form action="withdraw_process.jsp" method="post">
		<fieldset style="width: 200px;">
			<legend>회원탈퇴</legend>
			
			아이디: 
			<input type="text" name="id"><br>
			
			비밀번호:
			<input type="password" name="password">
			<div align="center">
				<input type="submit" value="탈퇴하기">			
				&nbsp;&nbsp;
				<input type="reset" value="취소">
			</div>
		</fieldset>
	</form>
</body>
</html>