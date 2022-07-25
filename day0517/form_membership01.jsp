<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입</h2>
	<hr>
	<form action="Insert.do" method="post">
		<fieldset style="width: 330px;">
			<legend>개인정보 입력</legend>
			아이디: <br>
			<input type="text" name="p_id" size="16"><br><br>
			
			비밀번호: <br>
			<input type="password" name="p_pw" size="16"><br><br>
			
			이름: <br>
			<input type="text" name="p_name" size="16"><br><br>
			
			연락처: <br>
			<select name="p_choice" style="width: 60px; height: 20.5px;">
				<option value="choice">선택</option>
				<option value="KT">KT</option>
				<option value="SKT">SKT</option>
				<option value="LGU+">LGU+</option>
			</select>
			<input type="text" maxlength="3" size="3" name="p_phone1">-
			<input type="text" maxlength="4" size="4" name="p_phone2">-
			<input type="text" maxlength="4" size="4" name="p_phone3"><br><br> 
			
			성별:
			<input type="radio" name="p_gender" value="남성">남
			<input type="radio" name="p_gender" value="여성">여<br><br>
			
			취미:
			<input type="checkbox" name="p_hobby" value="운동">운동
			<input type="checkbox" name="p_hobby" value="독서">독서
			<input type="checkbox" name="p_hobby" value="여행">여행
			<input type="checkbox" name="p_hobby" value="음악감상">음악감상<br><br>
			
			본인소개: <br>
			<textarea rows="3" cols="50" name="p_introduction"></textarea>
			<hr>
			
			<div align="center">
				<input type="submit" value="가입하기">
				&nbsp;&nbsp;&nbsp;
				<input type="reset" value="다시작성">
			</div>
			<br>
			
		</fieldset>
	</form>
	
	<hr>
	<a href="Insert.do">연결</a>
</body>
</html>
