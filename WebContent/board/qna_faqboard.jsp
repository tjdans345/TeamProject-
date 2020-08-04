<%@page import="java.sql.Date"%>
<%@page import="team.faqboard.faqBean"%>
<%@page import="java.util.List"%>
<%@page import="team.faqboard.faqDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

%>

<%--컨텍스트 주소 얻기 --%>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>

 

<script>
	//검색창
	function check(){
		//검색어를 입력하지 않았다면
		if(document.sr.search.value == ""){
			//경고메세지
			alert("검색어를 입력하세요.");
			//검색어 입력 공간에 포커스를 주어 검색어를 입력하도록 유도함.
			document.sr.search.focus();
			return;
		}
		//검색어를 입력 했다면 폼을 전송한다
		document.sr.submit();
	}
	
	
	
	
	
</script>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 사항</title>

<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css" />

<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/lux/bootstrap.min.css">
<!-- 부트스트랩 -->

<jsp:include page="../include/header.jsp"/>


</head>
<body style="text-align: center; font-family: 'Nanum Gothic Coding', monospace;">
<!-- 
   <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
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
<%-- 				<div class="col-md-2 contact-info ftco-animate p-4 w-100 h-500">
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
	<c:forEach items="${list}" var="A">
	<c:if test="${A.faq_num}>1">
		${A.faq_num}
	</c:if>
		
	</c:forEach>
	

	
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
    <a class="nav-link"  href="${contextPath}/fboard/faqlist.do" style="padding: 15px 100px 15px 100px;">
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

	
	
<!-- 1:1문의버튼  -->			
<button type="button" class="btn btn-outline-primary" style="float: right; margin: 30px 0 2px 0;"
		onclick="location.href='${contextPath}/qboard/qwriteForm.do'">1:1문의하기</button>
	
	
	
<!-- 카테고리 클릭시 해당 카테고리 목록출력 -->
   <div class="btn-group w-100" style="width: 100%!important; clear: both;">
		<a href="${contextPath}/fboard/faqlist.do" class="btn btn-dark btn-lg bt">전체</a> 
		<a href="${contextPath}/fboard/faqlist.do?category=&search=티켓예매" class="btn btn-dark btn-lg bt">티켓예매</a> 
		<a href="${contextPath}/fboard/faqlist.do?category=&search=취소/환불" class="btn btn-dark btn-lg bt">취소/환불</a> 
		<a href="${contextPath}/fboard/faqlist.do?category=&search=티켓수령"	class="btn btn-dark btn-lg bt">티켓수령</a> 
		<a href="${contextPath}/fboard/faqlist.do?category=&search=회원" class="btn btn-dark btn-lg bt">회원</a> 
		<a href="${contextPath}/fboard/faqlist.do?category=&search=이벤트" class="btn btn-dark btn-lg bt">이벤트</a>
	</div>
				
				
            
	

	<section class="container body-container py-5" style="clear: both;">
		<div class="row">
			<div class="col-12 col-lg-4">
<!-- 				<h2> F A Q </h2> -->				
			</div>
			<div class="col-12 col-lg-8 text-right mt-lg-3">
				<small>클릭해서 상세정보를 확인하세요.</small>
				<button type="button" class="btn btn-sm btn-outline-secondary ml-3" onclick="hideContent()">모두 접기</button>
			</div> 
		</div>
		<!-- 게시판 -->
		<article class="mt-3">
			<table class="table text-center" id="tb01">

				<colgroup class="d-lg-none">
					<col />
					<col style="width:54px"/>
					<col style="width:54px"/>
					<col style="width:54px"/>
				</colgroup>
				<colgroup class="d-none d-lg-table-column-group">
					<col style="width:240px"/>
					<col />
					<col style="width:160px"/>
					<col style="width:120px"/>
					<col style="width:120px"/>
				</colgroup>
				
					<tr>
						<th width="10%">NO.</th>
						<th width="20%">분류</th>
						<th width="80%">제목</th>
					</tr>
			 
				<tbody>
					
					<c:if test="${count > 0}">
						<c:forEach var="articlesList" items="${articlesList}" varStatus="articlesNum">
						<tr onclick="toggleContent(this)" style="cursor:pointer">
							<td class="align-middle text-left" style="text-align: center;">
								${articlesList.faq_num}
								<small class="d-block d-lg-none mt-1 text-muted">${articlesList.faq_num}</small>
							</td>
							<td class="align-middle d-none d-lg-table-cell text-left" id="fcate">${articlesList.faq_cate}</td>
							<td class="align-middle">
								${articlesList.faq_title}
							</td>
							
						</tr>
						<tr class="poolcontent" style="display:none">
							<td colspan="5" class="py-5">
								<div class="text-left break-all" style="padding: 0 120px 0 100px;">${articlesList.faq_contents}</div>
								<%-- <%
									if (userId != null && userId.equals("admin")) {
								%>
									<div class="text-right mt-3">
										<button type="button" class="btn btn-sm btn-warning" onclick="location.href='poolUpdate.jsp?pageNum=<%=pageNum%>&poolNum=<%=poolNum%>'">수정</button>
										<button type="button" class="btn btn-sm btn-danger" onclick="location.href='poolDelete.jsp?pageNum=<%=pageNum%>&poolNum=<%=poolNum%>'">삭제</button>
									</div>
								<% 
									}
								%> --%>
								<div class="text-right mt-3">
										<button type="button" class="btn btn-sm btn-warning" 
												onclick="location.href='${contextPath}/fboard/faqUpdateForm.do?faq_num=${articlesList.faq_num}'">수정</button>
										<button type="button" class="btn btn-sm btn-danger" 
												onclick="location.href='${contextPath}/fboard/faqDelete.do?faq_num=${articlesList.faq_num}'">삭제</button>
								</div>
								
							</td>
						</tr>
					</c:forEach>
					</c:if> 
					<c:if test="${count == 0 }">
						<tr>
							<td colspan="4">등록된 글이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div class="row  my-5">
				<div class="col-12 col-lg-8">
					<form action="${contextPath}/fboard/faqlist.do" name="sr" class="form-inline justify-content-center justify-content-lg-start">
						<input type="hidden" name="category" value="" />
						<div class="input-group">
							<input type="text" name="search" size="24" maxlength="24" class="form-control">
							<div class="input-group-append">
								<button type="submit" class="btn btn-secondary" onClick="check()">검색</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-12 col-lg-4 mt-3 mt-lg-0">
					<c:if test="${is_admin == 1}">
						<div class="form-group text-center text-lg-right">
							<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/fboard/fwriteForm.do'">글쓰기</button>
						</div>
					</c:if>
				</div>
			</div>
			<div class="row">
				<div class="col-12">				
					<ul class="pagination justify-content-center">
					
		<%-- 페이징처리 --%>			
 		<c:if test="${nowpage > blocksize}">
			<li class="page-item">
				<a class="page-link" href="${contextPath}/fboard/faqlist.do?nowpage=${blockfirst - blocksize}&search=${search}">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${blockfirst}" end="${blocklast}" step="1" var="li">
		<li class="page-item active">
			<a class="page-link" href="${contextPath}/fboard/faqlist.do?nowpage=${li}&search=${search}">${li}</a>
		</li>
		</c:forEach>
		
		<c:if test="${blocklast != totalpage}">
			<li class="page-item">
				<a class="page-link" href="${contextPath}/fboard/faqlist.do?nowpage=${blocklast + 1}&search=${search}">다음</a>
			</li>
		</c:if>
		
		
			
					</ul>
				</div>
			</div>
		</article>
		<!-- 게시판 -->
	</section>
<%-- 	<jsp:include page="../include/footer.jsp" /> --%>
	<script>
		function toggleContent(obj){
			$(obj).next().toggle();
		}
		function hideContent(){
			$(".poolcontent").hide();
		}
	</script>
	
	
	</div>
	</div>
	</div>
	</section>

<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>