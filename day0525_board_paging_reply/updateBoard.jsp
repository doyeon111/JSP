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
	<form action="UpdateBoard" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="no" value=${b.no }><br>
	
		글 제목: <br>
		<input type="text" name="title" value=${b.title }><br><br>
		
		비밀번호: <br>
		<input type="password" name="pwd"><br><br>
		
		글 내용: <br>
		<textarea rows="10" cols="80" name="content">${b.content }</textarea><br><br>
		
		<img src="image/${b.fname }" width="20" height="20"><br>
		<input type="hidden" name="oldFname" value="${b.fname }"> <%-- 원래 파일이름 --%>
		파일: <input type="file" name="fname">
		
		<input type="submit" value="수정하기">
		&nbsp;&nbsp;
		<input type="reset" value="다시입력">
	</form>
</body>
</html>