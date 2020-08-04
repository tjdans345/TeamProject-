<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/css/animate.css">
    
    <link rel="stylesheet" href="${contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextPath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${contextPath}/css/magnific-popup.css">

    <link rel="stylesheet" href="${contextPath}/css/aos.css">

    <link rel="stylesheet" href="${contextPath}/css/ionicons.min.css">

    <link rel="stylesheet" href="${contextPath}/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${contextPath}/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${contextPath}/css/flaticon.css">
    <link rel="stylesheet" href="${contextPath}/css/icomoon.css">
    <link rel="stylesheet" href="${contextPath}/css/style.css">
    
    <script type="text/javascript">
    	function sub() {
			document.getElementById("searchfrom").submit();
		}
    </script>
 
    
  </head>
  <body>
  	<jsp:include page="../include/subheader.jsp" />
    <!-- END nav -->

    <section class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-3 bread">Class Program</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="${contextPath}">Home</a></span> <span>Classes</span></p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
    	<div class="container">
    	
    	
    	<div class="page-header" style="margin-top: 50px;">
          
        <h1>Check</h1>
        <form action="${contextPath}/Proser/imcontact2.do" method="post" id="searchfrom">
        	<input type="text" name="sear" placeholder="search....">
        	<i class="material-icons" onclick="sub()">&#xE8B6;</i>
        </form>
        <hr>

			<div class="row" id="row">
				<c:if test="${List != null}">
					<c:forEach var="VO" items="${List}">
					<c:if test="${VO.runstatus == 0}">
						<div class="col-md-3">
							<div class="classes w-100 ftco-animate">
								<a href="${contextPath}/Proser/content.do?num=${VO.num}&name=${VO.name}" class="img w-100 mb-3"
									style="background-image: url(${contextPath}/consert/${VO.image}); height: 350px;"></a>
								<div class="text w-100 text-center">
									<h3>
										${VO.name}
									</h3>

								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
				</c:if>
        	</div>
        </div>
        </div>
    </section>
  <jsp:include page="../include/footer.jsp" />
 
  </body>
</html>