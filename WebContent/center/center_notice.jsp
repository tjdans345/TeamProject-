<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>



<!DOCTYPE html>
<html lang="en">
  <head>
  <script type="text/javascript">
  function test(t) {
	  f.action = "${contextPath}/notice/listNotice.do";
	  f.submit();
}

  </script>
  
  
    <title>공지사항</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/lux/bootstrap.min.css">
<!-- 부트스트랩 -->
    
	<jsp:include page="../include/header.jsp"></jsp:include>
    <!-- END nav -->
</head>
<body style="font-family: 'Nanum Gothic Coding', monospace;">
 <!--    <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
			<div class="container">
        		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          			<div class="col-md-9 ftco-animate text-center">
						<h1 class="mb-3 bread">Contact Us</h1>
						<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Contact</span></p>
					</div>
				</div>
			</div>
	</section>
 -->   
 
  <section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row block-9" style="margin-top: 50px;">
				<%-- <div class="col-md-2 contact-info ftco-animate p-4 w-100 h-500">
					<div class="row">      
		            	<div class="col-md-12 mb-3">
							<p><a href="${contextPath}/notice/listNotice.do"><span>공지사항</span></a></p>
						</div>
						<div class="col-md-12 mb-3">
							<p><span>이용안내</span> <a href="tel://1234567920"></a></p>
						</div>
						<div class="col-md-12 mb-3">
							<p><a href="${contextPath}/fboard/faqlist.do"><span>F&Q</span></a></p>
			            </div>
		            	<div class="col-md-12 mb-3">
			            	<c:choose>
				            	<c:when test="${id != null}">
			              				<p><a href="${contextPath}/qboard/qnaList.do"><span>나의 문의 내역</span></a> </p>
			            		</c:when>
			            		<c:when test="${id == null}">
			            				<p><a href="${contextPath}/member/login.do"><span>나의 문의 내역</span></a>	</p>
			            		</c:when>
			            	</c:choose>
		            	</div>
	            	</div>
				</div> --%>
			<div class="col-md-10">
			
			
<!-- 탭메뉴 -->

<ul class="nav nav-tabs" style="font-size: 14px;">
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link"  href="${contextPath}/notice/listNotice.do" style="padding: 15px 85px 15px 85px;">
   	 공지사항
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link active" href="${contextPath}/board/info2.jsp" style="padding: 15px 85px 15px 85px;">
	 이용안내
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link active"  href="${contextPath}/fboard/faqlist.do" style="padding: 15px 100px 15px 100px;">
    FAQ
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
  
	  <c:choose>
	   	<c:when test="${id != null}">
	    		<a class="nav-link active"  href="${contextPath}/qboard/qnaList.do" style="padding: 15px 70px 15px 70px;">
	    		나의 문의 내역
	    		</a>
	  		</c:when>
	  		<c:when test="${id == null}">
	  			<a class="nav-link active"  href="${contextPath}/member/login.do" style="padding: 15px 70px 15px 70px;">
	  			나의 문의 내역
	  			</a>
	  		</c:when>
	  	</c:choose>

  </li>
</ul>			
			


<!-- 셀렉트 박스 -->
 <div class="form-group" style="clear: both; margin: 30px 0 0 0;">
 	<form action="#" name=f method="post">
        <select class="form-control" id="exampleSelect1" onchange="location.href=this.value" name="n_cate">
        <option>항목을 선택하세요</option>
        <option value="${contextPath}/notice/listNotice.do?n_cate=서비스 소식">서비스 소식</option>
        <option value="${contextPath}/notice/listNotice.do?n_cate=서비스 점검">서비스 점검</option>
        <option value="${contextPath}/notice/listNotice.do?n_cate=안내">안내</option>
      </select>
      </form>
    </div>


<%-- 
			<div style="clear: both;">
				<form action="#" name=f method="post">
				<select onchange="location.href=this.value" name="n_cate">
					<option>항목을 선택하세요</option>
					<option value="${contextPath}/notice/listNotice.do?n_cate=서비스 소식">서비스 소식</option>
					<option value="${contextPath}/notice/listNotice.do?n_cate=서비스 점검">서비스 점검</option>
					<option value="${contextPath}/notice/listNotice.do?n_cate=안내">안내</option>
				</select>
				</form>
			</div>

 --%>			
 
 
<!-- 공지사항 -->			
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
											<a href="${contextPath}/notice/viewNotice.do?n_num=${notice.n_num}">
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
			
			<!--페이징 -->
				<c:choose>
					<c:when test="${requestScope.n_cate != null}">
	                    <c:if test="${blockFirst!=1}">
	                        <a href="${contextPath}/notice/listNotice.do?nowPage=${blockFirst-blockSize}&n_cate=${n_cate}"></a>
	                    </c:if>
	                    <c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
	                    	<a href="${contextPath }/notice/listNotice.do?nowPage=${i}&n_cate=${n_cate}">${i}</a>
	                    </c:forEach>
	                    <c:if test="${blockLast!=totalPage}">
	                        <a href="${contextPath}/notice/listNotice.do?nowPage=${blockLast+1}&n_cate=${n_cate}"></a>                    
	                    </c:if>
                 	</c:when>
                 	
                 	<c:otherwise>
	                 	<c:if test="${blockFirst!=1}">
	                        <a href="${contextPath}/notice/listNotice.do?nowPage=${blockFirst-blockSize}"></a>
	                    </c:if>
	                    <c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
	                    	<a href="${contextPath }/notice/listNotice.do?nowPage=${i}">${i}</a>
	                    </c:forEach>
	                    <c:if test="${blockLast!=totalPage}">
	                        <a href="${contextPath}/notice/listNotice.do?nowPage=${blockLast+1}"></a>                    
	                    </c:if>
                 	</c:otherwise>   
                    
				</c:choose>
			<!--페이징 -->
				<c:if test="${is_admin == 1}">
        			<a href="${contextPath}/notice/noticeForm.do"><input type="button" value="글쓰기"></a>
				</c:if>
				</form>
			</div>
        </div>
	</div>
</section>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../include/footer.jsp"/>
    
  </body>
</html>