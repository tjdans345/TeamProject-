<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

    <!-- 회원 관리 페이지 -->
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Ready Bootstrap Dashboard</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="${contextPath}/admins/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="${contextPath}/admins/assets/css/ready.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/demo.css">
	
	<style type="text/css">
	
	a { text-decoration:none !important } 
	a:hover { text-decoration:none !important }
	
	
	</style>
	
	
	
	<script type="text/javascript">
	

	function URL1(input){
		
// 		var z = document.getElementById("te7");
// 		  if (z.style.display === "none") {
// 			  alert("와쓰");
// 		    z.style.display = "block";
// 		  } else {
// 		    z.style.display = "none";
// 		  }
		  
// 		  var z2 = document.getElementById("sun");
// 		  if (z2.style.display === "none") {
// 		    z2.style.display = "block";
// 		  } else {
// 		    z2.style.display = "none";
// 		  }  
		
// 		  var z1 = document.getElementById("te8");
// 		  if (z1.style.display === "none") {
// 			  alert("와쓰");
// 		    z1.style.display = "block";
// 		  } else {
// 		    z1.style.display = "none";
// 		  }
		  
// 		  var z3 = document.getElementById("del");
// 		  if (z3.style.display === "none") {
// 		    z3.style.display = "block";
// 		  } else {
// 		    z3.style.display = "none";
 		  }    
		  
		  function cha(t) {
			  
			  
			  if(t == 1) {
				  
				  document.getElementById("pro1").style.display = "";
				  document.getElementById("det").style.display = "none";	 
				  
			    
			  } else {
				  
				  document.getElementById("pro1").style.display = "none";
				  document.getElementById("det").style.display = "";	 
				  
			  }
			  
			  
			  
			  
			  
// 			  if(ch == 1 ) {
				
				  
// 				  alert("왔으");
// 				  var z = document.getElementById("pro1");
// 				  if (z.style.display === "none") {
// 				    z.style.display = "block";
// 				  } else {
// 				    z.style.display = "none";
// 				  }
				  
// 				  var x = document.getElementById("det");
// 				  if (x.style.display === "none") {
// 				    x.style.display = "block";
// 				  } else {
// 				    x.style.display = "none";
// 				  }
// 			  }
// 			  else if(ch == 2) {
				  
// 				  alert("왔으");
// 				  var z = document.getElementById("pro1");
// 				  if (z.style.display === "none") {
// 				    z.style.display = "block";
// 				  } else {
// 				    z.style.display = "none";
// 				  }
// 				  var x = document.getElementById("det");
// 				  if (x.style.display === "none") {
// 				    x.style.display = "block";
// 				  } else {
// 				    x.style.display = "none";
// 				  }
				  
// 			  }
		}
		  
	
	
	
	</script>
	
	
	
	
	
</head>
<body>

<jsp:include page="./include/top_navi.jsp" />

			
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid" style="width: 70%;">
						
						<label style="font-size: 15px !important;">상품 정보 선택</label><br/>
											<label class="form-radio-label" style="font-size: 15px !important;">
												<input class="form-radio-input" type="radio" name="optionsRadios" value=""  checked="" onclick="cha(1)">
												<span class="form-radio-sign">상품 정보</span>
											</label>
											<label class="form-radio-label ml-3" style="font-size: 15px !important;">
												<input class="form-radio-input" type="radio" name="optionsRadios" value="" onclick="cha(2)">
												<span class="form-radio-sign">상품 상세 정보</span>
											</label>
						
						<form action="${contextPath}/admin/AwritePro.do" enctype="multipart/form-data" method="post">
						<table class="table table-bordered table-head-bg-info table-bordered-bd-info mt-4" id="pro1">
											<thead>
												<tr align="center">
													<th scope="col" colspan="4"><b>콘서트 상품 등록</b></th>
												</tr>
											</thead>
											<tbody>
												<tr align="center">
													<td style="width: 15%"><b>콘서트명</b></td>
													<td colspan="3">
													<input type="text" name="name" class="form-control" id="email" placeholder="콘서트명" style="width: 75%" value="${bean.name}">
													</td>
												</tr>
												<tr align="center">
													<td><b>장르</b></td>
													<td style="width: 15%">
													<c:if test="${bean.genre == '트로트' }">
													<select class="form-control input-fixed" id="notify_state" name="genre">
														<option value="아이돌">아이돌</option>
														<option value="트로트" selected="selected">트로트</option>
														<option value="힙합">힙합</option>
														<option value="락">락</option>
														<option value="발라드">발라드</option>
														<option value="재즈">재즈</option>
													</select>
													</c:if>
													<c:if test="${bean.genre == '재즈' }">
													<select class="form-control input-fixed" id="notify_state" name="genre">
														<option value="트로트">트로트</option>
														<option value="힙합">힙합</option>
														<option value="락">락</option>
														<option value="발라드">발라드</option>
														<option value="아이돌">아이돌</option>
														<option value="재즈" selected="selected">재즈</option>
													</select>
													</c:if>
													<c:if test="${bean.genre == '힙합' }">
													<select class="form-control input-fixed" id="notify_state" name="genre">
														<option value="트로트">트로트</option>
														<option value="힙합" selected="selected">힙합</option>
														<option value="락">락</option>
														<option value="발라드">발라드</option>
														<option value="국악">국악</option>
														<option value="재즈">재즈</option>
													</select>
													</c:if>
													<c:if test="${bean.genre == '락' }">
													<select class="form-control input-fixed" id="notify_state" name="genre">
														<option value="트로트">트로트</option>
														<option value="힙합">힙합</option>
														<option value="락" selected="selected">락</option>
														<option value="발라드">발라드</option>
														<option value="아이돌">아이돌</option>
														<option value="재즈">재즈</option>
													</select>
													</c:if>
													<c:if test="${bean.genre == '발라드' }">
													<select class="form-control input-fixed" id="notify_state" name="genre">
														<option value="트로트">트로트</option>
														<option value="힙합">힙합</option>
														<option value="락">락</option>
														<option value="발라드" selected="selected">발라드</option>
														<option value="아이돌">아이돌</option>
														<option value="재즈">재즈</option>
													</select>
													</c:if>
													<c:if test="${bean.genre == '아이돌' }">
													<select class="form-control input-fixed" id="notify_state" name="genre">
														<option value="트로트">트로트</option>
														<option value="힙합">힙합</option>
														<option value="락">락</option>
														<option value="발라드">발라드</option>
														<option value="아이돌" selected="selected">아이돌</option>
														<option value="재즈">재즈</option>
													</select>
													</c:if>
													</td>
													<td><b>가 격</b></td>
													<td><input type="text" name="price" class="form-control" id="email" placeholder="가격" style="width: 75%" value="${bean.price}"></td>
												</tr>
												<tr align="center">
													<td><b>이용가 등급</b></td>
													<td style="width: 15%">
													<c:if test="${bean.cla == '전체' }">
													<select class="form-control input-fixed" id="notify_state" name="cla">
														<option value="전체" selected="selected">전체</option>
														<option value="12세 이상">12세 이상</option>
														<option value="15세 이상">15세 이상</option>
														<option value="19세 이상">19세 이상</option>
													</select>
													</c:if>
													<c:if test="${bean.cla == '12세 이상' }">
													<select class="form-control input-fixed" id="notify_state" name="cla">
														<option value="전체">전체</option>
														<option value="12세 이상" selected="selected">12세 이상</option>
														<option value="15세 이상">15세 이상</option>
														<option value="19세 이상">19세 이상</option>
													</select>
													</c:if>
													<c:if test="${bean.cla == '15세 이상' }">
													<select class="form-control input-fixed" id="notify_state" name="cla">
														<option value="전체">전체</option>
														<option value="12세 이상">12세 이상</option>
														<option value="15세 이상" selected="selected">15세 이상</option>
														<option value="19세 이상">19세 이상</option>
													</select>
													</c:if>
													<c:if test="${bean.cla == '19세 이상' }">
													<select class="form-control input-fixed" id="notify_state" name="cla">
														<option value="전체">전체</option>
														<option value="12세 이상">12세 이상</option>
														<option value="15세 이상">15세 이상</option>
														<option value="19세 이상" selected="selected">19세 이상</option>
													</select>
													</c:if>
													</td>
													<td style="width: 15%"><b>공연시간(분)</b></td>
													<td style="width: 15%">
													<c:if test="${bean.runtime == '200' }">
													<select class="form-control input-fixed" id="notify_state" name="runtime">
														<option value="200" selected="selected">200분</option>
														<option value="180">180분</option>
														<option value="150">150분</option>
														<option value="120">120분</option>
													</select>
													</c:if>
													<c:if test="${bean.runtime == '180' }">
													<select class="form-control input-fixed" id="notify_state" name="runtime">
														<option value="200">200분</option>
														<option value="180" selected="selected">180분</option>
														<option value="150">150분</option>
														<option value="120">120분</option>
													</select>
													</c:if>
													<c:if test="${bean.runtime == '150' }">
													<select class="form-control input-fixed" id="notify_state" name="runtime">
														<option value="200">200분</option>
														<option value="180">180분</option>
														<option value="150" selected="selected">150분</option>
														<option value="120">120분</option>
													</select>
													</c:if>
													<c:if test="${bean.runtime == '120' }">
													<select class="form-control input-fixed" id="notify_state" name="runtime">
														<option value="200">200분</option>
														<option value="180">180분</option>
														<option value="150">150분</option>
														<option value="120" selected="selected">120분</option>
													</select>
													</c:if>
													</td>
												</tr>
												<tr align="center">
												<td><b>공연 기간</b></td>
												<td colspan="4" align="center">
												<input type="date" name="startdate" style="width: 30%;" value="${bean.startdate}" readonly="readonly">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="date" name="enddate" style="width: 30%;" value="${bean.enddate}" readonly="readonly">
												</td>
												</tr>
												<tr align="center">
													<td id=te7 colspan="2"><b>섬네일 이미지</b></td>
													<td id=te8 colspan="2"><b>상품 이미지</b></td>
												</tr>
												<tr align="center">
												 <td colspan="2"><img src="${contextPath}/consert/${bean.image}" style="width: 600px; height: 700px;"></td>
												 <td colspan="2"><img src="${contextPath}/consert/${bean.content}" style="width: 600px; height: 700px;"></td>
												<tr>
												<!-- 상세정보 -->
												</tbody>
										</table>
										
										<table class="table table-bordered table-head-bg-info table-bordered-bd-info mt-4" id="det" style="display: none;">
										
												<!-- 제이쿼리나 스프링 속성으로 넣어주기 -->
												<tr>
													<th>공연명</th>
													<th>공연날짜</th>
													<th>시작시간</th>
													<th>잔여좌석</th>
													<th>좌석수</th>
													<th>공연장</th>
												</tr>
												<tr>
												<c:forEach var="delist" items="${Bean}" varStatus="delistNum">
													<td><p class="text-muted">${delist.name}</p></td>
													<td><p class="text-muted">${delist.today}</p></td>
													<td><p class="text-muted">${delist.starttime}</p></td>
													<td><p class="text-muted"></p>${delist.seat - delist.totalreserved}</td>
													<td><p class="text-muted">${delist.seat}</p></td>
													<td><p class="text-muted">${delist.place}</p></td>
												</c:forEach>	
												</tr>
										
										</table>
										
										<br><br><br>
										<div align="center">
										<button type="button" class="btn btn-success" onclick="location.href='${contextPath}/admin/Adetails.do?num=3'">상품 등록</button>
											<button
												onclick="location.href='${contextPath}/admin/AproductMain.do'"
												type="button" class="btn btn-danger">목록 으로</button>
										</div>
										</form>

			</div>
				</div>
			</div>
			
			
	</div>
	<!-- Modal -->
	<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h6 class="modal-title"><i class="la la-frown-o"></i> Under Development</h6>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span> 
					</button>
				</div>
				<div class="modal-body text-center">									
					<p>Currently the pro version of the <b>관리자 페이지</b> Bootstrap is in progress development</p>
					<p>
						<b>We'll let you know when it's done</b></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${contextPath}/admins/assets/js/core/jquery.3.2.1.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="${contextPath}/admins/assets/js/core/popper.min.js"></script>
<script src="${contextPath}/admins/assets/js/core/bootstrap.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/chartist/chartist.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/chart-circle/circles.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="${contextPath}/admins/assets/js/ready.min.js"></script>
<script src="${contextPath}/admins/assets/js/demo.js"></script>
</html>