
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

	<script src="http://code.jquery.com/jquery-latest.min.js"></script> 	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Ready Bootstrap Dashboard</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="${contextPath}/admins/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="${contextPath}/admins/assets/css/ready.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/demo.css">
	
<style type="text/css">

div#box {
	
	
	width: 25%;
	
}

button#formbutton {

	    padding: 20px 40px;
	    
}



</style>

<script type="text/javascript">
//포인트 입력 박스
function te3(t) {
	
	if(t == 1) {
	  var z = document.getElementById("po");
	  if (z.style.display === "none") {
	    z.style.display = "block";
	  } else {
	    z.style.display = "none";
	  }
	  
	  var x = document.getElementById("po2");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	  
	 }
	
	if(t == 2) {
		
		var z = document.getElementById("po");
		if (z.style.display === "block") {
			z.style.display = "none";
		 }
		
		
		var x = document.getElementById("po2");
		 if (x.style.display === "none") {
		  x.style.display = "block";
		}
	}
		
	
	
	}


//목록 리스트 이동 
function list3(f) {
	
	f.action = "${contextPath}/admin/MemberManager.do?nowpage=1";
	f.submit();
	
}

//회원 정보 수정
function update(f) {
	
	if(confirm("정말 수정 하시겠습니까??") == true) { //확인
		
		f.action = "${contextPath}/admin/MemberUpdate.do";
		f.submit();
	} else {
		return false;
	}
}

//포인트 수정 함수
function updatePoint() {
	
	var addpoint = document.getElementById('addpoint').value;
	var totalpoint = document.getElementById('tes3').value;
	var id = '${memberInfo.id}';
	console.log(id);
	$.ajax({
		
		type : "post",
		async : false,
		data : {addpoint : addpoint, totalpoint : totalpoint, id : id},
		url : "${contextPath}/admin/pointupdate.do",
		success : function(data ,textStatus) {
			
			var jsonInfo = JSON.parse(data);
			
			$("#totalpoint").text("");
			$("#totalpoint").text(jsonInfo.resultpoint);
			document.getElementById('tes3').value = jsonInfo.resultpoint;
			document.getElementById('addpoint').value = "";
			
				
				var z = document.getElementById("po");
				if (z.style.display === "block") {
					z.style.display = "none";
				 }
				
				
				var x = document.getElementById("po2");
				 if (x.style.display === "none") {
				  x.style.display = "block";
				}
			
			
		}
		
		
		
		
		
		
	});

}


</script>
	
</head>
<body>
	<jsp:include page="./include/top_navi.jsp" />
			
			<!-- Body 부분 -->

		<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">${memberInfo.id}님의 정보</h4>
					<div class="row">
						<div class="col-md-3">
							<div class="card card-stats card-warning">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="la la-users"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">Visitors</p>
												<h4 class="card-title">1,294</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="card card-stats card-success">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="la la-bar-chart"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">Sales</p>
												<h4 class="card-title">$ 1,345</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="card card-stats card-danger">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="la la-newspaper-o"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">${memberInfo.id}님의 문의 글</p>
												<h4 class="card-title">${total}</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="card card-stats card-primary">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="la la-check-circle"></i>
											</div>
										</div>
										<div class="col-7 d-flex align-items-center">
											<div class="numbers">
												<p class="card-category">주문 현황</p>
												<h4 class="card-title">${cartcount}</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<!-- 회원 프로파일링 -->
					<form action="#" method="post">
					<div class="row row-card-no-pd">
							<div class="col-md-4">
								<div class="card">
									<div class="card-body">
										<p class="fw-bold mt-1"> 포인트 </p>
										<input type="hidden" value="${memberInfo.point}" id="tes3">
										<h4><b>P</b> <b id="totalpoint">${memberInfo.point}</b></h4>
										<div id="po"  style="display: none">
										<input type="text" class="form-control input-pill" id="addpoint" placeholder="포인트를 입력해 주세요" name="point">	
										</div>
										<div id="po2">
										<a href="#" class="btn btn-primary btn-full text-left mt-3 mb-3" onclick="te3(1)"><i class="la la-plus"></i>포인트 변경</a>
										</div>
									</div>
									<div class="card-footer">
										<ul class="nav">
											<li class="nav-item"><a class="btn btn-default btn-link" href="#"><i class="la la-history"></i> History</a></li>
											<li class="nav-item ml-auto"><a class="btn btn-default btn-link" onclick="updatePoint()"><i class="la la-heart"></i> 충전하기</a></li>
											<li class="nav-item ml-auto"><a class="btn btn-default btn-link" href="#" onclick="te3(2)"><i class="la la-refresh"></i> Refresh</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-md-5">
								<div class="card">
									<div class="card-body">
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">힙합</span>
												<span class="text-muted fw-bold"> $3K</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-success" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="78%"></div>
											</div>
										</div>
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">클래식</span>
												<span class="text-muted fw-bold"> 576</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-info" role="progressbar" style="width: 65%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="65%"></div>
											</div>
										</div>
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">아이돌</span>
												<span class="text-muted fw-bold"> 좋아요 횟수</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-primary" role="progressbar" style="width: 12%" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="12"></div>
											</div>
										</div>
										<div class="progress-card">
											<div class="d-flex justify-content-between mb-1">
												<span class="text-muted">발라드</span>
												<span class="text-muted fw-bold"> 60%</span>
											</div>
											<div class="progress mb-2" style="height: 7px;">
												<div class="progress-bar bg-warning" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="60%"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card card-stats">
									<div class="card-body">
										<p class="fw-bold mt-1">Statistic</p>
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center icon-warning">
													<i class="la la-pie-chart text-warning"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">Number</p>
													<h4 class="card-title">150GB</h4>
												</div>
											</div>
										</div>
										<hr/>
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-heart-o text-primary"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">찜한 목록</p>
													<h4 class="card-title"><a href="${contextPath}/mycon/likelistForm.do">${liketotal}</a></h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					
					<!-- 회원 프로파일링 -->
					
					<!-- 정보값 수정 칸 -->
					
					
					<input type="hidden" value="${memberInfo.id}" name="id"/>
					 
					<div class="form-group" id="box">
						<label for="pillInput"><b>비밀번호</b></label> 
						<input type="text" class="form-control input-pill" id="pillInput" value="${memberInfo.password}" name="password">
							<br>
						<label for="pillInput"><b>이름</b></label> 
						<input type="text" class="form-control input-pill" id="pillInput" value="${memberInfo.name}" name="name">
							<br>
						<label for="pillInput"><b>이메일</b></label> 
						<input type="text" class="form-control input-pill" id="pillInput" value="${memberInfo.email}" name="email">
							<br>	
						<label for="pillInput"><b>휴대폰 번호</b></label> 
						<input type="text" class="form-control input-pill" id="pillInput" value="${memberInfo.phone}" name="phone">	
							<br>
						<b>회원 상태</b> : 	
	                  	<c:choose>
							<c:when test="${memberInfo.status == 1}">
								이용 가능
							</c:when>
							<c:when test="${memberInfo.status == 2}">
								이용 정지
							</c:when>
						</c:choose>
						<div class="col-lg-4 col-md-9 col-sm-12">
							<select name="status" class="form-control input-fixed" id="notify_state">
								<option value="1" selected="selected">회원 이용 가능</option>
								<option value="2">회원 이용 정지</option>
							</select>
						</div>
						<br>
						<b>관리자 권한</b> : 
						<c:choose>
							<c:when test="${memberInfo.is_admin == 1}">
								 관리자
							</c:when>
							<c:when test="${memberInfo.is_admin == 0}">
						 		일반 회원
							</c:when>
						</c:choose> 
						<div class="col-lg-4 col-md-9 col-sm-12">
							<select name="admin" class="form-control input-fixed" id="notify_state">
								<option value="0" selected="selected">일반 회원</option>
								<option value="1">관리자</option>
							</select>
						</div>
						</div>	
					<!-- 정보값 수정 칸 -->
					
					
<!-- 					회원 프로파일링 -->
<!-- 					<div class="row row-card-no-pd"> -->
<!-- 							<div class="col-md-4"> -->
<!-- 								<div class="card"> -->
<!-- 									<div class="card-body"> -->
<!-- 										<p class="fw-bold mt-1"> 포인트 </p> -->
<%-- 										<h4><b>P ${memberInfo.point}</b></h4> --%>
<!-- 										<div id="po"  style="display: none"> -->
<!-- 										<input type="text" class="form-control input-pill" id="pillInput" value="AJAX 구현하기" name="point">	 -->
<!-- 										</div> -->
<!-- 										<div id="po2"> -->
<!-- 										<a href="#" class="btn btn-primary btn-full text-left mt-3 mb-3" onclick="te3(1)"><i class="la la-plus"></i>포인트 변경</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="card-footer"> -->
<!-- 										<ul class="nav"> -->
<!-- 											<li class="nav-item"><a class="btn btn-default btn-link" href="#"><i class="la la-history"></i> History</a></li> -->
<!-- 											<li class="nav-item ml-auto"><a class="btn btn-default btn-link" href="#" onclick="te3(2)"><i class="la la-refresh"></i> Refresh</a></li> -->
<!-- 										</ul> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-5"> -->
<!-- 								<div class="card"> -->
<!-- 									<div class="card-body"> -->
<!-- 										<div class="progress-card"> -->
<!-- 											<div class="d-flex justify-content-between mb-1"> -->
<!-- 												<span class="text-muted">힙합</span> -->
<!-- 												<span class="text-muted fw-bold"> $3K</span> -->
<!-- 											</div> -->
<!-- 											<div class="progress mb-2" style="height: 7px;"> -->
<!-- 												<div class="progress-bar bg-success" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="78%"></div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="progress-card"> -->
<!-- 											<div class="d-flex justify-content-between mb-1"> -->
<!-- 												<span class="text-muted">클래식</span> -->
<!-- 												<span class="text-muted fw-bold"> 576</span> -->
<!-- 											</div> -->
<!-- 											<div class="progress mb-2" style="height: 7px;"> -->
<!-- 												<div class="progress-bar bg-info" role="progressbar" style="width: 65%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="65%"></div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="progress-card"> -->
<!-- 											<div class="d-flex justify-content-between mb-1"> -->
<!-- 												<span class="text-muted">아이돌</span> -->
<!-- 												<span class="text-muted fw-bold"> 좋아요 횟수</span> -->
<!-- 											</div> -->
<!-- 											<div class="progress mb-2" style="height: 7px;"> -->
<!-- 												<div class="progress-bar bg-primary" role="progressbar" style="width: 12%" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="12"></div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="progress-card"> -->
<!-- 											<div class="d-flex justify-content-between mb-1"> -->
<!-- 												<span class="text-muted">발라드</span> -->
<!-- 												<span class="text-muted fw-bold"> 60%</span> -->
<!-- 											</div> -->
<!-- 											<div class="progress mb-2" style="height: 7px;"> -->
<!-- 												<div class="progress-bar bg-warning" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="60%"></div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-3"> -->
<!-- 								<div class="card card-stats"> -->
<!-- 									<div class="card-body"> -->
<!-- 										<p class="fw-bold mt-1">Statistic</p> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-5"> -->
<!-- 												<div class="icon-big text-center icon-warning"> -->
<!-- 													<i class="la la-pie-chart text-warning"></i> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="col-7 d-flex align-items-center"> -->
<!-- 												<div class="numbers"> -->
<!-- 													<p class="card-category">Number</p> -->
<!-- 													<h4 class="card-title">150GB</h4> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<hr/> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-5"> -->
<!-- 												<div class="icon-big text-center"> -->
<!-- 													<i class="la la-heart-o text-primary"></i> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="col-7 d-flex align-items-center"> -->
<!-- 												<div class="numbers"> -->
<!-- 													<p class="card-category">찜한 목록</p> -->
<!-- 													<h4 class="card-title">+45K</h4> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					
<!-- 					회원 프로파일링 -->
					<br><br><br>
					
					<!-- 버튼 -->
					<div class="card-action" align="center">
					  <button class="btn btn-success" id="formbutton" onclick="update(this.form)">Submit</button>
					  <button class="btn btn-danger" id="formbutton" onclick="list3(this.form)">Cancel</button>
					</div>
					<!-- 버튼 -->
					
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