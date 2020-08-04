<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%--로그인유무 확인 --%>
<c:if test="${sessionScope.id == null}">
   <script>
      	alert("로그인 후 이용가능합니다.");
      	location.href="${contextPath}/member/login.do";
   </script>
</c:if>

<!DOCTYPE html>
<html>
  <head>
  
    <title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    
    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery(부트스트랩의 자바스크립트 플러그인을 위해 필요)-->
    <script src="http://code.jquery.com/jquery.js"></script> 
    <!-- 모든 합쳐진 플러그인을 포함하거나 필요한 파일을 포함 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Respond.js으로 IE8에서 반응형 기능활성화 -->
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    
    
    
    
    <!--  This file has been downloaded from https://bootdey.com  -->
    <!--  All snippets are MIT license https://bootdey.com/license -->
    <title>Bootdey.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
 
    <style type="text/css">
    
    
    
    
    
    
    
    	body{margin-top:20px;
background:#eee;
}

h2 {
    clear: both;
    font-size: 1.8em;
    margin-bottom: 10px;
    padding: 10px 0 10px 30px;
}

h3 > span {
    border-bottom: 2px solid #C2C2C2;
    display: inline-block;
    padding: 0 5px 5px;
}

/* USER PROFILE */
#user-profile h2 {
    padding-right: 15px;
}
#user-profile .profile-status {
	font-size: 0.75em;
	padding-left: 12px;
	margin-top: -10px;
	padding-bottom: 10px;
	color: #8dc859;
}
#user-profile .profile-status.offline {
	color: #fe635f;
}
#user-profile .profile-img {
	border: 1px solid #e1e1e1;
	padding: 4px;
	margin-top: 10px;
	margin-bottom: 10px;
}
#user-profile .profile-label {
	text-align: center;
	padding: 5px 0;
}
#user-profile .profile-label .label {
	padding: 5px 15px;
	font-size: 1em;
}
#user-profile .profile-stars {
	color: #FABA03;
	padding: 7px 0;
	text-align: center;
}
#user-profile .profile-stars > i {
	margin-left: -2px;
}
#user-profile .profile-since {
	text-align: center;
	margin-top: -5px;
}
#user-profile .profile-details {
	padding: 15px 0;
	border-top: 1px solid #e1e1e1;
	border-bottom: 1px solid #e1e1e1;
	margin: 15px 0;
}
#user-profile .profile-details ul {
	padding: 0;
	margin-top: 0;
	margin-bottom: 0;
	margin-left: 40px;
}
#user-profile .profile-details ul > li {
	margin: 3px 0;
	line-height: 1.5;
}
#user-profile .profile-details ul > li > i {
	padding-top: 2px;
}
#user-profile .profile-details ul > li > span {
	color: #34d1be;
}
#user-profile .profile-header {
	position: relative;
}
#user-profile .profile-header > h3 {
	margin-top: 10px
}
#user-profile .profile-header .edit-profile {
	margin-top: -6px;
	position: absolute;
	right: 0;
	top: 0;
}
#user-profile .profile-tabs {
	margin-top: 30px;
}
#user-profile .profile-user-info {
	padding-bottom: 20px;
}
#user-profile .profile-user-info .profile-user-details {
	position: relative;
	padding: 4px 0;
}
#user-profile .profile-user-info .profile-user-details .profile-user-details-label {
	width: 110px;
	float: left;
	bottom: 0;
	font-weight: bold;
	left: 0;
	position: absolute;
	text-align: right;
	top: 0;
	width: 110px;
	padding-top: 4px;
}
#user-profile .profile-user-info .profile-user-details .profile-user-details-value {
	margin-left: 120px;
}
#user-profile .profile-social li {
	padding: 4px 0;
}
#user-profile .profile-social li > i {
	padding-top: 6px;
}
@media only screen and (max-width: 767px) {
	#user-profile .profile-user-info .profile-user-details .profile-user-details-label {
		float: none;
		position: relative;
		text-align: left;
	}
	#user-profile .profile-user-info .profile-user-details .profile-user-details-value {
		margin-left: 0;
	}
	#user-profile .profile-social {
		margin-top: 20px;
	}
}
@media only screen and (max-width: 420px) {
	#user-profile .profile-header .edit-profile {
		display: block;
		position: relative;
		margin-bottom: 15px;
	}
	#user-profile .profile-message-btn .btn {
		display: block;
	}
}


.main-box {
    background: #FFFFFF;
/*     -webkit-box-shadow: 1px 1px 2px 0 #CCCCCC;
    -moz-box-shadow: 1px 1px 2px 0 #CCCCCC;
    -o-box-shadow: 1px 1px 2px 0 #CCCCCC;
    -ms-box-shadow: 1px 1px 2px 0 #CCCCCC;
    box-shadow: 1px 1px 2px 0 #CCCCCC; */
    margin-bottom: 16px;
    padding: 20px;
}
.main-box h2 {
    margin: 0 0 15px -20px;
    padding: 5px 0 5px 20px;
    border-left: 10px solid #c2c2c2; /*7e8c8d*/
}

.btn {
    border: none;
	padding: 6px 12px;
	border-bottom: 4px solid;
	-webkit-transition: border-color 0.1s ease-in-out 0s, background-color 0.1s ease-in-out 0s;
	transition: border-color 0.1s ease-in-out 0s, background-color 0.1s ease-in-out 0s;
	outline: none;
}
.btn-default,
.wizard-cancel,
.wizard-back {
	background-color: #7e8c8d;
	border-color: #626f70;
	color: #fff;
}
.btn-default:hover,
.btn-default:focus,
.btn-default:active,
.btn-default.active, 
.open .dropdown-toggle.btn-default,
.wizard-cancel:hover,
.wizard-cancel:focus,
.wizard-cancel:active,
.wizard-cancel.active,
.wizard-back:hover,
.wizard-back:focus,
.wizard-back:active,
.wizard-back.active {
	background-color: #949e9f;
	border-color: #748182;
	color: #fff;
}
.btn-default .caret {
	border-top-color: #FFFFFF;
}
.btn-info {
	background-color: #5daee7;
	border-color: #4c95c9;
}
.btn-info:hover,
.btn-info:focus,
.btn-info:active,
.btn-info.active, 
.open .dropdown-toggle.btn-info {
	background-color: #4c95c9;
	border-color: #3f80af;
}
.btn-link {
	border: none;
}
.btn-primary {
	background-color: #3fcfbb;
	border-color: #2fb2a0;
}
.btn-primary:hover,
.btn-primary:focus,
.btn-primary:active,
.btn-primary.active, 
.open .dropdown-toggle.btn-primary {
	background-color: #38c2af;
	border-color: #2aa493;
}
.btn-success {
	background-color: #8dc859;
	border-color: #77ab49;
}
.btn-success:hover,
.btn-success:focus,
.btn-success:active,
.btn-success.active, 
.open .dropdown-toggle.btn-success {
	background-color: #77ab49;
}
.btn-danger {
	background-color: #fe635f;
	border-color: #dd504c;
}
.btn-danger:hover,
.btn-danger:focus,
.btn-danger:active,
.btn-danger.active, 
.open .dropdown-toggle.btn-danger {
	background-color: #dd504c;
}
.btn-warning {
	background-color: #f1c40f;
	border-color: #d5ac08;
}
.btn-warning:hover,
.btn-warning:focus,
.btn-warning:active,
.btn-warning.active, 
.open .dropdown-toggle.btn-warning {
	background-color: #e0b50a;
	border-color: #bd9804;
}

.icon-box {
	
}
.icon-box .btn {
	border: 1px solid #e1e1e1;
	margin-left: 3px;
	margin-right: 0;
}
.icon-box .btn:hover {
	background-color: #eee;
	color: #2BB6A3;
}

a {
    color: #2bb6a3;
	outline: none !important;
}
a:hover,
a:focus {
	color: #2bb6a3;
}


/* TABLES */
.table {
    border-collapse: separate;
}
.table-hover > tbody > tr:hover > td,
.table-hover > tbody > tr:hover > th {
	background-color: #eee;
}
.table thead > tr > th {
	border-bottom: 1px solid #C2C2C2;
	padding-bottom: 0;
}
.table tbody > tr > td {
	font-size: 0.875em;
	background: #f5f5f5;
	border-top: 10px solid #fff;
	vertical-align: middle;
	padding: 12px 8px;
}
.table tbody > tr > td:first-child,
.table thead > tr > th:first-child {
	padding-left: 20px;
}
.table thead > tr > th span {
	border-bottom: 2px solid #C2C2C2;
	display: inline-block;
	padding: 0 5px;
	padding-bottom: 5px;
	font-weight: normal;
}
.table thead > tr > th > a span {
	color: #344644;
}
.table thead > tr > th > a span:after {
	content: "\f0dc";
	font-family: FontAwesome;
	font-style: normal;
	font-weight: normal;
	text-decoration: inherit;
	margin-left: 5px;
	font-size: 0.75em;
}
.table thead > tr > th > a.asc span:after {
	content: "\f0dd";
}
.table thead > tr > th > a.desc span:after {
	content: "\f0de";
}
.table thead > tr > th > a:hover span {
	text-decoration: none;
	color: #2bb6a3;
	border-color: #2bb6a3;
}
.table.table-hover tbody > tr > td {
	-webkit-transition: background-color 0.15s ease-in-out 0s;
	transition: background-color 0.15s ease-in-out 0s;
}
.table tbody tr td .call-type {
	display: block;
	font-size: 0.75em;
	text-align: center;
}
.table tbody tr td .first-line {
	line-height: 1.5;
	font-weight: 400;
	font-size: 1.125em;
}
.table tbody tr td .first-line span {
	font-size: 0.875em;
	color: #969696;
	font-weight: 300;
}
.table tbody tr td .second-line {
	font-size: 0.875em;
	line-height: 1.2;
}
.table a.table-link {
	margin: 0 5px;
	font-size: 1.125em;
}
.table a.table-link:hover {
	text-decoration: none;
	color: #2aa493;
}
.table a.table-link.danger {
	color: #fe635f;
}
.table a.table-link.danger:hover {
	color: #dd504c;
}

.table-products tbody > tr > td {
	background: none;
	border: none;
	border-bottom: 1px solid #ebebeb;
	-webkit-transition: background-color 0.15s ease-in-out 0s;
	transition: background-color 0.15s ease-in-out 0s;
	position: relative;
}
.table-products tbody > tr:hover > td {
	text-decoration: none;
	background-color: #f6f6f6;
}
.table-products .name {
	display: block;
	font-weight: 600;
	padding-bottom: 7px;
}
.table-products .price {
	display: block;
	text-decoration: none;
	width: 50%;
	float: left;
	font-size: 0.875em;
}
.table-products .price > i {
	color: #8dc859;
}
.table-products .warranty {
	display: block;
	text-decoration: none;
	width: 50%;
	float: left;
	font-size: 0.875em;
}
.table-products .warranty > i {
	color: #f1c40f;
}
.table tbody > tr.table-line-fb > td {
	background-color: #9daccb;
	color: #262525;
}
.table tbody > tr.table-line-twitter > td {
	background-color: #9fccff;
	color: #262525;
}
.table tbody > tr.table-line-plus > td {
	background-color: #eea59c;
	color: #262525;
}
.table-stats .status-social-icon {
	font-size: 1.9em;
	vertical-align: bottom;
}
.table-stats .table-line-fb .status-social-icon {
	color: #556484;
}
.table-stats .table-line-twitter .status-social-icon {
	color: #5885b8;
}
.table-stats .table-line-plus .status-social-icon {
	color: #a75d54;
}

.daterange-filter {
	background: none repeat scroll 0 0 #FFFFFF;
	border: 1px solid #CCCCCC;
	cursor: pointer;
	padding: 5px 10px;
}
.filter-block .form-group {
	margin-right: 10px;
	position: relative;
}
.filter-block .form-group .form-control {
	height: 36px;
}
.filter-block .form-group .search-icon {
	position: absolute;
	color: #707070;
	right: 8px;
	top: 11px;
}
.filter-block .btn {
	margin-left: 5px;
}
@media only screen and (max-width: 440px) {
	.filter-block {
		float: none !important;
		clear: both
	}
	.filter-block .form-group {
		float: none !important;
		margin-right: 0;
	}
	.filter-block .btn {
		display: block;
		float: none !important;
		margin-bottom: 15px;
		margin-left: 0;
	}
	#reportrange {
		clear: both;
		float: none !important;
		margin-bottom: 15px;
	}
}


.tabs-wrapper .tab-content {
    margin-bottom: 20px;
    padding: 0 10px;
}

/* RECENT - USERS */
.widget-users {
    list-style: none;
	margin: 0;
	padding: 0;
}
.widget-users li {
	border-bottom: 1px solid #ebebeb;
	padding: 15px 0;
	height: 96px;
}
.widget-users li > .img {
	float: left;
	margin-top: 8px;
	width: 50px;
	height: 50px;
	overflow: hidden;
	border-radius: 50%;
}
.widget-users li > .details {
	margin-left: 60px;
}
.widget-users li > .details > .name {
	font-weight: 600;
}
.widget-users li > .details > .name > a {
	color: #344644;
}
.widget-users li > .details > .name > a:hover {
	color: #2bb6a3;
}
.widget-users li > .details > .time {
	color: #2bb6a3;
	font-size: 0.75em;
	padding-bottom: 7px;
}
.widget-users li > .details > .time.online {
	color: #8dc859;
}


/* CONVERSATION */
.conversation-inner {
    padding: 0 0 5px 0;
	margin-right: 10px;
}
.conversation-item {
	padding: 5px 0;
	position: relative;
}
.conversation-user {
	width: 50px;
	height: 50px;
	overflow: hidden;
	float: left;
	border-radius: 50%;
	margin-top: 6px;
}
.conversation-body {
	background: #f5f5f5;
	font-size: 0.875em;
	width: auto;
	margin-left: 60px;
	padding: 8px 10px;
	position: relative;
}
.conversation-body:before {
	border-color: transparent #f5f5f5 transparent transparent;
	border-style: solid;
	border-width: 6px;
	content: "";
	cursor: pointer;
	left: -12px;
	position: absolute;
	top: 25px;
}
.conversation-item.item-right .conversation-body {
	background: #dcfffa;
}
.conversation-item.item-right .conversation-body:before {
	border-color: transparent transparent transparent #dcfffa;
	left: auto;
	right: -12px;
}
.conversation-item.item-right .conversation-user {
	float: right;
}
.conversation-item.item-right .conversation-body {
	margin-left: 0;
	margin-right: 60px;
}
.conversation-body > .name {
	font-weight: 600;
	font-size: 1.125em;
}
.conversation-body > .time {
	position: absolute;
	font-size: 0.875em;
	right: 10px;
	top: 0;
	margin-top: 10px;
	color: #605f5f;
	font-weight: 300;
}
.conversation-body > .time:before {
	content: "\f017";
	font-family: FontAwesome;
	font-style: normal;
	font-weight: normal;
	text-decoration: inherit;
	margin-top: 4px;
	font-size: 0.875em;
}
.conversation-body > .text {
	padding-top: 6px;
}
.conversation-new-message {
	padding-top: 10px;
}

textarea.form-control {
    height: auto;
}
.form-control {
    border-radius: 0px;
    border-color: #e1e1e1;
    box-shadow: none;
    -webkit-box-shadow: none;
}

    </style>
<jsp:include page="../include/header.jsp" />    
</head>
<body>


<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container bootstrap snippets">
    <div class="row" id="user-profile">
  
        <div class="col-lg-3 col-md-4 col-sm-4" >
        
        
            <div class="main-box clearfix"  style="margin-left: 80px;">
                <h2>My Page </h2>
                <div class="profile-status">
                    <i class="fa fa-check-circle"></i> Online
                </div>
                
                <c:choose>    	
			    	 <c:when test="${!empty profile_img }">

				       <img src="${contextPath}/upload/${user.profile_img}" alt="프로필 이미지" class="profile-img img-responsive center-block" style="max-width: 200px;">
			    	 </c:when>
			   		 <c:when test="${empty profile_img}">
						<img src="${contextPath}/images/icon.png" class="profile-img img-responsive center-block" style="max-width: 200px;">
			  		 </c:when>
			   </c:choose>
                <div class="profile-label">
                    <span class="label label-danger">Admin</span>
                </div>

                <div class="profile-since">
                    Member since: <br>
                    <fmt:formatDate value="${user.reg_date}" pattern="yyyy-MM-dd" />
                    
                </div>

                <div class="profile-details" style="width:230px;">
                    <ul class="fa-ul">
                        <li><i class="fa-li fa fa-truck"></i><a href="${contextPath}/member/address.do">배송지 관리</a></li>
                        <li><i class="fa-li fa fa-comment"></i>좋아요 리스트: <span><a href="${contextPath}/mycon/likelistForm.do">${requestScope.likeCount}</a></span></li>
                        <li><i class="fa-li fa fa-briefcase"></i>장바구니: <span><a href="${contextPath}/Order/cartList.do?id=${sessionScope.id}">${sessionScope.cartCount}</a></span></li>
                        <li><i class="fa-li fa fa-gears"></i>결제내역: <span><a href="${contextPath}/Order/payList.do?id=${sessionScope.id}">${requestScope.payCount}</a></span></li>
                    	<li><i class="fa-li fa fa-gears"></i><a href="${contextPath}/mycon/addpointForm.do">포인트충전</a></li>
                    </ul>
                </div>

                
            </div>
        </div>

        <div class="col-lg-9 col-md-8 col-sm-8" style="position: relative; top: 150px; left: 100px;">
            <div class="main-box clearfix">
            		<c:if test="${user.n_status == 1}">
                    
                                                            네이버 로그인시 초기비밀번호는 "ID + 1234" 입니다.
                          
                                ${user.id}+1234
                   
         </c:if>
                <div class="profile-header">
                    <h3><span>User Info</span></h3>
                </div>
				
                <div class="row profile-user-info">
                    <div class="col-sm-8">
                    
                        <div class="profile-user-details clearfix">
                            <div class="profile-user-details-label">
                                                                        이름
                            </div>
                        <c:if test="${!empty user.name}">
                        	<div class="profile-user-details-value">
                                ${user.name}
                            </div>
                        </c:if>
                        <c:if test="${empty user.name}">
                        	<div class="profile-user-details-value">
                                해당 정보가 없습니다.
                            </div>
                        </c:if>    
                        </div>


				<div class="profile-user-details clearfix">
				   <div class="profile-user-details-label">
				 ID
				   </div>
				   <c:if test="${!empty user.id}">
				   <div class="profile-user-details-value">
				                       ${user.id}
				   </div>
				   </c:if>
				   <c:if test="${empty user.id}">
				   <div class="profile-user-details-value">
				                       해당 정보가 없습니다.
				   </div>
				   </c:if>
				 </div>
                        <div class="profile-user-details clearfix">
                            <div class="profile-user-details-label">
                                주소
                            </div>
                            <c:if test="${!empty user.zipcode}">
                            <div class="profile-user-details-value">
                                ${user.zipcode}&nbsp;&nbsp;&nbsp;${user.address1}
                                <br> ${user.address2}
                            </div>
                            </c:if>
                            <c:if test="${empty user.zipcode}">
                            <div class="profile-user-details-value">
                                해당 정보가 없습니다.
                            </div>
                            </c:if>
                        </div>
                        
                        <div class="profile-user-details clearfix">
                            <div class="profile-user-details-label">
                                Email
                            </div>
                            <c:if test="${!empty user.email}">
                            <div class="profile-user-details-value">
                                ${user.email}
                            </div>
                            </c:if>
                            <c:if test="${empty user.email}">
                            <div class="profile-user-details-value">
                                해당 정보가 없습니다.
                            </div>
                            </c:if>
                        </div>
                        
                        <div class="profile-user-details clearfix">
                            <div class="profile-user-details-label">
                                전화번호
                            </div>
                            <c:if test="${!empty user.phone }">
                            <div class="profile-user-details-value">
                                ${user.phone}
                            </div>
                            </c:if>
                            <c:if test="${empty user.phone }">
                            <div class="profile-user-details-value">
                                해당 정보가 없습니다.
                            </div>
                            </c:if>
                        </div>
                        
                            <div class="profile-user-details clearfix">
                            <div class="profile-user-details-label">
                               이용상태
                            </div>
                            <div class="profile-user-details-value">
                                <c:choose>
                                	<c:when test="${user.status == 1}">
                                		<font color="green" >정상회원</font>
                                	</c:when>
                                	<c:otherwise>
                                		<font color="red" >비정상상태</font>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        
                        
                            <div class="profile-user-details clearfix">
                            <div class="profile-user-details-label">
                                포인트
                            </div>
                            <c:if test="${!empty user.point}">
                            <div class="profile-user-details-value">
                                ${user.point}
                            </div>
                            </c:if>
                            <c:if test="${empty user.point}">
                            <div class="profile-user-details-value">
                                해당 정보가 없습니다.
                            </div>
                            </c:if>
                        </div>
                        
                        
                        
                        
                    </div>
                    
                    
                    <div class="col-sm-4 profile-social">
                        <ul class="fa-ul">
                            <li><i class="fa-li fa fa-twitter-square"></i><a href="https://twitter.com/login?lang=ko" style="color: #A9FF7F"><b>twitter</b></a></li>
                            <li><i class="fa-li fa fa-linkedin-square"></i><a href="https://kr.linkedin.com/" style="color: #00E7D6"><b>linkedin</b> </a></li>
                            <li><i class="fa-li fa fa-facebook-square"></i><a href="https://www.facebook.com/campaign/landing.php?campaign_id=1662308817&extra_1=s%7Cc%7C340043532225%7Cb%7C%ED%8E%98%EB%B8%8D%7C&placement=&creative=340043532225&keyword=%ED%8E%98%EB%B8%8D&partner_id=googlesem&extra_2=campaignid%3D1662308817%26adgroupid%3D69637362888%26matchtype%3Db%26network%3Dg%26source%3Dnotmobile%26search_or_content%3Ds%26device%3Dc%26devicemodel%3D%26adposition%3D%26target%3D%26targetid%3Dkwd-314394716846%26loc_physical_ms%3D1009866%26loc_interest_ms%3D%26feeditemid%3D%26param1%3D%26param2%3D&gclid=CjwKCAjwr7X4BRA4EiwAUXjbt-10H8V1WWGDuoe24gpUVSiKl4aQDE91MDhtG_-O9SHZPV6t5jbWahoCfaQQAvD_BwE" style="color: #EB008B"><b>facebook</b> </a></li>
                            
                            <li><i class="fa-li fa fa-instagram"></i><a href="https://www.instagram.com/accounts/login/?hl=ko" style="color: #000"><b>instagram</b></a></li>
                        </ul>
                    </div>
                </div>
<div class="profile-message-btn center-block text-center" style="position: relative; left: 150px; ">
                    <a href="${contextPath}/member/pwCheckForm.do" class="btn btn-success" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important;">
                        <i class="fa fa-pencil-square fa-lg"></i> 정보 수정
                    </a>
                </div>
               <br><br><br><br><br><br><br><br><br><br>
    </div>
</div>

<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>