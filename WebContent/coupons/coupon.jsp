<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>

<%-- <jsp:useBean id="event" class="event.EventBean"/> --%>
<jsp:useBean id="coupon" class="coupon.CouponBean"/>

<%-- 컨텍스트 주소 얻기 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 페이지</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

</head>
<body>
<!-- header -->
<jsp:include page="../include/header.jsp"/>
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

	<section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
		<div class="container">

	<section class="container body-container py-5">

    
    
    <section>
    <div>
    <input type="button" class="submit" value="쿠폰 등록" formmethod="post" onclick="location.href='${contextPath}/coupon/eventWriteForm.do'">
	<c:set var="i" value="0" />
    <c:set var="j" value="3" />
    <table border="1" style="">    
<%--     	<c:forEach var="eventBean" items="${list}"> --%>
    	<c:forEach var="couponBean" items="${list}">
<!--     	<c:choose>
    		<c:when test="${empty list}">
    			<tr>
    				<td>등록된 이벤트가 없습니다.</td>
    			</tr>
    		</c:when>  
    		<c:when test="${!empty list}">    -->		
    			<c:if test="${i%j == 0}">
    				<tr>
    			</c:if>	    					
   						<td style="width:300px; height: 150px;">
    						<a href="${contextPath}/coupon/eventInfo.do?event_num=${couponBean.event_num}">
							<img src="../upload/${couponBean.event_timage}" style="width:300px; height: 120px;">
							<div class="text  text-left" style="text-align: left; font-size: 1em;">
								${couponBean.event_title}
							</div></a>
							<div class="text  text-left" style="text-align: left; font-size: 1em;">
								${couponBean.event_startdate} ~ ${couponBean.event_enddate}
							</div>
						</td>	
    			<c:if test="${i%j == j-1}">
    				</tr>
    			</c:if>
    			<c:set var="i" value="${i+1}" />	
    			
    <!--		</c:when>
    </c:choose> --> 	
    	</c:forEach>
    </table>
    </div>
    	<c:if test="${blockFirst!=1}">
    		<a href="${contextPath}/coupon/events.do?nowPage=${blockFirst-blockSize}"></a>
    	</c:if>
    	<c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
    		<a href="${contextPath}/coupon/events.do?nowPage=${i}">${i}</a>
    	</c:forEach>
    	<c:if test="${blockLast!=totalPage}">
    		<a href="${contextPath}/coupon/events.do?nowPage=${blockLast+1}"></a>
    	</c:if>
    	
    </section>
    </section>
    </div>
 	</section>
 	 
	
<!-- footer -->
<jsp:include page="../include/footer.jsp"/>
<!-- footer -->	
</body>
</html>