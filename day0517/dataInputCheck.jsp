<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 유효성 검사</title>
<script type="text/javascript">
	function checkFun() {
		if(document.deptForm.dept.value == "") {
			alert("신청할 전공분야를 입력해 주세요!");
			document.deptForm.dept.select(); //전공을 입력할 수 있도록!
		}
	}
</script>
</head>
<body>
	<form name="deptForm" onsubmit="return false"> <%-- onsubmit="return false"는 전공을 입력하지 않았을 경우 넘어가지 않고 전공입력창에 커서가 갈 수 있도록 설정 --%>
		전공:
		<input type="text" name="dept" size="30"><br>
		이름:
		<input type="text" name="name" size="30">
		<input type="submit" value="신청" onclick="checkFun()">
	</form>
</body>
</html>  
