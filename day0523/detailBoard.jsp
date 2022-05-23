<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시물 상세보기</h2>
	<hr>
	글번호: ${b.no }<br>
	글제목: ${b.title }<br>
	작성자: ${b.writer }<br>
	비밀번호: ${b.pwd }<br>
	글내용: <br> 
		<textarea rows="10" cols="80" readonly="readonly">${b.content }</textarea><br>
	등록일: ${b.regdate }<br>
	조회수: ${b.hit }
	<hr>
	<a href="InsertBoard">새 글 작성</a>
	&nbsp;&nbsp;
	<a href="ListBoard">목록보기</a>
	&nbsp;&nbsp;
	<a href="UpdateBoard?no=${b.no }">수정</a>
	&nbsp;&nbsp;
	<a href="DeleteBoard?no=${b.no }">삭제</a>
	
	
</body>
</html>