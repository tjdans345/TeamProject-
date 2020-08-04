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
	
	function status(s) {
		var status = s
		window.location.href="${contextPath}/admin/Aqnaboardp.do?status="+status;
		
	}
			
	function del(num) {
		
		var qna_num = num
		if (confirm("정말 삭제 하시겠습니까??") == true){
			window.location.href ='${contextPath}/admin/Aqnadelete.do?qna_num='+qna_num;
		} else {
			return false;
		}
	}
	
	
	</script>
	
	
	
</head>
<body>

<jsp:include page="./include/top_navi.jsp" />

			
			<!-- 바디 영역 -->
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">문의 내역 답변 관리 페이지</h4>

						
						<div class="form-group">
						<button type="button" class="btn btn-success pull-right" onclick="status(1)" id="t2">답변 완료</button>&nbsp;&nbsp;
						<button type="button" class="btn btn-warning pull-right" onclick="status(0)" id="t1" style="margin-right: 5px;">답변 대기중</button>&nbsp;&nbsp;
						
						</div>
						
						
					<table class="table table-hover">
						
											<thead>
												<tr align="center">
													<th scope="col">처리상태</th>
													<th scope="col">아이디</th>
													<th scope="col">제목</th>
													<th scope="col">등록일</th>
													<th scope="col">답변</th>
													<th scope="col">글 삭제</th>
												</tr>
											</thead>
											<tbody>
											<c:choose>
											 <c:when test="${qnaList == null}">
											 <tr>
											 <td colspan="12" align="center">등록된 회원이 없습니다.</td>
											 </tr>
											 </c:when>
										<c:when test="${qnaList != null }">
											<c:forEach var="qnaList" items="${qnaList}" varStatus="membersNum">
											<fmt:formatDate var="parseDate" value="${qnaList.qna_date}" pattern="yyyy-MM-dd"/>
										<tr align="center">
											<td><p class="text-muted">
											<c:if test="${qnaList.qna_status == 0}"><p class="text-warning">대기중</p></c:if>
					   						<c:if test="${qnaList.qna_status == 1}"><p class="text-success">답변완료<p></c:if>
											</p></td>
											<td><p class="text-muted">${qnaList.id}</p></td>
											<td align="left"><p class="text-muted">${qnaList.qna_title}</p></td>
											<td><p class="text-muted">${parseDate}</p></td>
											<!-- 버튼 -->
											<div class="form-button-action">
											<td>

											<c:if test="${qnaList.qna_status == 0 }">
											<button type="button" data-toggle="tooltip" title="답변 하기" 
												onclick="location.href='${contextPath}/admin/AqnaAnswer.do?qna_num=${qnaList.qna_num}'" 
												class="btn btn-link <btn-simple-primary" style=" font-size: 17px; ">
												<i class="la la-comments"></i>
											</button>
											</c:if>
											<c:if test="${qnaList.qna_status == 1 }">
											<button type="button" data-toggle="tooltip" title="답변  수정 하기" 
												onclick="location.href='${contextPath}/admin/AqnaAnswerMod.do?qna_num=${qnaList.qna_num}'" 
												class="btn btn-link <btn-simple-primary" style=" font-size: 17px; ">
												<i class="la la-pencil"></i>
											</button>
											</c:if>
											</td>
											<c:if test="${status == 0}">
											<td>
											<button type="button" data-toggle="tooltip" title="문의 글 삭제"
												onclick="del('${qnaList.qna_num}')" class="btn btn-link btn-simple-danger" style=" font-size: 17px; ">
											<i class="la la-trash"></i>
											</button>
											</td>
											</c:if>
											<c:if test="${status == 1}">
											<td>
											<button type="button" data-toggle="tooltip" title="문의 글 삭제"
												onclick="del('${qnaList.qna_num}')" class="btn btn-link btn-simple-danger" style=" font-size: 17px; ">
											<i class="la la-trash"></i>
											</button>
											</td>
											</c:if>
											</div>
											<!-- 버튼 -->
										</tr>
									</c:forEach>
            							</c:when>
            							</c:choose>	
											</tbody>
										</table>

									<c:if test="${status == 0 }">
										<!-- 페이징 -->
									<div align="center">
									<div class="card-body">
										<p class="demo">
											<ul class="pagination pg-primary">
												<li class="page-item">
												<c:if test="${nowPage>blockSize}">
													<a class="page-link" href="${contextPath}/admin/Aqnaboardp.do?nowPage=${blockFirst-blockSize}&status=0" aria-label="Previous">
														<span aria-hidden="true">&laquo;</span>
													<!-- <span class="sr-only">Previous</span> -->
													</a>
												</c:if>	
												</li>
												<c:forEach begin="${blockFirst}" end="${blockLast}" var="i">
												<li class="page-item active">
												<a class="page-link" href="${contextPath }/admin/Aqnaboardp.do?nowPage=${i}&status=0">${i}</a>
												</li>
												</c:forEach>
												<c:if test="${blockLast != totalPage }">
												<li class="page-item">
													<a class="page-link" href="${contextPath}/admin/Aqnaboardp.do?nowPage=${blockLast+1}&status=0" aria-label="Next">
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
									</c:if>
									<c:if test="${status == 1 }">
										<!-- 페이징 -->
									<div align="center">
									<div class="card-body">
										<p class="demo">
											<ul class="pagination pg-primary">
												<li class="page-item">
												<c:if test="${nowPage>blockSize}">
													<a class="page-link" href="${contextPath}/admin/Aqnaboardp.do?nowPage=${blockFirst-blockSize}&status=1" aria-label="Previous">
														<span aria-hidden="true">&laquo;</span>
													<!-- <span class="sr-only">Previous</span> -->
													</a>
												</c:if>
												</li>
												<c:forEach begin="${blockFirst}" end="${blockLast}" var="i">
												<li class="page-item active">
												<a class="page-link" href="${contextPath }/admin/Aqnaboardp.do?nowPage=${i}&status=1">${i}</a>
												</li>
												</c:forEach>
												<c:if test="${blockLast != totalPage }">
												<li class="page-item">
													<a class="page-link" href="${contextPath}/admin/Aqnaboardp.do?nowPage=${blockLast+1}&id=${id}&status=1" aria-label="Next">
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
									</c:if>
			
			
			
			
			
			
			
			
			
			
			
			
			
				
					</div>
				</div>
			</div>
			<!-- 바디 영역 -->
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