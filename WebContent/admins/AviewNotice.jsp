<%@page import="noticeboard.NoticeboardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
			<form method="post" action="${contextPath}/admin/AmodNoticePage.do?n_num=${notice.n_num}" name="modNotice">
            	<div class="form-group">
              		<input type="hidden" name="n_num" value="${notice.n_num}">
                	<label>제목 : ${notice.n_title}</label>
              	</div>
              	<div class="form-group">
 					<label>분류 : ${notice.n_cate}</label>
              	</div>
              	<div class="form-group">
                	<label>관리자</label>
              	</div>                              
              	<div class="form-group">
                	<label>내용 : ${notice.n_content}</label>
              	</div>
             	
        		<input type=submit value="수정하기">
 				<a href="${contextPath}/admin/AdeleteNotice.do?n_num=${notice.n_num}">
 					<input type="button" value="삭제하기">
 				</a>
 				<a href="${contextPath}/admin/ANoticeMain.do"><input type="button" value="메인으로"></form>
			</form>
		</div>
	</section>
	<!-- footer -->
   	<jsp:include page="../include/footer.jsp"></jsp:include>
   	<!-- footer -->
  </body>
</html>