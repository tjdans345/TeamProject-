<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--컨텍스트 주소 얻기 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 등록</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<link rel="stylesheet" href="../css/style.css" />
	
	<script src="../js/jquery-3.4.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	
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
</head>
<body>
<!-- header -->
<jsp:include page="../include/header.jsp"/>
<!-- header -->

<section class="container body-container py-5">
		<div class="row">
			<div class="col-12">
				<h2>이벤트 등록</h2>
			</div>
		</div>
		<!-- 게시판 -->
		<article class="mt-3">
			<form action="${contextPath}/coupon/eventWrite.do" method="post" enctype="multipart/form-data">
				<table class="table">
					<colgroup>
						<col style="max-width: 15%" />
						<col />
					</colgroup>
					
					
					<tr>
						<th class="align-middle">
							<label for="poolAddress1" class="m-0">제목</label>
						</th>
						<td>
							<input type="text" class="form-control" name="title" id="event_title" maxlength="50">
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="poolAddress1" class="m-0">이벤트 날짜</label>
						</th>
						<td>
							<input type="date" class="form-control" name="startdate" id="event_startdate" maxlength="50"><input type="date" class="form-control" name="enddate" id="event_enddate" maxlength="50">
						</td>
					</tr>			
					<tr>
						<th class="align-middle">
							<label for="contents" class="m-0">내용</label>
						</th>
						<td>
							<textarea class="form-control" name="content" id="eventContent" cols="40" rows="13" required></textarea>
						</td>
					</tr>
					<tr rowspan="2">
						<th class="align-middle">
							<label for="poolAddress1" class="m-0">썸네일이미지</label>
						</th>
						<td>
							<input type="file" class="form-control" name="timage" id="event_timage" maxlength="50" onchange="URL2(this);">
						</td>
						
					</tr>
					<tr>
						<td id="del" colspan="2"></td>		
					</tr>
					<tr rowspan="2">					
						<th class="align-middle">
							<label for="poolAddress1" class="m-0">내용이미지</label>
						</th>
						<td>
							<input type="file" class="form-control" name="image" id="event_image" maxlength="50" onchange="URL1(this);">
						</td>
					</tr>
					<tr>
						<td id="sun" colspan="2"></td>
					</tr>
					
				</table>
				<div class="text-center my-5">
					<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
					<button type="submit" class="btn btn-primary">등록하기</button>
				</div>
			</form>
		</article>
	</section>

<!-- footer -->
<jsp:include page="../include/footer.jsp"/>
<!-- footer -->
</body>
</html>