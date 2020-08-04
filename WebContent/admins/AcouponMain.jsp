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
	
	function del(n_num) {
		
		var dn_num = n_num
		if (confirm("정말 삭제 하시겠습니까??") == true){
			window.location.href='${contextPath}/admin/AdeleteCoupon.do?event_num=${couponBean.event_num}'+ dn_num;
			
		} else {
			return false;
		}
	}
	
	
	
	</script>
	
</head>
<body>

<jsp:include page="./include/top_navi.jsp" />

			
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">쿠폰 관리 페이지</h4>
			
			<div align="right"
					style="margin-right: 60px; margin-bottom: 10px; float: right;">
					<button type="button" onclick="location.href='${contextPath}/admin/AcouponWrite.do'" class="btn btn-warning">쿠폰 등록</button>
				</div>
			
					<table class="table table-hover">
											<thead>
												<tr align="center">
													<th scope="col">쿠폰 번호</th>
													<th scope="col">쿠폰 명</th>
													<th scope="col">쿠폰 썸네일</th>
													<th scope="col">쿠폰 시작날짜</th>
													<th scope="col">쿠폰 종료날짜</th>
													<th scope="col">쿠폰 수정</th>
													<th scope="col">쿠폰 삭제</th>
												</tr>
											</thead>
											<tbody>
											<c:choose>
											 <c:when test="${list == null}">
											 <tr>
											 <td colspan="8" align="center">등록된 쿠폰(이) 없습니다.</td>
											 </tr>
											 </c:when>
										<c:when test="${list != null}">
											<c:forEach var="coupon" items="${list}" varStatus="status">
										<tr align="center">
											<td><p class="text-muted">${coupon.event_num}</p></td>s
											<td><p class="text-muted">${coupon.event_title}</p></td>
											<td><a href="${contextPath}/coupon/eventInfo.do?event_num=${coupon.event_num}">
	 										<img src="${contextPath}/upload/${coupon.event_timage}" style="width: 200px; height: 100px;"><br>
											</a></td>
											<td><p class="text-muted">${coupon.event_startdate}</p></td>
											<td><p class="text-muted">${coupon.event_enddate}</p></td>
											
											<!-- 버튼 -->
											<div class="form-button-action">
											<td>
											<button type="button" data-toggle="tooltip" title="쿠폰 수정" 
												onclick="location.href='${contextPath}/admin/AmodcouponForm.do?event_num=${coupon.event_num}'" 
												class="btn btn-link <btn-simple-primary" style=" font-size: 17px; ">
												<i class="la la-cc-diners-club"></i>
											</button>
											</td>
											<td>
											<button type="button" data-toggle="tooltip" title="쿠폰 삭제"
												onclick="del('${coupon.event_num}')" class="btn btn-link btn-simple-danger" style=" font-size: 17px; ">
											<i class="la la-trash"></i>
											</button>
											</td>
											</div>
											<!-- 버튼 -->
										</tr>
									</c:forEach>
            							</c:when>
            							</c:choose>	
											</tbody>
										</table>
					
										<!-- 페이징 -->
									
									<div align="center">
									<div class="card-body">
										<p class="demo">
											<ul class="pagination pg-primary">
												<li class="page-item">
											
										<c:if test="${blockFirst!=1}">
											<a class="page-link"
												href="${contextPath}/admin/AcouponMain.do?nowPage=${blockFirst-blockSize}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												<!-- <span class="sr-only">Previous</span> -->
											</a>
											 </c:if>
												</li>
												<c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
												<li class="page-item active">
												<a class="page-link" href="${contextPath }/admin/AcouponMain.do?nowPage=${i}">${i}</a>
												</li>
												</c:forEach>
												<c:if test="${blockLast != totalPage }">
												<li class="page-item">
													<a class="page-link" href="${contextPath}/admin/AcouponMain.do?nowPage=${blockLast+1}" aria-label="Next">
														<span aria-hidden="true">&raquo;</span>
														<span class="sr-only">Next</span>
													</a>
												</li>
											</c:if>		
												
											</ul>
										</p>
									</div>
									</div>
									<!-- 페이징 -->	
			
			
			
				
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