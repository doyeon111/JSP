<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkFun() {
		alert("추천도서: " + document.gradeFarm.book.value);

		return false;
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