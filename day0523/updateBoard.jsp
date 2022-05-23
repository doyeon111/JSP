<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시물 수정</h2>
	<hr>
	<form action="UpdateBoard" method="post">
		
		<input type="hidden" name="no" value=${b.no }><br>
	
		글 제목: <br>
		<input type="text" name="title" value=${b.title }><br><br>
		
		비밀번호: <br>
		<input type="password" name="pwd"><br><br>
		
		글 내용: <br>
		<textarea rows="10" cols="80" name="content">${b.content }</textarea><br><br>
		
		<input type="submit" value="수정하기">
		&nbsp;&nbsp;
		<input type="reset" value="다시입력">
	</form>
</body>
</html>