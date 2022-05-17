<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사</title>
<script type="text/javascript">
	function checkFun() {
		
		//만약 도서명을 입력하지 않았다면 메시지를 출력하고 서버로 이동하지 않고 여기에 머무른다.
		if(document.gradeForm.book.value == "") {
			alert("도서명을 입력하세요!");
			return false;
		}
		
		alert("추천도서: " + document.gradeForm.book.value+"\n" + "평점: " +document.gradeForm.grade.value);
		
		
		
		return true;
	}
</script>
</head>
<body>
	<h2>추천 도서 평점</h2>
	<hr>
	<form name="gradeForm" action="gradeOK.jsp" method="post" onsubmit="return checkFun();">
		추천도서 <br>
		<input type="text" name="book" size="30"><br><br>
		
		평점:
		<hr>
		<input type="radio" name="grade" value="♥♥♥♥♥">♥♥♥♥♥<br>
		<input type="radio" name="grade" value="♥♥♥♥♡">♥♥♥♥♡<br>
		<input type="radio" name="grade" value="♥♥♥♡♡">♥♥♥♡♡<br>
		<input type="radio" name="grade" value="♥♥♡♡♡">♥♥♡♡♡<br>
		<input type="radio" name="grade" value="♥♡♡♡♡">♥♡♡♡♡<br> 
		<hr>
		
		<input type="submit" value="추천하기">
		&nbsp;&nbsp;&nbsp;
		<input type="reset" value="다시작성">	
	</form>
	
	
</body>
</html>