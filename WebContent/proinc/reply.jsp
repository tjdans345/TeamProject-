<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="contextPath" value="${contextPath}">
	<c:if test="${sessionScope.id != null}">

	<input type="button" class="btn btn-primary" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important; position: relative; top:50px; left: 1300px;" value="댓글쓰기" class="submit" onclick="openreply()" style="margin-left: 65%; margin-top: 30px;">
	</c:if>
	<form action="${contextPath}/Proser/reply.do" name="frmReply" method="post">
		<input type="hidden" name="pronum" value="${Bean.num}">
		<input type="hidden" name="parentsnum">
		<table border="1" align="center" style="margin-top: 30px;">
			<tr id="write" style="display: none;">
				<td align="center"><input type="text" value="${sessionScope.id}" name="id" readonly="readonly"></td>
				<td align="center"><textarea rows="5" cols="30" name="content"></textarea></td>
				<td align="center">
				<input type="button" class="btn btn-primary" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important;" value="댓글등록" onclick="replywrite()"><br>
				<input type="button" class="btn btn-primary" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important;" value="작성취소" onclick="hide()">
				</td>
			</tr>
		</table>
	</form>
	<form action="${contextPath}/Proser/updatereply.do" name="upReply" method="post">
		<input type="hidden" name="replynum">
		<table border="1" align="center" style="margin-top: 30px;">
			<tr id="upwrite" style="display: none;">
				<td align="center"><textarea rows="5" cols="30" name="upcontent"></textarea></td>
				<td align="center">
				<input type="button" value="댓글수정" onclick="replyupdate()"><br>
				<input type="button" value="수정취소" onclick="uphide()">
				</td>
			</tr>
		</table>
	</form>
	<table border="1" align="center" id="replytable"style="margin-top: 30px; clear: both;">
	
	</table>
</body> 
</html>