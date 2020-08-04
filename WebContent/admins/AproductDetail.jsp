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
	
	
	 $(document).ready(function() {
		 
		 alert("여 왔다");
	 });

	 function checkdate(){
			var start = $("#stdate").val();
			var end = $("#endate").val();
			
			var date = $("#date").val();
			if((start > date) || (end < date)){
				alert(start+" 와 "+end+" 사이 날짜로 입력하세요!!");
				$("#date").val(null);
				return;
			}
		}
	
	</script>
	
	
	
	
	
</head>
<body>

<jsp:include page="./include/top_navi.jsp" />

			
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid" style="width: 70%;">
						<h4 class="page-title">상세 등록</h4>
			
						<form action="${contextPath}/admin/AdetailsPro.do" method="post">
							<input type="hidden" value="${Bean.startdate}" id="stdate">
							<input type="hidden" value="${Bean.enddate}" id="endate">
							<input type="hidden" value="${Bean.num}" name="num">
							<table id="notice">	
						<table class="table table-bordered table-head-bg-info table-bordered-bd-info mt-4">
											<thead>
												<tr align="center">
													<th scope="col" colspan="4"><b>콘서트상품 상세 등록</b></th>
												</tr>
											</thead>
											<tbody>
												<tr align="center">
													<td style="width: 15%"><b>콘서트명</b></td>
													<td colspan="3">
													<input type="text" name="name" class="form-control" id="email" value="${Bean.name}" style="width: 75%" readonly="readonly">
													</td>
												</tr>
												<tr>
													<td>공연장소</td>
												 <td>
													<select class="form-control input-fixed" id="notify_state" name="place" style="vertical-align: middle; text-align-last: center;">
														<option value="KSPO DOME (올림픽공원 체조경기장)">KSPO DOME (올림픽공원 체조경기장)</option>
														<option value="잠실종합운동장 주경기장">잠실종합운동장 주경기장</option>
														<option value="블루스퀘어 아이마켓홀">블루스퀘어 아이마켓홀</option>
														<option value="의정부 종합운동장">의정부 종합운동장</option>
														<option value="예술의전당">예술의전당</option>
														<option value="연세대학교 노천극장">연세대학교 노천극장</option>
													</select>
												 </td>
													<td style="width: 15%">좌석</td>
													<td>
														<select class="form-control input-fixed" id="notify_state" name="seat" style="vertical-align: middle; text-align-last: center;">
														<option value="80">80</option>
														<option value="120">120</option>
														<option value="160">160</option>
														<option value="200">200</option>
														<option value="240">240</option>
														</select>
													</td>
												</tr>
												<tr>
													<td>공연 날짜</td>
													<td><input type="date" name="today" class="form-control" id="date" style="width: 75%" oninput="checkdate()"></td>
													<td style="width: 15%">공연 시간</td>
													<td><input type="time" name="starttime" class="form-control" id="email" placeholder="콘서트명" style="width: 75%"></td>
												</tr>
												
												</tbody>
										</table>
										<div align="center">
											<button type="submit" class="btn btn-success">상품 상세 등록</button>
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