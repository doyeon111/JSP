<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date today = new Date();
		int year = today.getYear();
		int month = today.getMonth();
		
		//달력을 출력하려면 그 달의 1일의 요일을 알고 그 만큼 빈칸을 출력하고 그 다음부터 날짜를 출력해야한다.
		
		//그 달의 1일의 새로운 Date 객체를 생성한다.
		Date startDate = new Date(year, month, 1);
		
		int day = startDate.getDay();
		System.out.println(day);
		
		int []lastDay = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		int last = lastDay[month];
	%>
	
	<h3><%=year+1900 %>년 <%=month+1 %>월</h3>
	<hr>
	<table border="1">
		<thead>
			<tr>
				<th>일</th>
				<th>월</th> 
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
		</thead>
		<tbody>
		<tr>
			
			<%
				//날짜를 출력하는 반복문이 오기 전에 그 달의 1일에 요일만큼 빈칸을 출력한다.
				for (int j=1; j<=day; j++) {
					%>
						<td>&nbsp;</td>
					<%
				}
			
				for (int i=1; i<=last; i++) {
					%>
					<td><%=i %></td>
					<% 
					if((i+day) % 7 == 0) {
						%>
						</tr><tr>
						<% 
					}//end if
				}//end for					
			
			%>
		
		</tr>
		</tbody>
	</table>
	
	
	
	
	
</body>
</html>
