<%@page import="noticeboard.NoticeboardBean"%>
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
<title>공지사항</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	<!-- header -->
	<jsp:include page="../include/header.jsp" />
	<!-- header -->
<section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
      	<div class="container">
        	<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          		<div class="col-md-9 ftco-animate text-center">
            		<h1 class="mb-3 bread">Class Program</h1>
            		<p class="breadcrumbs"><span class="mr-2"><a href="../index.jsp">Home</a></span> <span>Classes</span></p>
          		</div>
        	</div>
      	</div>
</section>
<section>
	<div class="col-md-6 ftco-animate py-md-5">
		<form method="post" action="${contextPath}/notice/modNotice.do?n_num=${notice.n_num}" name="modNotice">
			<div class="form-group">
				<input type="hidden" name="n_num" value="${notice.n_num}">
                <input type="text" name="n_title" class="form-control" value="${notice.n_title}">
			</div>
			
            <div class="form-group">
            	<a>분류 : </a>
               	<select name="n_cate">
                	<option value="서비스 소식">서비스 소식</option>
                	<option value="서비스 점검">서비스 점검</option>
               		<option value="안내">안내</option>
               	</select>
           	</div>			
 			
			<div class="form-group">
                <input type="text" class="form-control" value="관리자" readonly="readonly">
			</div>                              
			<div class="form-group">
                <textarea name="n_content" cols="30" rows="7" class="form-control">${notice.n_content}</textarea>
			</div>
			<input type=submit value="수정완료">
 			<input type="button" value="취소하기" onclick="history.back();">
		</form>
	</div>
</section>
	<!-- footer -->
   	<jsp:include page="../include/footer.jsp"></jsp:include>
   	<!-- footer -->
</body>
</html>