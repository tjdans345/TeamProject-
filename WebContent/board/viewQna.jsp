<%@page import="team.qnaboard.qnaBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%
//한글처리
request.setCharacterEncoding("UTF-8");
%>

<%--컨텍스트 주소 얻기 --%>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<html>
<head>
<title>1:1문의하기</title>

<jsp:include page="../include/header.jsp"></jsp:include>

	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<link rel="stylesheet" href="../css/style.css" />
	
	<script src="../js/jquery-3.4.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	
</head>
<body style="font-family: 'Nanum Gothic Coding', monospace;">

<section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row block-9" style="margin-top: 50px;">
			
			<div class="col-md-10">		

<!-- 탭메뉴 -->	
<ul class="nav nav-tabs" style="font-size: 14px;">
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link active"  href="${contextPath}/notice/listNotice.do" style="padding: 15px 85px 15px 85px;">
   	 공지사항
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link active"  href="${contextPath}/board/info2.jsp" style="padding: 15px 85px 15px 85px;">
	이용안내
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link active"  href="${contextPath}/fboard/faqlist.do" style="padding: 15px 100px 15px 100px;">
    FAQ
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
  
	  <c:choose>
	   	<c:when test="${id != null}">
	    		<a class="nav-link"  href="${contextPath}/qboard/qnaList.do" style="padding: 15px 70px 15px 70px;">
	    		나의 문의 내역
	    		</a>
	  		</c:when>
	  		<c:when test="${id == null}">
	  			<a class="nav-link"  href="${contextPath}/member/login.do" style="padding: 15px 70px 15px 70px;">
	  			나의 문의 내역
	  			</a>
	  		</c:when>
	  	</c:choose>

  </li>
</ul>			








<section class="container body-container py-5">
		<div class="row">
<!-- 	<div class="col-12">
				<h2>1:1문의하기</h2>
			</div>
		</div> -->
		<!-- 게시판 -->
		<article class="mt-3">
				<table class="table">
					<colgroup>
						<col style="max-width: 15%" />
						<col />
					</colgroup>
					<tr>
						<th class="align-middle">
							<label for="poolName" class="m-0">카테고리</label>
						</th>
						<td>
						
<!-- 						<input class="form-control" type="text" name="poolName" id="poolName" required /> -->
							<label>${qna.qna_cate}</label>
						</td>
					</tr>
					
					<tr>
						<th class="align-middle">
							<label for="poolAddress1" class="m-0">제목</label>
						</th>
						<td>
							<label>${qna.qna_title}</label>
						</td>
					</tr>
					
					<tr>
						<th class="align-middle">
							<label for="contents" class="m-0">내용</label>
						</th>
						<td>
							${qna.qna_contents}  <br><br><br>
						</td>
					</tr>	
					
					
					<tr>
						<th class="align-middle">
							<label for="contents" class="m-0">첨부이미지</label>
						</th>
						<td>
 							<a href="${contextPath}/board/image/${qna.file}" target="_blank"><img alt="img" src="${contextPath}/board/image/${qna.file}" height="40%" width="35%"></a>  <br><br><br>
						</td>
					</tr>	
								
					
				<c:if test="${qna.qna_status == 1}">					
					<tr>
						<th class="align-middle">
							<label for="contents" class="m-0">답변</label>
						</th>
						<td>
							${qna.answer}  <br><br><br>
						</td>
					</tr>
				</c:if>
					
					
				<c:if test="${is_admin == 1}">	
					<a href="${contextPath}/qboard/deleteQna.do?qna_num=${qna.qna_num}">
						<input type="button" value="삭제하기">
					</a>
					
					<a href="${contextPath}/qboard/qnaUpdateForm.do?qna_num=${qna.qna_num}">
						<input type="button" value="수정하기">
					</a>
				</c:if>	
<!-- 					
					<tr>
						<th class="align-middle">
							<label for="boardFile1" class="m-0">이미지 첨부1</label>
						</th>
						<td>
							<div class="custom-file">
								<input class="custom-file-input" type="file" name="boardFile1" id="boardFile1" onchange="readURL(this, 'image')" />
								<label class="custom-file-label" for="boardFile1">Choose file</label>
							</div>
						</td>
					</tr>
					 -->
					
					
				</table>
				<div class="text-center my-5">
					<button type="button" class="btn btn-secondary" onclick="history.back()">돌아가기</button>
				</div>
		</article>
		<!-- 게시판 -->
		</div>
	</section>
	
	
<!--  	
 	<script src="${contextPath}/js/bs-custom-file-input.js"></script>
	<script>
		$(document).ready(function() {
			bsCustomFileInput.init()
		})
		
		function readURL(obj, allowType){
			var $preview  = $(obj).parent().siblings(".preview");

			if($preview.length){
				$preview.remove();
			}
			
			if(obj.files && obj.files[0]){
				var fileType = obj.files[0].type.split("/")[0];
				
				if(fileType=="image"){
					$preview = $("<div class='preview' />");
					$preview.appendTo($(obj).parent().parent());
					
					var reader = new FileReader();				
					reader.readAsDataURL(obj.files[0]);
					
					reader.onload = function(ProgressEvent){
						$preview.css("background-image", "url(" + ProgressEvent.target.result + ")");
					}
				}else{
					if(allowType=="image"){
						alert("이미지 파일만 첨부하실 수 있습니다.");
						obj.value = "";
					}
				}
			}
		}
	</script>
	
-->	

			</div>
		</div>
	</div>
</section>
	
	
<jsp:include page="../include/footer.jsp"></jsp:include>	

</body>
</html>