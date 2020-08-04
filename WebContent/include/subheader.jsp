<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
<!-- PP h5 -->
<!-- JSTL 사용을 위해 선언 -->    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "93c11d3e-a14d-4123-a8fd-2391ad9fe0fc"
  });
</script>
<!-- End Channel Plugin -->


<link href="//fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet" type="text/css">


  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+ER" rel="stylesheet">


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
  	
  	
  	
  <!-- ? s-->
  
 <%--  	
  	<style>
	.ah{
		color:black;
		text-decoration: none;
	}
	.ah:hover{
		color:red;
		text-decoration: underline;
	}
</style>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
    
    
    
    
  	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  		<div class="container" >
  			<div class="row m-auto">
  				<div class="col-12 w-100 text-center">
  					<a class="navbar-brand w-100" href="${contextPath}" style="float: left; margin-left: -400px;" >Ticketing</a>
  	
  	 --%>
 <!-- ? e-->
 
 
 
 
<!-- -----------------------------장바구니s---------------------------- -->
 
<%--  
<table style="width:300px; height: 100px;  border-collapse: separate;	
    border-spacing: 1px; margin: 100px; text-align: center; float: right; margin-top: -100px; font-size: 12px;">
    
  <c:if test="${id!=null}">
     <tr height="10" align="center" bgcolor="#FFB5B5" style="width: 155px;
    		padding: 10px; font-weight: bold;">
        <td rowspan="3" align = "center" bgcolor="#FFB5B5" width="100px;">
   <c:choose>    	
    	 <c:when test="${!empty profile_img }">
	       <img src="${contextPath}/upload/${profile_img}" alt="프로필 이미지" style="max-width: 100px;">
    	 </c:when>
   		 <c:when test="${empty profile_img}">
			<img src="${contextPath}/images/icon.png" width="100px" height="100px">
  		 </c:when>
   </c:choose>
        </td>
	<td colspan="2" style="width: 100px;"><span id="counter"> </span> 후 자동로그아웃 <input type="button" class="btn btn-primary" value="연장" onclick="counter_reset()"></td>
    </tr>
    <tr height="10" align="center" bgcolor="#FFB5B5" style="width: 155px; padding: 10px; font-weight: bold;">
		<td colspan="2">
		<c:if test="${id!=null}">
  					${id}님 로그인중..
  		</c:if>
		</td>
        </tr>
        <tr height="10" align="center" bgcolor="#FFB5B5" style="width: 155px; padding: 10px; font-weight: bold;">
		    <c:if test="${id!=null}">
		        <td><a href="${contextPath}/member/logout.do" style="color: #fff;">로그아웃</a></td>
				<td><a href="${contextPath}/mycon/mypageForm.do" style="color: #fff;">마이 페이지</a></td>
			</c:if>	
        </tr>
</c:if>
</table>
  --%>
 
 
 <!-- -----------------------------장바구니e---------------------------- -->
 
 
 
 
 
 
 
 
 
 
  	
<!------------------------------------------------ 맨위 내비바 -------------------------------------------------->





<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	background: #eeeeee;
	font-family: 'Varela Round', sans-serif;
}
.navbar {
	color: #fff;
	background: #3d435c !important;
	padding: 5px 16px;
	border-radius: 0;
	border: none;
	box-shadow: 0 0 4px rgba(0,0,0,.1);
}


/* .navbar img {
	border-radius: 50%;
	width: 36px;
	height: 36px;
	margin-right: 10px;
}
 */



.navbar .navbar-brand {
	color: #efe5ff;
	padding-left: 0;
	padding-right: 50px;
	font-size: 24px;
			
}
.navbar .navbar-brand:hover, .navbar .navbar-brand:focus {
	color: #fff;
}
.navbar .navbar-brand i {
	font-size: 25px;
	margin-right: 5px;
}
.search-box {
	position: relative;
}	
.search-box input {
	padding-right: 35px;
	min-height: 38px;
	border: none;
	background: #faf7fd;
	border-radius: 3px !important;
}
.search-box input:focus {		
	background: #fff;
	box-shadow: none;
}
.search-box .input-group-addon {
	min-width: 35px;
	border: none;
	background: transparent;
	position: absolute;
	right: 0;
	z-index: 9;
	padding: 10px 7px;
	height: 100%;
}
.search-box i {
	color: #a0a5b1;
	font-size: 19px;
}
.navbar .nav-item i {
	font-size: 18px;
}
.navbar .nav-item span {
	position: relative;
	top: 3px;
}
.navbar .navbar-nav > a {
	color: #efe5ff;
	padding: 8px 15px;
	font-size: 14px;		
}
.navbar .navbar-nav > a:hover, .navbar .navbar-nav > a:focus {
	color: #fff;
	text-shadow: 0 0 4px rgba(255,255,255,0.3);
}
.navbar .navbar-nav > a > i {
	display: block;
	text-align: center;
}
.navbar .dropdown-item i {
	font-size: 16px;
	min-width: 22px;
}
.navbar .dropdown-item .material-icons {
	font-size: 21px;
	line-height: 16px;
	vertical-align: middle;
	margin-top: -2px;
}
.navbar .nav-item.open > a, .navbar .nav-item.open > a:hover, .navbar .nav-item.open > a:focus {
	color: #fff;
	background: none !important;
}
.navbar .dropdown-menu {
	border-radius: 1px;
	border-color: #e5e5e5;
	box-shadow: 0 2px 8px rgba(0,0,0,.05);
}
.navbar .dropdown-menu a {
	color: #777 !important;
	padding: 8px 20px;
	line-height: normal;
	font-size: 15px;
}
.navbar .dropdown-menu a:hover, .navbar .dropdown-menu a:focus {
	color: #333 !important;
	background: transparent !important;
}
.navbar .navbar-nav .active a, .navbar .navbar-nav .active a:hover, .navbar .navbar-nav .active a:focus {
	color: #fff;
	text-shadow: 0 0 4px rgba(255,255,255,0.2);
	background: transparent !important;
}
.navbar .navbar-nav .user-action {
	padding: 9px 15px;
	font-size: 15px;
}
.navbar .navbar-toggle {
	border-color: #fff;
}
.navbar .navbar-toggle .icon-bar {
	background: #fff;
}
.navbar .navbar-toggle:focus, .navbar .navbar-toggle:hover {
	background: transparent;
}
.navbar .navbar-nav .open .dropdown-menu {
	background: #faf7fd;
	border-radius: 1px;
	border-color: #faf7fd;
	box-shadow: 0 2px 8px rgba(0,0,0,.05);
}
.navbar .divider {
	background-color: #e9ecef !important;
}
@media (min-width: 1200px){
	.form-inline .input-group {
		width: 350px;
		margin-left: 30px;
	}
}
@media (max-width: 1199px){
	.navbar .navbar-nav > a > i {
		display: inline-block;			
		text-align: left;
		min-width: 30px;
		position: relative;
		top: 4px;
	}
	.navbar .navbar-collapse {
		border: none;
		box-shadow: none;
		padding: 0;
	}
	.navbar .navbar-form {
		border: none;			
		display: block;
		margin: 10px 0;
		padding: 0;
	}
	.navbar .navbar-nav {
		margin: 8px 0;
	}
	.navbar .navbar-toggle {
		margin-right: 0;
	}
	.input-group {
		width: 100%;
	}
}


.nav-link ul li a:hover, ul li a:focus {
color:#ff0;
	border:1px solid #f40;
	background-color:#f40;

}






</style>



<!------------------------------------------------------내비바------------------------------------------------------>


</head> 
<body>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark" style="background: linear-gradient( to right, #EB008B, #00E7D6 ) !important;">
	 		
	<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
		<span class="navbar-toggler-icon"></span>
	</button>
	<!-- Collection of nav links, forms, and other content for toggling -->
	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">		
		<form class="navbar-form form-inline">
											
				 <a href="${contextPath}/index/index.jsp" class="dropdown-item" style="font-size: 15px; color: #fff; padding-top: 10px;"><b>2 ticket</b></a>
			
			</div>
		</form>
		<div class="navbar-nav ml-auto">
			
			<div class="nav-item dropdown">
				<a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle user-action" style="color: #000;"><img src="https://www.tutorialrepublic.com/examples/images/avatar/3.jpg" class="avatar" alt="Avatar" style="border-radius: 50%;
	width: 36px;
	height: 36px;
	margin-right: 10px;"> Antonio Moreno <b class="caret"></b></a>
				<div class="dropdown-menu">
				<c:if test="${id != null}">
					<a href="${contextPath}/mycon/mypageForm.do" class="dropdown-item"><i class="fa fa-user-o"></i> 마이페이지</a>
				</c:if>
				<c:if test="${id == null}">
					<a href="${contextPath}/member/login.do" class="dropdown-item"><i class="fa fa-calendar-o"></i> 로그인</a>
					<a href="${contextPath}/member/join.do" class="dropdown-item"><i class="fa fa-sliders"></i> 회원가입</a>
				</c:if>
				<c:if test="${id != null}">
					<c:if test="${is_admin == 1}">
						<a href="${contextPath}/admin/adminPage.do" class="dropdown-item"><i class="fa fa-gears"></i>관리자 페이지</a>
					</c:if>
					<a href="${contextPath}/Order/cartList.do" class="dropdown-item"><i class="fa fa-briefcase"></i>장바구니</a>
					<div class="divider dropdown-divider"></div>
					<a href="${contextPath}/member/logout.do" class="dropdown-item"><i class="material-icons" style="min-width: 100px !important;">&#xE8AC;</i> 로그아웃</a>
				</c:if>
				</div>
			</div>
		</div>
	</div>
</nav>


<!-------------------------------------------------------- 내비바 끝 ---------------------------------------------------------------->
  	
  	
  	
  	
  	
  	
<!--------------------------------------------------- 메뉴바 ------------------------------------------------------->
  	
  	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="background-color: #FFF !important;">
  		<div class="container" >
  			<div class="row m-auto">
  				<div class="col-12 w-100 text-center"z>
  					<!-- <a class="navbar-brand w-100" href="index.jsp" style="float: left; margin-left: -400px;" >Ticketing</a> -->
  					<a class="navbar-brand w-100" href="${contextPath}" style="float: left; margin-left: 40px; margin-top: 20px;" ><img src="${contextPath}/images/tclogo.png"" alt="tlogo" style=" max-width: 90px;"></a> 
 			
			      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			        <span class="oi oi-menu"></span> Menu
			      </button>
  				</div>
		  				
  				<div class="col-20 w-140 text-center" style="margin-top: -100px;">
  					<div class="collapse navbar-collapse" id="ftco-nav">
			        <ul class="navbar-nav m-auto">
			          <li class="nav-item"><a href="${contextPath}" class="nav-link" style="font-size: 20px; font-family:나눔고딕; margin: 83px 10px 0 50px;" >메인</a></li>
			          <li class="nav-item"><a href="${contextPath}/Proser/imcontact.do" class="nav-link" style="font-size: 20px; font-family:나눔고딕; margin: 83px 10px 0 50px;">공연&상품 페이지</a></li>
			          <li class="nav-item"><a href="#" class="nav-link" style="font-size: 20px; font-family:나눔고딕; margin: 83px 10px 0 50px;">###</a></li>
			          <li class="nav-item"><a href="${contextPath}/ev/listEvent.do" class="nav-link" style="font-size: 20px; font-family:나눔고딕; margin: 83px 10px 0 50px;">이벤트</a></li>
			     <c:if test="${is_admin == 1}">     
			          <li class="nav-item"><a href="${contextPath}/admin/adminPage.do" class="nav-link" style="font-size: 20px; font-family:나눔고딕; margin: 83px 10px 0 50px;">관리자 페이지</a></li>
			     </c:if> 
			          <li class="nav-item"><a href="${contextPath}/blog.jsp" class="nav-link" style="font-size: 20px; font-family:나눔고딕; margin: 83px 10px 0 50px;">예매하기</a></li>
			          <li class="nav-item"><a href="${contextPath}/notice/listNotice.do" class="nav-link" style="font-size: 20px; font-family:나눔고딕; margin: 83px 10px 0 50px;">공지사항</a></li>
			     <c:if test="${id==null}">
			          <li class="nav-item"><a href="${contextPath}/member/login.do" class="nav-link" style="font-size: 20px; font-family:나눔고딕; margin: 83px 10px 0 50px;">로그인</a></li>
			     </c:if>   
			        </ul>
			      </div>
  				</div>
  			</div>
  		</div>
	  </nav>
    <!-- END nav -->
 <!-- Header END -->

