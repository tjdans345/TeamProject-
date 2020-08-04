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
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
	<script type="text/javascript">
	
	function te33(runstatus1, num) {
		
		
		var runstatus = 0;
		
		if (runstatus1 != 0) {
		var runstatus = runstatus1
		}
		
		$.ajax({
			
			url : "${contextPath}/admin/runstatus.do?runstatus="+runstatus+"&num="+num,
			type : "POST",
			dataType : "json",
			cache : false,
			contentType : false,
			processData : false,
			error : function() {
				 
				setTimeout(function(){
					location.reload();
					},100); // 3000밀리초 = 3초
				
			},
			succes: function(data) {
				alert("여 왔다");
				var aa = JSON.parse(JSON.stringify(data));
				var bb = aa.List;
				var test7 = bb[0].test;
			}
			
			
		});
		
		
	}
	
	
	</script>
</head>
<body>

<jsp:include page="./include/top_navi.jsp" />

			
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">공연 상품 관리 페이지</h4>

				<div align="right"
					style="margin-right: 60px; margin-bottom: 10px; float: right;">
					<button type="button" onclick="location.href='${contextPath}/admin/AproductAdd.do'" class="btn btn-warning">상품 등록</button>
				</div>
				</form>

				<table class="table table-hover">
											<thead>
												<tr align="center">
													<th scope="col">공연 이름</th>
													<th scope="col">공연 썸네일</th>
													<th scope="col">공연 장르</th>
													<th scope="col">공연 시간</th>
													<th scope="col">이용가 등급</th>
													<th scope="col">가격</th>
													<th scope="col">시작 날짜</th>
													<th scope="col">종료 날짜</th>
													<th scope="col">공연 게시</th>	
													<th scope="col">공연 상세 정보</th>
													<th scope="col">공연 상세 등록</th>
													<th scope="col">공연 삭제</th>
																						
												</tr>
											</thead>
											<tbody>
											<tbody>
											
											<c:choose>
											 <c:when test="${List == null }">
											 <tr>
											 <td colspan="12" align="center">등록된 공연(상품)이 없습니다.</td>
											 </tr>
											 </c:when>
											 <c:when test="${List != null }" >
											  <c:forEach var="productlist" items="${List}" varStatus="productNum">

									<tr align="center">
										<td><p class="text-muted">${productlist.name}</p></td>
										<td><a href="${contextPath}/Proser/content.do?num=${productlist.num}&name=${productlist.name}" class="img w-100 mb-3"><img
											src="${contextPath}/consert/${productlist.image}"
											style="width: 100px; height: 100px;"></a></td>
										<td><p class="text-muted">${productlist.genre}</p></td>
										<td><p class="text-muted">${productlist.runtime}</p></td>
										<td><p class="text-muted">${productlist.cla}</p></td>
										<td><p class="text-muted">${productlist.price}</p></td>
										<td><p class="text-muted">${productlist.startdate}</p></td>
										<td><p class="text-muted">${productlist.enddate}</p></td>
										
										<!-- 버튼 -->
										<div class="form-button-action">
										<c:if test="${productlist.runstatus == 0}">
											<td>
												<input type="checkbox" checked data-toggle="toggle" data-onstyle="success" data-style="btn-round" onchange="te33(1, ${productlist.num} );">
											</td>
										</c:if>	
										<c:if test="${productlist.runstatus != 0}">
										<td>
										<input type="checkbox" data-toggle="toggle" data-onstyle="default" data-style="btn-round" onchange="te33(0, ${productlist.num} );">	
										</td>
										</c:if>
											<td>
												<button type="button" data-toggle="tooltip" title="상세 정보"
													onclick="location.href='${contextPath}/admin/AproductInfo.do?num=${productlist.num}&name=${productlist.name}'"
													class="btn btn-link <btn-simple-primary"
													style="font-size: 17px;">
													<i class="la la-list-alt" style="font-size: 20px;"></i>
												</button>
											</td>
											<td>
												<button type="button" data-toggle="tooltip" title="상세 등록"
													onclick="location.href='${contextPath}/admin/Adetails.do?num=${productlist.num}'"
													class="btn btn-link <btn-simple-primary"
													style="font-size: 17px;">
													<i class="la la-edit" style="font-size: 20px;"></i>
												</button>
											</td>
											<td>
												<button type="button" data-toggle="tooltip" title="공연 삭제"
													onclick="del('${memberlist.id}')"
													class="btn btn-link btn-simple-danger"
													style="font-size: 17px;">
													<i class="la la-trash" style="font-size: 20px;"></i>
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
											<c:choose>
										     <c:when test="${List != null}">
										      <c:if test="${blockFirst!=1}">
											<a class="page-link"
												href="${contextPath}/admin/AproductMain.do?nowPage=${blockFirst-blockSize}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												<!-- <span class="sr-only">Previous</span> -->
											</a>
											 </c:if>
												</li>
												<c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
												<li class="page-item active">
												<a class="page-link" href="${contextPath }/admin/AproductMain.do?nowPage=${i}">${i}</a>
												</li>
												</c:forEach>
												<c:if test="${blockLast != totalPage }">
												<li class="page-item">
													<a class="page-link" href="${contextPath}/admin/AproductMain.do?nowPage=${blockLast+1}" aria-label="Next">
														<span aria-hidden="true">&raquo;</span>
														<span class="sr-only">Next</span>
													</a>
												</li>
												</c:if>
											  </c:when>
											  
											  <c:otherwise>
												<c:if test="${blockFirst!=1}">
											<a class="page-link"
												href="${contextPath}/admin/AproductMain.do?nowPage=${blockFirst-blockSize}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												<!-- <span class="sr-only">Previous</span> -->
											</a>
											 </c:if>
												</li>
												<c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
												<li class="page-item active">
												<a class="page-link" href="${contextPath }/admin/AproductMain.do?nowPage=${i}">${i}</a>
												</li>
												</c:forEach>
												<c:if test="${blockLast != totalPage }">
												<li class="page-item">
													<a class="page-link" href="${contextPath}/admin/AproductMain.doo?nowPage=${blockLast+1}" aria-label="Next">
														<span aria-hidden="true">&raquo;</span>
														<span class="sr-only">Next</span>
													</a>
												</li>
												</c:if>			  
											  </c:otherwise>   
										</c:choose>
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