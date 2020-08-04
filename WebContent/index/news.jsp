<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <style>

.news {
	border: 1px solid #e7e7e7; 
	box-sizing: content-box; 
	padding: 0 0 0 0px;
	position: relative;  
	background-color:;
	width: 900px;
	margin: 0 auto;}
.news1{
margin: 10px;}
.photo{width:106px; float:left;
    margin-top: 2px;
    margin-right: 17px }

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<jsp:include page="../include/header.jsp"/>

					<div class="news" >	
				
					<div class="news1" >
							<c:forEach var="i" items="${list}">
								${i}
							</c:forEach>
						</div>
					</div>
					
					
<jsp:include page="../include/footer.jsp"/>					
</body>
</html>