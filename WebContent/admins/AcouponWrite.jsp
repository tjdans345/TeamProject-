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
		  
		  
		if(input.files && input.files[0]){

			$('#fileinput1').text($('#e_file1')[0].files[0].name);
			
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
			
			$('#fileinput2').text($('#e_file2')[0].files[0].name);
			
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
						<h4 class="page-title">쿠폰 등록</h4>
			
						<form action="${contextPath}/admin/AinsertCoupon.do" enctype="multipart/form-data" method="post">
						<table class="table table-bordered table-head-bg-info table-bordered-bd-info mt-4">
											<thead>
												<tr align="center">
													<th scope="col" colspan="4"><b>쿠폰 등록</b></th>
												</tr>
											</thead>
											<tbody>
												<tr align="center">
													<td style="width: 15%"><b>쿠폰 명</b></td>
													<td colspan="3">
													<input type="text" name="title" class="form-control" id="email" placeholder="이벤트 명" style="width: 75%">
													</td>
												</tr>
												<tr align="center">
												<td><b>내용</b></td>
												<td colspan="4"><textarea name="content" class="form-control" id="comment" rows="20"></textarea></td>
												</tr>
												<tr align="center">
												<td><b>이벤트 기간</b></td>
												<td colspan="4" align="center">
												<input type="date" name="startdate" style="width: 30%;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="date" name="enddate" style="width: 30%;">
												</td>
												</tr>
												<tr align="center">
												
											   	 <td><b>썸네일 이미지 업로드</b></td>
											   	 
												 <td colspan="3">
												 <div class="custom-file">
												 <input class="custom-file-input" type="file" id="e_file1" name="timage" onchange="URL1(this)" accept="image/*">
												 <label class="custom-file-label" for="e_file1" id="fileinput1">이미지를 첨부하세요</label>
												 </div>
												 </td>
												</tr>
												<tr align="center">
													<td>쿠폰 썸네일 이미지</td>
													<td id="sun" colspan="2" >썸네일 이미지</td>	
												</tr>
												<tr align="center">
												
											   	 <td><b>내용 이미지 업로드</b></td>
											   	 
												 <td colspan="3">
												 <div class="custom-file">
												 <input class="custom-file-input" type="file" id="e_file2"name="image" onchange="URL2(this)" accept="image/*">
												 <label class="custom-file-label" for="e_file2" id="fileinput2">이미지를 첨부하세요</label>
												 </div>
												 </td>
												</tr>
												<tr align="center">
													<td>쿠폰 내용 이미지</td>
													<td id="del" colspan="2" >내용 이미지</td>	
												</tr>
												</tbody>
										</table>
										<div align="center">
											<button type="submit" class="btn btn-success">쿠폰 등록</button>
											<button type="reset" class="btn btn-warning">취소</button>
											<button
												onclick="location.href='${contextPath}/admin/AqouponMain.do'"
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