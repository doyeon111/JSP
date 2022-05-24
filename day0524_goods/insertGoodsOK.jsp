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
	<c:if test="${re==1 }">
		상품 등록에 성공하였습니다.
	</c:if>
	
	<c:if test="${re != 1 }">
		상품 등록에 실패하였습니다.
	</c:if>
	<hr>
	<a href="">상품 등록</a>
	<a href="ListGoods">목록</a>
</body>
</html>