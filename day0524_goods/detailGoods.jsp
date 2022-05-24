<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>상품정보 상세보기</h2>
	<hr>
	상품번호: ${g.no }<br>
	상품명: ${g.item }<br>
	수량: ${g.qty }<br>
	가격: ${g.price }<br>
	<c:if test="${g.fname != null and g.fname != ''}">
		<img src="image/${g.fname }">
	</c:if>
	<hr>
	<a href="InsertGoods">상품 등록</a>
	&nbsp;&nbsp;
	<a href="ListGoods">목록보기</a>
	&nbsp;&nbsp;
	<a href="UpdateGoods?no=${g.no }">수정</a>
	&nbsp;&nbsp;
	<a href="DeleteGoods?no=${g.no }">삭제</a>
</body>
</html>