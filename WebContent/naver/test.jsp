<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>잘왔다</p>
	
	<%
		String name = request.getParameter("name");
		
		System.out.println(name);
	%>
	
	<p><%=name%></p>
</body>
</html>