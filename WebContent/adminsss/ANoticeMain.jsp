<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test="${is_admin != 1}">
	<script>
	window.location.href = '${contextPath}/index/index.jsp';
	</script>
</c:if>
    
<!DOCTYPE html>
<html>
  <head>
  
  <!-- 관리자 페이지 공지사항 관리 -->
  
  <!-- 제이쿼리는 스크립트 안에서 그냥 사용하면 되는구나 ...ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ -->
<script src="//code.jquery.com/jquery.min.js"></script>

	<script type="text/javascript">
	
	
	</script>
  </head>
  <body>
 	 <!-- 해더 부분 -->
  	<jsp:include page="../include/header.jsp" />
 	 <!-- 해더 부분 -->
    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
   			<div align="center"><h2 class="mb-3">공지 사항 관리</h2></div>
            <br><br>
            
           <p>공지사항 </p>
			<div>
				<form action="#" name=f method="post">
				<select onchange="location.href=this.value" name="n_cate">
					<option>항목을 선택하세요</option>
					<option value="${contextPath}/admin/ANoticeMain.do?n_cate=서비스 소식">서비스 소식</option>
					<option value="${contextPath}/admin/ANoticeMain.do?n_cate=서비스 점검">서비스 점검</option>
					<option value="${contextPath}/admin/ANoticeMain.do?n_cate=안내">안내</option>
				</select>
				</form>
			</div>
			
			
			<!--테이블  -->
			<form action="${contextPath}/notice/listNotice.do" method="get">
				<div class="row">
  					<div class="col-md-10 col-md-offset-1">
																						<br><br>
		    		<table class="table table-hover" id="table1">
						<tr>
							<td class="tno"><b>분류</b></td>
						    <td class="ttitle"><b>제목</b></td>
						    <td class="twrite"><b>작성자</b></td>
						    <td class="tdate"><b>날짜</b></td>
						</tr>
  		 				<c:choose>
			   				<c:when test="${requestScope.noticeList == null }">
			   					<tr height="10">
									<td colspan="4">
										<p align="center"><b>등록된 글이 없습니다.</b></p>
									</td>   				
			   					</tr>
			   				</c:when> 
			   				<c:when test="${requestScope.noticeList != null }">
			   					<c:forEach var="notice" items="${noticeList}" varStatus="status">
			   						<tr>
				   						<td>${notice.n_cate}</td>
				   						<td>
											<a href="${contextPath}/admin/AviewNotice.do?n_num=${notice.n_num}">
												${notice.n_title}
											</a>   						
										</td>
				   						<td>관리자</td>
				   						<td>
				   							<fmt:formatDate value="${notice.n_date}" type="DATE" pattern="yyyy-MM-dd"/>
			   							</td>
			   						</tr>
			   					</c:forEach>	
			   				</c:when>
			   			</c:choose> 				
					</table>
				</div>
			</div>
			<!--테이블  -->
			<input type="button" onclick="location.href='${contextPath}/admin/ANoticeWritep.do?'" value="공지 사항 작성" class="btn btn-primary py-3 px-5">
			<input type="button" onclick="location.href='${contextPath}/admin/CustomerMan.do?'" value="고객 센터 관리 페이지" class="btn btn-primary py-3 px-5">
			<div align="center">
			<!--페이징 -->
				<c:choose>
					<c:when test="${requestScope.n_cate != null}">
	                    <c:if test="${blockFirst!=1}">
	                        <a href="${contextPath}/admin/ANoticeMain.do?nowPage=${blockFirst-blockSize}&n_cate=${n_cate}"></a>
	                    </c:if>
	                    <c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
	                    	<a href="${contextPath }/admin/ANoticeMain.do?nowPage=${i}&n_cate=${n_cate}">${i}</a>
	                    </c:forEach>
	                    <c:if test="${blockLast!=totalPage}">
	                        <a href="${contextPath}/admin/ANoticeMain.do?nowPage=${blockLast+1}&n_cate=${n_cate}"></a>                    
	                    </c:if>
                 	</c:when>
                 	
                 	<c:otherwise>
	                 	<c:if test="${blockFirst!=1}">
	                        <a href="${contextPath}/admin/ANoticeMain.do?nowPage=${blockFirst-blockSize}"></a>
	                    </c:if>
	                    <c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
	                    	<a href="${contextPath }/admin/ANoticeMain.do?nowPage=${i}">${i}</a>
	                    </c:forEach>
	                    <c:if test="${blockLast!=totalPage}">
	                        <a href="${contextPath}/admin/ANoticeMain.do?nowPage=${blockLast+1}"></a>                    
	                    </c:if>
                 	</c:otherwise>   
                    
				</c:choose>
			<!--페이징 -->
        		</div>
				</form>
		
			
			
			<div align="right">
			</div>
          </div> <!-- .col-md-8 -->
    </section> <!-- .section -->
<!-- 푸터 부분 -->
  <jsp:include page="../include/footer.jsp" />
<!-- 푸터 부분 -->    
  </body>
</html>