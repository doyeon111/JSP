<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정규표현식</title>
<script type="text/javascript">
	function pro() {
		var f = document.loginForm;
		
		//사용자가 입력한 닉네임을 변수에 저장
		var name = f.sname.value;
		
		//닉네임의 유효성 검사를 위한 정규표현식을 변수에 저장
		var regExpName = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/ //a-z까지..~~
		
		//사용자가 입력한 비밀번호를 변수에 저장
		var pw = f.passwd.value;
		
		//비밀번호의 유효성 검사를 위한 정규표현식을 변수에 저장
		var regExpPasswd = /^[0-9]*$/ //0에서 9로 시작하고 0개 이상이고 숫자로표현
		
		//닉네임의 입력값이 없는지 판별
		if(name == "") {
			alert("닉네임을 입력하세요!");
			f.sname.focus();
			return false;
		}
		
		//비밀번호의 입력값이 없는지 판별
		if(pw == "") {
			alert("비밀번호를 입력하세요!");
			f.passwd.focus();
			return false;
		}
		
		
		//사용자가 입력한 닉네임이 정규표현식을 따르지 않는지 확인
		if(!regExpName.test(name)) {
			alert("닉네임은 숫자로 시작할 수 없습니다!");
			f.sname.focus();
			return false;
		}
		
		if(!regExpPasswd.test(pw)) {
			alert("비밀번호는 숫자로만 입력해주세요!");
			f.passwd.focus();
			return false;
		}
		
		f.submit();
		
	}
</script>
</head>
<body>
	<h2>닉네임과 비밀번호 입력</h2>
	<hr>
	<form action="isNaNCheck_success.jsp" method="post" name="loginForm" onsubmit="return false">
	
		닉네임: <br><%-- 닉네임은 대문자로만 입력하도록 설정 --%>
		<input type="text" name="sname"><br><br>
		
		비밀번호: <br> <%-- 비밀번호는 모두 숫자로만 입력하도록 설정 --%>
		<input type="password" name="passwd"><br><br>
		<input type="submit" value="신청하기" onclick="pro()">
	</form>
</body>
</html>