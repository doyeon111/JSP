<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 길이 유효 검사(아이디, 비번)</title>
<script type="text/javascript">
	function pro() {
		var f = document.loginForm;
		
		if(f.id.value.length < 4 || f.id.value.length > 16) {
			alert("아이디는 4~16자 이내로 입력해야 합니다.");
			f.id.focus(); //다시 아이디를 입력할 수 있도록 커서를 아이디 입력창에 이동
			return false; //페이지가 넘어가지 않고 머물러 있도록 반환
			
		} else if (f.passwd.value.length < 8) {
			alert("비밀번호는 8자 이상으로 입력해야 합니다.");
			f.passwd.focus();
			return false;
		}
		
		document.loginForm.submit(); //모두 다 잘 입력하였으면 loginForm에 있는 submit으로 이동
		
	}
</script>
</head>
<body>
	<h2>아이디와 비밀번호 입력</h2>
	<hr>
	<form name="loginForm" action="dataLength_success.jsp" method="post" onsubmit="return false"> <%-- 아무 입력값이 없으면 일단 화면이 넘어가지 마라! --%>
		아이디: <br>
		<input type="text" name="id"><br><br>
		비밀번호: <br>
		<input type="password" name="passwd"><br><br>
		<input type="submit" value="로그인" onclick="pro()">
	</form>
</body>
</html>