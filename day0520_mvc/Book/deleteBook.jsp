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
	<c:if test="${re == 1 }">
		도서를 삭제하였습니다.
	</c:if>
	
	<c:if test="${re != 1 }">
		도서 삭제에 실패하였습니다.
	</c:if>
	
	<a href="ListBook">도서목록</a>
</body>
</html>