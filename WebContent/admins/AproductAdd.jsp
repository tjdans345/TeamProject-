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
// 		  }    
		  
		  
		if(input.files && input.files[0]){

			$("#sun").html("<img id='sunpreview' src='#' width=400 height=400 />");

			var reader = new FileReader();
			
			reader.readAsDataURL(input.files[0]);
			
			reader.onload = function(ProgressEvent){

				$('#sunpreview').attr('src',ProgressEvent.target.result);
				
			}
			
		}		
		
		
		
	} 

	function URL2(input){
		
		
		
		
		if(input.files && input.files[0]){

			$("#del").html("<img id='delpreview' src='#' width=400 height=400 />");

			var reader = new FileReader();
			
			reader.readAsDataURL(input.files[0]);
			
			reader.onload = function(ProgressEvent){

				$('#delpreview').attr('src',ProgressEvent.target.result);
				
			}
			
		}			
	} 

	
	
	</script>
	
	
	
	
	
</head>
<body>

<jsp:include page="./include/top_navi.jsp" />

			
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid" style="width: 70%;">
						<h4 class="page-title">상품 등록</h4>
			
						<form action="${contextPath}/admin/AwritePro.do" enctype="multipart/form-data" method="post">
						<table class="table table-bordered table-head-bg-info table-bordered-bd-info mt-4">
											<thead>
												<tr align="center">
													<th scope="col" colspan="4"><b>콘서트 상품 등록</b></th>
												</tr>
											</thead>
											<tbody>
												<tr align="center">
													<td style="width: 15%"><b>콘서트명</b></td>
													<td colspan="3">
													<input type="text" name="name" class="form-control" id="email" placeholder="콘서트명" style="width: 75%">
													</td>
												</tr>
												<tr align="center">
													<td><b>장르</b></td>
													<td style="width: 15%">
													<select class="form-control input-fixed" id="notify_state" name="genre">
														<option value="아이돌">아이돌</option>
														<option value="트로트">트로트</option>
														<option value="힙합">힙합</option>
														<option value="락">락</option>
														<option value="발라드">발라드</option>
														<option value="재즈">재즈</option>
													</select>
													</td>
													<td><b>가 격</b></td>
													<td><input type="text" name="price" class="form-control" id="email" placeholder="가격" style="width: 75%"></td>
												</tr>
												<tr align="center">
													<td><b>이용가 등급</b></td>
													<td style="width: 15%">
													<select class="form-control input-fixed" id="notify_state" name="cla">
														<option value="전체">전체</option>
														<option value="12세 이상">8세 이상</option>
														<option value="12세 이상">12세 이상</option>
														<option value="15세 이상">15세 이상</option>
														<option value="19세 이상">19세 이상</option>
													</select>
													</td>
													<td style="width: 15%"><b>공연시간(분)</b></td>
													<td style="width: 15%">
													<select class="form-control input-fixed" id="notify_state" name="runtime">
														<option value="200">200분</option>
														<option value="180">180분</option>
														<option value="150">150분</option>
														<option value="120">120분</option>
													</select>
													</td>
												</tr>
												<tr align="center">
												<td><b>공연 기간</b></td>
												<td colspan="4" align="center">
												<input type="date" name="startdate" style="width: 30%;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="date" name="enddate" style="width: 30%;">
												</td>
												</tr>
												<tr align="center">
												 <td><b>섬네일</b></td>
												 <td><input type="file" name="image" onchange="URL1(this);"></td>
											   	 <td><b>제품내용</b></td>
												 <td><input type="file" name="content" onchange="URL2(this)"></td>
												<tr>
												<tr align="center">
													<td id=te7 colspan="2"><b>섬네일 이미지</b></td>
													<td id=te8 colspan="2"><b>상품 이미지</b></td>
												</tr>
												<tr align="center">
													<td id="sun" colspan="2" ></td>	
													<td id="del" colspan="2" ></td>	
												</tr>
												</tbody>
										</table>
										<div align="center">
											<button type="submit" class="btn btn-success">상품 등록</button>
											<button type="reset" class="btn btn-warning">취소</button>
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