<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSTL 사용을 위해 선언 -->    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script>
var tid;
var cnt = parseInt(30);//초기값(초단위)
function counter_init() {
	tid = setInterval("counter_run()", 1000);
}

function counter_reset() {
	clearInterval(tid);
	cnt = parseInt(300);
	counter_init();
}
 

function counter_run() {
	document.all.counter.innerText = time_format(cnt);
	cnt--;
	if(cnt < 0) {
		clearInterval(tid);
		location.href = "${contextPath}/member/logout.do";
	}
}
function time_format(s) {
	var nHour=0;
	var nMin=0;
	var nSec=0;
	if(s>0) {
		nMin = parseInt(s/60);
		nSec = s%60;

		if(nMin>60) {
			nHour = parseInt(nMin/60);
			nMin = nMin%60;
		}
	} 
	if(nSec<10) nSec = "0"+nSec;
	if(nMin<10) nMin = "0"+nMin;

	return ""+nHour+":"+nMin+":"+nSec;
}

</script>


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
  	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  		<div class="container">
  			<div class="row m-auto">
<!--   				<div class="col-12 w-100 text-center"> -->
<!--   					<a class="navbar-brand w-100" href="index.jsp">Meditative</a> -->
<!-- 			      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation"> -->
<!-- 			        <span class="oi oi-menu"></span> Menu -->
<!-- 			      </button> -->
<!--   				</div> -->
  				
<%--   				<c:if test="${id!=null}"> --%>
<%--   					${id}님 로그인중..  <span id="counter"> </span> 후 자동로그아웃 <input type="button" class="btn btn-primary" value="연장" onclick="counter_reset()"> --%>
<%--   				</c:if> --%>
  				
  		<!-- START 모달창 -->
<!--       	<div class="modal fade" id="defaultModal"> -->
<!--       		<div class="modal-dialog"> -->
<!--       			<div class="modal-content"> -->
<!--       				<div class="modal-header"> -->
<!--       				<h4 class="modal-title" style="align: left;">알림</h4> -->
<!--       					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>      					 -->
<!--       				</div> -->
<!--       				<div class="modal-body"> -->
<!--       					<p class="modal-contents"></p> -->
<!--       				</div> -->
<!--       				<div class="modal-footer"> -->
<!--       					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button> -->
<!--       				</div> -->
<!--       			</div>   /.modal-content -->
<!--       		</div>		/.modal-dialog -->
<!--       	</div>	/.modal -->
      	<!-- END 모달창 -->
  				
  				
<!--   				<div class="col-12 w-100 text-center"> -->
<!--   					<div class="collapse navbar-collapse" id="ftco-nav"> -->
<!-- 			        <ul class="navbar-nav m-auto"> -->
<!-- 			          <li class="nav-item active"><a href="index.jsp" class="nav-link">Home</a></li> -->
<%-- 			          <li class="nav-item"><a href="${contextPath}/about.jsp" class="nav-link">About</a></li> --%>
<%-- 			          <li class="nav-item"><a href="${contextPath}/trainer.jsp" class="nav-link">Trainer</a></li> --%>
<%-- 			          <li class="nav-item"><a href="${contextPath}/classes.jsp" class="nav-link">Classes</a></li> --%>
<%-- 			          <li class="nav-item"><a href="${contextPath}/schedule.jsp" class="nav-link">Schedule</a></li> --%>
<%-- 			          <li class="nav-item"><a href="${contextPath}/blog.jsp" class="nav-link">Blog</a></li> --%>
<%-- 			          <li class="nav-item"><a href="${contextPath}/contact.jsp" class="nav-link">Contact</a></li> --%>
<%-- 			     <c:if test="${id==null}"> --%>
<%-- 			          <li class="nav-item"><a href="${contextPath}/member/login.do" class="nav-link">로그인</a></li> --%>
<%-- 			          <li class="nav-item"><a href="${contextPath}/member/join.do" class="nav-link">회원가입</a></li> --%>
<%-- 			     </c:if> --%>
<%-- 			     <c:if test="${id!=null}"> --%>
<%-- 			     	  <li class="nav-item"><a href="${contextPath}/member/pwCheckForm.do" class="nav-link">마이페이지</a></li> --%>
<%-- 			          <li class="nav-item"><a href="${contextPath}/member/logout.do" class="nav-link">로그아웃</a></li> --%>
<%-- 			     </c:if> --%>
<%-- 			     <c:if test="${id=='admin'}"> --%>
<%-- 			     	  <li class="nav-item"><a href="${contextPath}/admin/adminPage.do" class="nav-link">관리자 페이지</a></li> --%>
<%-- 			     </c:if>    --%>
<!-- 			        </ul> -->
<!-- 			      </div> -->
<!--   				</div> -->
  			</div>
  		</div>
	  </nav>
    <!-- END nav -->
 <!-- Header END -->