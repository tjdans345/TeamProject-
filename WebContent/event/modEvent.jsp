<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>

<%--컨텍스트 주소 얻기 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="../include/header.jsp"/>

<title>이벤트 수정</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<link rel="stylesheet" href="../css/style.css" />
	<script src="../js/jquery-3.4.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</head>
<body>

<body style="text-align: center;">

   <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
			<div class="container">
        		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          			<div class="col-md-9 ftco-animate text-center">
						<h1 class="mb-3 bread">Event</h1>
						<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Contact</span></p>
					</div>
				</div>
			</div>
	</section>
	<section class="container body-container py-5">
	<div class="row">
				<div class="col-12">
					<h2>이벤트 수정</h2>
				</div>
			</div>
			<!-- 게시판 -->
			<article class="mt-3">
				<form
					action="${contextPath}/ev/modEvent.do?e_num=${event.e_num}"
					method="post" enctype="multipart/form-data">
					<table class="table">
						<colgroup>
							<col style="max-width: 15%" />
							<col />
						</colgroup>

						<tr>
							<th class="align-middle"><label for="poolAddress1"
								class="m-0">제목</label></th>
							<td><input type="text" class="form-control" name="e_title"
								value="${event.e_title}" id="poolAddress1" maxlength="50">
							</td>
						</tr>
	
						<tr>
							<th class="align-middle">
								<label for="contents" class="m-0">이벤트 기간</label>
							</th>
							<td>
								<input type="date" name="e_startdate" value="${event.e_startdate}"> - 
								<input type="date" name="e_enddate" value="${event.e_enddate}">
							</td>
						</tr>

						<tr>
							<th class="align-middle"><label for="contents" class="m-0">내용</label>
							</th>
							<td><textarea class="form-control" name="e_content"
									id="poolContent" cols="40" rows="13" required>${event.e_content}</textarea>
							</td>
						</tr>
						<tr>
							<th class="align-middle">
								<label for="e_file" class="m-0">이미지 첨부</label>
							</th>
							<td>
							<div class="custom-file">
								<input class="custom-file-input" type="file" name="e_file" id="e_file" accept="image/*"
								 />
								<label class="custom-file-label" for="e_file" id="fileinput">${event.e_file}</label>
							</div>
							</td>
						</tr>																		
					</table>
					<div class="text-center my-5">
						<button type="button" class="btn btn-secondary"
							onclick="history.back()">취소</button>
						<button type="submit" class="btn btn-primary">등록하기</button>
					</div>
				</form>
			</article>

		</section>
	<script src="${contextPath}/js/bs-custom-file-input.js"></script>
	<script>
	$('#e_file').change(function() {
		$('#fileinput').text($('#e_file')[0].files[0].name);
	});
	

	</script>
<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>