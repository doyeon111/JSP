<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function pro() {
		var f = document.loginForm;
		var sname = f.sname;
		var passwd = f.passwd;
		
		//if(sname.value == "")  //이것과 아래줄의 의미가 같다==> 닉네임에 아무것도 입력하지 않았니?
		if(sname.value.length == 0) {
			alert("닉네임을 입력하세요!");
			sname.focus();
			return false;
		}
		
		if(passwd.value.length == 0) {
			alert("비밀번호를 입력하세요!");
			passwd.focus();
			return false;
		}
		
		for(i=0; i<sname.value.length; i++) {
			var ch = sname.value.charAt(i);
			
			if(ch < 'A' || ch > 'Z'){
				alert("닉네임을 대문자로 입력하세요!");
				sname.focus();
				return false;
			
			}
				
		}
		
		if(isNaN(passwd.value)) {
			alert("비밀번호는 숫자로 입력하세요!");
			passwd.focus();
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