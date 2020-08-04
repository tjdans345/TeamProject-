<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
<%
//한글처리
request.setCharacterEncoding("UTF-8");
%>
<%--로그인유무 확인 --%>
<c:if test="${sessionScope.id == null}">
   <script>
      	alert("로그인 후 이용가능합니다.");
      	location.href="${contextPath}/member/login.do";
   </script>
</c:if>
<%--컨텍스트 주소 얻기 --%>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/lux/bootstrap.min.css">
<!-- 부트스트랩 -->

<jsp:include page="../include/header.jsp"/>

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
	</section> -->
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
    <a class="nav-link active"  href="${contextPath}/notice/listNotice.do" style="padding: 15px 85px 15px 85px;">
   	 공지사항
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link active"  href="${contextPath}/board/info2.jsp" style="padding: 15px 85px 15px 85px;">
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
	    		<a class="nav-link"  href="${contextPath}/qboard/qnaList.do" style="padding: 15px 70px 15px 70px;">
	    		나의 문의 내역
	    		</a>
	  		</c:when>
	  		<c:when test="${id == null}">
	  			<a class="nav-link"  href="${contextPath}/member/login.do" style="padding: 15px 70px 15px 70px;">
	  			나의 문의 내역
	  			</a>
	  		</c:when>
	  	</c:choose>

  </li>
</ul>			

<!-- 1:1문의버튼  -->			
<button type="button" class="btn btn-outline-primary" style="float: right; margin: 30px 0 0 0;"
		onclick="location.href='${contextPath}/qboard/qwriteForm.do'">1:1문의하기</button>
<%-- 
			<div>
				<button type="button" onclick="location.href='${contextPath}/qboard/qwriteForm.do'">1:1문의하기</button>
			</div>
--%>
			
			<form action="${contextPath}/qboard/qnaList.do" method="post" style="clear: both;">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
<br><br>
				  		<table class="table table-hover" id="table1">
							<tr>
								<td class="tno"><b>No.</b></td>
							    <td class="ttitle"><b>처리상태</b></td>
							    <td class="twrite"><b>제목</b></td>
							    <td class="tdate"><b>등록일</b></td>
							</tr>
					 		<c:choose>
					  			<c:when test="${requestScope.qnaList == null}">
					  				<tr height="10">
										<td colspan="4">
											<p align="center"><b>등록된 글이 없습니다.</b></p>
										</td>   				
					  				</tr>
					  			</c:when>
					  			<c:when test="${total != 0}">
					 				<c:forEach var="qnaList" items="${qnaList}" varStatus="status">
					  					<tr>
					   						<td>${qnaList.qna_num}</td>
					   						<td>			
					   							<c:if test="${qnaList.qna_status == 0}"><font color="crimson;">대기중</font></c:if>
					   							<c:if test="${qnaList.qna_status == 1}"><font color="limegreen;">답변완료</font></c:if>
											</td>
					   						<td>
					   						<a href="${contextPath}/qboard/viewQna.do?qna_num=${qnaList.qna_num}">${qnaList.qna_title}</a>
					   						</td>
					   						<td><fmt:formatDate value="${qnaList.qna_date}" type="DATE" pattern="yyyy-MM-dd"/></td>
					   					</tr>
					   				</c:forEach>	
					   			</c:when>
					   		</c:choose> 				
						</table>
					</div>
				</div>
<!--테이블  -->
			
<!--페이징 -->
				<c:if test="${blockFirst!=1}">
					<a href="${contextPath}/qboard/qnaList.do?nowPage=${blockFirst-blockSize}&id=${id}"></a>
				</c:if>
					<c:forEach var="i" begin="${blockFirst}" end="${blockLast}" step="1">
				 	<a href="${contextPath }/qboard/qnaList.do?nowPage=${i}">${i}</a>
				</c:forEach>
				<c:if test="${blockLast!=totalPage}">
				    <a href="${contextPath}/qboard/qnaList.do?nowPage=${blockLast+1}&id=${id}"></a>                    
				</c:if>
<!--페이징 -->
				</form>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../include/footer.jsp"></jsp:include>


</body>
</html>