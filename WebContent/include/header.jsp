<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSTL 사용을 위해 선언 -->    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- <link href="//fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet" type="text/css">


  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+ER" rel="stylesheet">


    <link href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet"> -->
    
<!--     <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet"> -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">

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
/* 	font-family: 'Varela Round', sans-serif; */
/* 	font-family: 'Noto Sans KR', sans-serif; */
	font-family: 'Nanum Gothic Coding', monospace;
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
	font-size: 12px;
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
	font-size: 12px;
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
</style>



<!------------------------------------------------------내비바------------------------------------------------------>


</head> 
<body>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark" style="background: linear-gradient( to right, #EB008B, #00E7D6 ) !important; height: 55px;">
	 		
	<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
		<span class="navbar-toggler-icon"></span>
	</button>
	<!-- Collection of nav links, forms, and other content for toggling -->
	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">		
		<form class="navbar-form form-inline">
											
				 <a href="${contextPath}/index/index.jsp" class="dropdown-item" style="font-size: 15px; color: #fff; padding-top: 10px;"><b>2 ticket</b></a>
			
			</div>
		</form>
		
<!-- 드랍메뉴 -->	

<!-- 로그인상태라면 -->
<c:choose>
<c:when test="${id!=null}"> 

<div class="navbar-nav ml-auto">
	
	<div class="nav-item dropdown" style="margin-right: 0;">
		
		<a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle user-action" style="color: #000; font-size: 12px !important; margin-right: 0;">
		
		<!-- 프사 없으면 기본 있으면 내가 정한 사진으로 -->
		<c:choose>    	
    	 <c:when test="${!empty profile_img }">
	       <img src="${contextPath}/upload/${profile_img}" 
			 class="avatar" alt="Avatar" style="border-radius: 50%; width: 36px; height: 36px; margin-right: 10px;"> 
    	 </c:when>
     
   		 <c:when test="${empty profile_img}">
			<img src="${contextPath}/images/icon.png" 
			 class="avatar" alt="Avatar" style="border-radius: 50%; width: 36px; height: 36px; margin-right: 10px;">
  		 </c:when>
  		 </c:choose>

		${id}님 로그인중..
		<c:if test="${is_admin == 1}">	<!-- 관리자모드이면 -->
		<b class="caret"></b></a>
		<div class="dropdown-menu">
			<a href="${contextPath}/mycon/mypageForm.do" class="dropdown-item" style="font-size: 12px;"><i class="fa fa-user-o"></i> 마이페이지</a>
			<a href="${contextPath}/admin/adminPage.do" class="dropdown-item" style="font-size: 12px;"><i class="fa fa-gears"></i>관리자 페이지</a>
			<div class="divider dropdown-divider"></div>
			<a href="${contextPath}/member/logout.do" class="dropdown-item" style="font-size: 12px;"><i class="material-icons" style="min-width: 100px !important;">&#xE8AC;</i> 로그아웃</a>
		</div>
		</c:if>
		
		<c:if test="${is_admin != 1}">	<!-- 일반회원이면 -->
		<b class="caret"></b></a>
		<div class="dropdown-menu">
			<a href="${contextPath}/mycon/mypageForm.do" class="dropdown-item" style="font-size: 12px;"><i class="fa fa-user-o"></i> 마이페이지</a>
 			<a href="${contextPath}/member/updateProfile.do" class="dropdown-item"><i class="fa fa-calendar-o"></i>프로필변경</a>
 			<a href="${contextPath}/Order/cartList.do?id=${sessionScope.id}" class="dropdown-item"><i class="fa fa-briefcase"></i>장바구니</a>
			<div class="divider dropdown-divider"></div>
			<a href="${contextPath}/member/logout.do" class="dropdown-item" style="font-size: 12px;"><i class="material-icons" style="min-width: 100px !important;">&#xE8AC;</i> 로그아웃</a>
		</div>
		</c:if>
		
	</div>
</div>
	</div>
</nav>

  </c:when>  
  

  <c:otherwise> 
  
  <!-- 로그인 안한 상태라면 -->
  <div class="navbar-nav ml-auto"> 
	<div style="display: contents;">
	<a href="${contextPath}/member/login.do" class="dropdown-item" style="font-size: 12px;"><i class="fa fa-calendar-o"></i> 로그인</a>
	<a href="${contextPath}/member/join.do" class="dropdown-item" style="font-size: 12px;"><i class="fa fa-sliders"></i> 회원가입</a>
	</div>
  </div>
</nav>
  </c:otherwise>
 </c:choose>


<!-------------------------------------------------------- 내비바 끝 ---------------------------------------------------------------->
  	
  	
  	
  	
  	
  	
<!--------------------------------------------------- 메뉴바 ------------------------------------------------------->
  	
  	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  		<div class="container" >
  			<div class="row m-auto">
  				<div class="col-12 w-100 text-center">
  					<!-- <a class="navbar-brand w-100" href="index.jsp" style="float: left; margin-left: -400px;" >Ticketing</a> -->
  					<a class="navbar-brand w-100" href="${contextPath}" style="float: left; margin-left: 30px; margin-top: 20px;" ><img src="${contextPath}/images/tclogo.png"" alt="tlogo" style=" max-width: 90px;"></a> 
  					
  					
  					
 				


  					
			      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			        <span class="oi oi-menu"></span> Menu
			      </button>
  				</div>

  				  				
  				<!-- 회원가입o, 로그인 페이지o -->
  				<div class="col-20 w-140 text-center" style="margin-top: -100px;">
  					<div class="collapse navbar-collapse" id="ftco-nav">
			        <ul class="navbar-nav m-auto" >

			          <li class="nav-item" style="margin-right: 0;"><a href="${contextPath}/Proser/imcontact.do" class="nav-link" style="font-size: 21px; font-family:나눔고딕; margin: 83px 10px 0 50px;">콘서트</a></li>

			          <li class="nav-item" style="margin-right: 0;"><a href="#" class="nav-link" style="font-size: 21px; font-family:나눔고딕; margin: 83px 10px 0 10px;">뮤지컬/연극</a></li>
			         
			          <li class="nav-item" style="margin-right: 0;"><a href="#" class="nav-link" style="font-size: 21px; font-family:나눔고딕; margin: 83px 10px 0 10px;">클래식</a></li>

					  <li class="nav-item" style="margin-right: 0;"><a href="${contextPath}/main/news.do" class="nav-link" style="font-size: 21px; font-family:나눔고딕; margin: 83px 10px 0 10px;">공연/전시소식</a></li>
					  
			          <li class="nav-item" style="margin-right: 0;"><a href="${contextPath}/ev/listEvent.do" class="nav-link" style="font-size: 21px; font-family:나눔고딕; margin: 83px 10px 0 10px;">이벤트/쿠폰</a></li>
<%-- 			     <c:if test="${id==null}"> --%>
			          <li class="nav-item" style="margin-right: 0;"><a href="${contextPath}/btboard/bestList.do" class="nav-link" style="font-size: 21px; font-family:나눔고딕; margin: 83px 10px 0 10px;">랭킹</a></li>
<%-- 			     </c:if> --%>  
					  <li class="nav-item" style="margin-right: 0;"><a href="${contextPath}/notice/listNotice.do" class="nav-link" style="font-size: 21px; font-family:나눔고딕; margin: 83px 10px 0 10px;">고객센터</a></li>
			        </ul>
			      </div>
  				</div>
  			</div>
  		</div>
	  </nav>
    <!-- END nav -->
 <!-- Header END -->