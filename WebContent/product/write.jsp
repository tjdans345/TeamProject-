<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:if test="${user.is_admin != 1}">
   <script>
      	alert("권한이 없습니다.");
      	location.href="${contextPath}";
   </script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

function URL1(input){
	
	if(input.files && input.files[0]){

		$("#sun").html("<img id='sunpreview' src='#' width=400 height=400 />");

		var reader = new FileReader();
		
		reader.readAsDataURL(input.files[0]);
		
		reader.onload = function(ProgressEvent){

			$('#sunpreview').attr('src',ProgressEvent.target.result);
			
		}
		
	}			
} 

function URL2(input){
	
	if(input.files && input.files[0]){

		$("#del").html("<img id='delpreview' src='#' width=400 height=400 />");

		var reader = new FileReader();
		
		reader.readAsDataURL(input.files[0]);
		
		reader.onload = function(ProgressEvent){

			$('#delpreview').attr('src',ProgressEvent.target.result);
			
		}
		
	}			
} 



</script>

<style type="text/css">
#tb {
	 margin: 10px;
}

#file{
	margin-left: 70px;
}

select{
	width: 170px; height: 25px;
}

input {
	text-align: center;
}
</style>
</head>

<body>

<jsp:include page="../include/header.jsp" />


<article style="padding-top: 50px; padding-bottom: 100px; padding-left: 650px;">
<h1>Register Product</h1>

<form action="${contextPath}/Proser/writePro.do" method="post" enctype="multipart/form-data" name="f">
	<table id="notice">			
		<tr>
			<td>콘서트명</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>장르</td>
			<td>
				<select name="genre" style="vertical-align: middle; text-align-last: center;">
					<option>아이돌</option>
					<option>트로트</option>
					<option>힙합</option>
					<option>락</option>
					<option>발라드</option>
					<option>재즈</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>이용가등급</td>
			<td>
				<select name="cla" style="vertical-align: middle; text-align-last: center;">
					<option>전체</option>
					<option>12세 이상 </option>
					<option>15세 이상</option>
					<option>19세 이상</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>공연시간(분)</td>
			<td><input type="text" name="runtime"></td>
		</tr>
		<tr>
			<td>공연기간</td>
			<td><input type="date" name="startdate"> ~ <input type="date" name="enddate"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>섬네일</td>
			<td><input type="file" name="image" onchange="URL1(this);"></td>
		<tr>
		<tr>
			<td id="sun" colspan="2"></td>		
		</tr>
		<tr>
			<td>제품내용</td>
			<td><input type="file" name="content" onchange="URL2(this)"></td>
		</tr>
		<tr>
			<td id="del" colspan="2"></td>		
		</tr>		
	</table>
	<div id="table_search" style="position: relative; left: 1%; top: 70px; padding-bottom: 50px;">
		<input type="submit" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important;" value="제품등록" class="btn">
		<input type="reset" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important;" value="다시작성" class="btn">
		<input type="button" style="background-color: #EB008B !important; border-color: #EB008B !important; color: #fff !important;" value="제품목록" class="btn" onclick="location.href='${contextPath}/Proser/imcontact.do'">
	</div>	
</form>

</article>


<jsp:include page="../include/footer.jsp" />
</body>
</html>












