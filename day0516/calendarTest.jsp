<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
		
			<%
				for (int i=1; i<=30; i++) {
					%>
					<td><%=i %></td>
					<% 
					if(i % 7 == 0) {
						%>
						</tr><tr>
						<% 
					}//end if
				}//end for					
			
			%>
		
		</tr>
	</table>
</body>
</html>