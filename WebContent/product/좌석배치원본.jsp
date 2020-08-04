<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="alphabet" value="A,B,C,D,E,F,G,H,I,G,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"/>
											<c:forTokens items="${alphabet}" delims="," var="letter"  >
												<font size="2.95em">${letter}</font>&nbsp;
											</c:forTokens>
											<br>
											<c:set var="oneline" value="1,2,3"/>
											<c:set var="twoline" value="4,5,6"/>
											<c:set var="thrline" value="7,8,9"/>
											<c:forTokens items="${oneline}" delims="," var="line1">
												${line1}
												<c:forEach begin="1" end="26" step="1" items="${alphabet}" var="i">
													<input type="checkbox" name="seat" value="${i}${line1}">
												</c:forEach>
												<br>
											</c:forTokens>
												<br>
												
											<c:forTokens items="${twoline}" delims="," var="line2">
												${line2}
												<c:forEach begin="1" end="26" step="1" items="${alphabet}" var="i">
													<input type="checkbox" name="seat" value="${i}${line2}">
												</c:forEach>
												<br>
											</c:forTokens>
												<br>
												
											<c:forTokens items="${thrline}" delims="," var="line3">
												${line3}
												<c:forEach begin="1" end="26" step="1" items="${alphabet}"  var="i">
													<input type="checkbox" name="seat" value="${i}${line3}">
												</c:forEach>
												<br>
											</c:forTokens>
</body>					<!-- 	<c:if test="${i % 26 eq 0}">
												<br>
												</c:if> -->
</html>