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
	
	function del(id) {
		
		var did = id
		if (confirm("정말 삭제 하시겠습니까??") == true){
			window.location.href ='${contextPath}/admin/MemberDelete.do?id='+did+'&nowpage=${nowpage}';
		} else {
			return false;
		}
	}
	
	</script>
	
</head>
<body>
	<jsp:include page="./include/top_navi.jsp" />
			
			<!-- 바디영역 -->
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">회원 관리</h4>
						<!-- 회원 정보 출력 테이블 -->
						<table class="table table-hover">
											<thead>
												<tr align="center">
													<th scope="col">아이디</th>
													<th scope="col">이름</th>
													<th scope="col">비밀번호</th>
													<th scope="col">이메일</th>
													<th scope="col">휴대폰 번호</th>
													<th scope="col">포인트</th>
													<th scope="col">회원 상태</th>
													<th scope="col">접속 경로</th>
													<th scope="col">관리자 권한</th>
													<th scope="col">가입일</th>
													<th scope="col">정보 수정</th>
													<th scope="col">회원 삭제</th>
													
												</tr>
											</thead>
											<tbody>
											<c:choose>
											 <c:when test="${list == null }">
											 <tr>
											 <td colspan="12" align="center">등록된 회원이 없습니다.</td>
											 </tr>
											 </c:when>
										<c:when test="${list != null }">
											<c:forEach var="memberlist" items="${list}" varStatus="membersNum">
											<fmt:formatDate var="parseDate" value="${memberlist.reg_date}" pattern="yyyy-MM-dd"/>
										<tr align="center">

											<td><p class="text-muted">${memberlist.id}</p></td>
											<td><p class="text-muted">${memberlist.name}</p></td>
											<td><p class="text-muted">${memberlist.password}</p></td>
											<td><p class="text-muted">${memberlist.email}</p></td>
											<td><p class="text-muted">${memberlist.phone}</p></td>
											<td><p class="text-muted">${memberlist.point}</p></td>
											<c:choose>
												<c:when test="${memberlist.status == 1}">
													<td><p class="text-success">이용 가능</p></td>
												</c:when>
												<c:when test="${memberlist.status == 2}">
													<td><p class="text-danger">이용 정지</p></td>
												</c:when>
											</c:choose>
											<c:if test="${memberlist.n_status == 0 }">
												<td><p class="text-muted">2티켓 가입 회원</p></td>
											</c:if>	
											<c:if test="${memberlist.n_status == 1 }">
												<td><p class="text-muted">네이버 회원</p></td>
											</c:if>	
												
											<c:choose>
											
												<c:when test="${memberlist.is_admin == 1}">
													<td><p class="text-primary">관리자</p></td>
												</c:when>
												<c:when test="${memberlist.is_admin == 0}">
													<td><p class="text-muted">일반 회원</p></td>
												</c:when>
											</c:choose>
											<td><p class="text-muted">${parseDate}</p></td>
											<!-- 버튼 -->
											<div class="form-button-action">
											<td>
											<button type="button" data-toggle="tooltip" title="정보 수정" 
												onclick="location.href='${contextPath}/admin/AMemberView.do?id=${memberlist.id}&nowpage=${nowpage}'" 
												class="btn btn-link <btn-simple-primary" style=" font-size: 17px; ">
												<i class="la la-user"></i>
											</button>
											</td>
											<td>
											<button type="button" data-toggle="tooltip" title="회원 삭제"
												onclick="del('${memberlist.id}')" class="btn btn-link btn-simple-danger" style=" font-size: 17px; ">
											<i class="la la-user-times"></i>
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
						<!-- 회원 정보 출력 테이블 -->
					
									<!-- 페이징 -->
									<div align="center">
									<div class="card-body">
										<p class="demo">
											<ul class="pagination pg-primary">
												<li class="page-item">
												<c:if test="${nowpage>blocksize}">
													<a class="page-link" href="${contextPath}/admin/MemberManager.do?nowpage=${blockfirst-blocksize}" aria-label="Previous">
														<span aria-hidden="true">&laquo;</span>
													<!-- <span class="sr-only">Previous</span> -->
													</a>
												</c:if>	
												</li>
												<c:forEach begin="${blockfirst}" end="${blocklast}" var="i">
												<li class="page-item active">
												<a class="page-link" href="${contextPath}/admin/MemberManager.do?nowpage=${i}">${i}</a>
												</li>
												</c:forEach>
												<c:if test="${blocklast != totalPage }">
												<li class="page-item">
													<a class="page-link" href="${contextPath}/admin/MemberManager.do?nowpage=${blocklast+1}" aria-label="Next">
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
			<!-- 회원 정보 출력 테이블 -->
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