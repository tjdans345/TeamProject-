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
    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">

    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/ionicons.min.css">

    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/style.css">
  </head>
  <body>
  	<jsp:include page="../include/subheader.jsp" />
    <!-- END nav -->

    <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-3 bread">Class Program</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>Classes</span></p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
    	<div class="container">
    	<input type="button" class="submit" value="제품등록" onclick="location.href='${contextPath}/Proser/write.do'">
        <div class="row">
        	<div class="col-md-3">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(../images/con1.jpg); height: 350px;"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">2020 서울 파크 뮤직 페스티벌</a></h3>
        				
        			</div>
        		</div>
        	</div>
        	<div class="col-md-3">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(../images/opera.jpg); height: 350px;"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">오페라 하우스</a></h3>
        			
        			</div>
        		</div>
        	</div>
        	<div class="col-md-3">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(../images/cats.jpg); height: 350px;"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">캣츠</a></h3>
        				
        			</div>
        		</div>
        	</div>
        	<div class="col-md-3">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(../images/hodu.jpg); height: 350px;"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">호두깎이 인형</a></h3>
        				
        			</div>
        		</div>
        	</div>
        	<div class="col-md-3">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(../images/classes-5.jpg); height: 350px;"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga Core</a></h3>
        				
        			</div>
        		</div>
        	</div>
        	<div class="col-md-3">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(../images/classes-6.jpg); height: 350px;"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga Restore</a></h3>
        			
        			</div>
        		</div>
        	</div>
        </div>
    	</div>
    </section>

    <footer class="ftco-footer ftco-section bg-light">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Meditative</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-lft mt-3">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Popular Links</h2>
              <ul class="list-unstyled">
                <li><a href="#">Yoga for Beginners</a></li>
                <li><a href="#">Yoga for Pregnant</a></li>
                <li><a href="#">Yoga Barre</a></li>
                <li><a href="#">Yoga Advance</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Quick Links</h2>
              <ul class="list-unstyled">
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Classes</a></li>
                <li><a href="#">Schedule</a></li>
                <li><a href="#">Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Have a Questions?</h2>
              <div class="block-23 mb-3">
                <ul>
                  <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                  <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                  <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p class="mb-0">
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              Copyright &copy;<script>
                document.write(new Date().getFullYear());

              </script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
        </div>
      </div>
    </footer>
    
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/bootstrap-datepicker.js"></script>
  <script src="../js/jquery.timepicker.min.js"></script>
  <script src="../js/scrollax.min.js"></script>
  <script src="../js/main.js"></script>
    
  </body>
</html>