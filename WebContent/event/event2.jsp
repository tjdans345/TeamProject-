<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>
<%--컨텍스트 주소 얻기 --%>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>



<html>
<head>
<style>



.event {
/* 	vertical-align: middle; 
 	border-style: none; 
 	max-width: 100%; 
 	width: 300px; */
 	max-width: 1240px;
 	padding: 8px;
 	width: 33.33%
}

.coupon {
/* 	vertical-align: middle; 
 	border-style: none; 
 	max-width: 100%; 
 	width: 300px; */
 	max-width: 1240px;
 	padding: 8px;
 	width: 33.33%
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css" />
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<script type="text/javascript">




if (self.name != 'reload') {
    self.name = 'reload';
    setTimeout(function(){
		location.reload();
		},100); 
}
else self.name = ''; 

	
	


	


</script>

</head>
<body style="text-align: center;">
<jsp:include page="../include/header.jsp"/>

	
	<div>		
		<div style="margin-left: 500px; margin-top: 100px;">	
			<a href="#" onclick="te3(1)"><input type="button" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important; width: 100px;" value="이벤트"></a>
		</div>
		<div style="margin-left: 800px; margin-top: -30px;">
			<a href="#" onclick="te3(2)"><input type="button" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important; margin-bottom: 100px; width: 100px;" value="쿠폰존"></a>
		</div>
	</div>
	
	<c:if test="${pcheck == 0 }">
	<div id="event">
	<section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
		<div class="container">
<!-- 			<section class="container body-container py-5"> -->

		<!-- 게시판 -->
				<article class="mt-3">
					<div class="gallery-grid">
						<c:if test="${eventList != null}">
							<c:forEach var="event" items="${eventList}" varStatus="status">
								<div class="gallery-grid-item">
	 								<a href="${contextPath}/ev/viewEvent.do?e_num=${event.e_num}">
	 									<img style="width: 300px; max-width: 100%; padding: 8px;" src="${contextPath}/event/image/${event.e_file}"><br>
									</a>
									<small>${event.e_title}</small><br>
									<small>${event.e_startdate}</small>&nbsp;~&nbsp;<small>${event.e_enddate}</small>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${eventList == null }">
							<div class="gallery-grid-item">
								등록된 게시글이 없습니다.
							</div>
						</c:if>
					</div>				
					<div class="row  my-5">
						<div class="col-12 col-lg-8"></div>
						<div class="col-12 col-lg-4 mt-3 mt-lg-0">
					
						</div>
					</div>
					<div class="row">
						<div class="col-12">				
							<ul class="pagination justify-content-center">
										
							<%-- 페이징처리 --%>			
					 		<c:if test="${nowpage > blocksize}">
								<li class="page-item">
									<a class="page-link" href="${contextPath}/ev/listEvent.do?nowpage=${blockfirst - blocksize}">이전</a>
								</li>
							</c:if>
					      	<c:if test="${blockFirst!=1}">
					             <a href="${contextPath}/ev/listEvent.do?nowPage=${blockFirst-blockSize}"></a>
					         </c:if>
					         <c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
					         	<a href="${contextPath }/ev/listEvent.do?nowPage=${i}">${i}</a>
					         </c:forEach>
					         <c:if test="${blockLast!=totalPage}">
					             <a href="${contextPath}/ev/listEvent.do?nowPage=${blockLast+1}"></a>                    
					         </c:if>
							<c:if test="${blocklast != totalpage}">
								<li class="page-item">
									<a class="page-link" href="${contextPath}/ev/listEvent.do?nowpage=${blocklast + 1}">다음</a>
								</li>
							</c:if>
							</ul>
						</div>
					</div>
		</article>
		<!-- 게시판 -->
<!-- 	</section> -->
	
	</div>

	</section>
	</div>
	</c:if>
	
	<c:if test="${pcheck == 1 }">
	<div id="coupon">
	<section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
		<div class="container">

<!-- 	<section class="container body-container py-5"> -->

		<!-- 게시판 -->
		<article class="mt-3">
			<div class="gallery-grid">
				<c:if test="${list != null}">
					<c:forEach var="couponBean" items="${list}" varStatus="status">
						<div class="gallery-grid-item">
	 						<a href="${contextPath}/coupon/eventInfo.do?event_num=${couponBean.event_num}">
	 							<img style="width: 300px; max-width: 100%; padding: 8px;" src="../upload/${couponBean.event_timage}"><br>
							</a>
							<small>${couponBean.event_title}</small><br>
							<small>${couponBean.event_startdate}</small>&nbsp;~&nbsp;<small>${couponBean.event_enddate}</small>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${list == null }">
					<div class="gallery-grid-item">
						등록된 게시글이 없습니다.
					</div>
				</c:if>
			</div>				
			<div class="row  my-5">
				<div class="col-12 col-lg-8">
					
				</div>
				<div class="col-12 col-lg-4 mt-3 mt-lg-0">
						
				</div>
			</div> 
		</article>
<!-- 	</section> -->
</div>
</section>
</div>
	</c:if>		

<jsp:include page="../include/footer.jsp"/>
<script src="${contextPath}/js/masonry.pkgd.min.js"></script>

	<script>
		function toggleContent(obj){
			$(obj).next().toggle();
		}
		function hideContent(){
			$(".poolcontent").hide();
		}
	</script>
	
	<script>
	$(document).ready(function(){
		
			$(".gallery-grid").masonry({
				itemSelector : '.gallery-grid-item'
			}).addClass("active");

	})
	</script>
	
	<script type="text/javascript">
	
	function te3(t) {
		if(t == 1) {
			window.location.href="${contextPath}/ev/listEvent.do?pcheck=0";
			

		 }	
		if(t == 2) {	
			window.location.href="${contextPath}/ev/listEvent.do?pcheck=1";
			setTimeout(function(){
				location.reload();
				},3000); // 3000밀리초 = 3초

		}
	}
</script>

</body>
</html>