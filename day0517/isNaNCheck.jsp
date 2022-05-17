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
		
		//닉네임의 입력한 문자열의 길이만큼 반복실행
		//T I G E r ==> i는
		//0 1 2 3 4
		for(i=0; i<f.sname.value.length; i++) {
			var ch = f.sname.value.charAt(i); //한글자 한글자 가져옴 && (ch < 'a' || ch > 'z') && (ch < '0' || ch > '9')
			if(ch < 'A' || ch > 'Z') {
				alert("닉네임은 영문 대문자로만 입력해주세요!");
				f.sname.focus();
				return false;
			}
		}
		
		if(isNaN(f.passwd.value)) { //form의 비밀번호가 숫자가 아닌가요?
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