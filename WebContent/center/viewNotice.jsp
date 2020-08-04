<%@page import="noticeboard.NoticeboardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="../include/header.jsp"></jsp:include>

	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<link rel="stylesheet" href="../css/style.css" />
	
	<script src="../js/jquery-3.4.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>

</head>
<body style="font-family: 'Nanum Gothic Coding', monospace;">


<%--  	<section>
    	<div class="col-md-6 ftco-animate py-md-5">
			<form method="post" action="${contextPath}/notice/modNoticePage.do?n_num=${notice.n_num}" name="modNotice">
            	<div class="form-group">
              		<input type="hidden" name="n_num" value="${notice.n_num}">
                	<label>제목 : ${notice.n_title}</label>
              	</div>
              	<div class="form-group">
 					<label>분류 : ${notice.n_cate}</label>
              	</div>
              	<div class="form-group">
                	<label>관리자</label>
              	</div>                              
              	<div class="form-group">
                	<label>내용 : ${notice.n_content}</label>
              	</div>
              	<div class="form-group">
              		<label>좋아요<span><ion-icon name="heart" size="large"></ion-icon>${requestScope.likeCount}</span></label>
              	<c:if test="${sessionScope.id != null}">	
              		<c:choose>
              			<c:when test="${requestScope.checkZ == 'false'}">
              				<a href="${contextPath}/mycon/likeAction.do?id=${sessionScope.id}&n_num=${notice.n_num}">
								<input type="button" value="찜하기">
              				</a>
              				
              			</c:when>
              			
              			<c:when test="${requestScope.checkZ == 'true'}">
              				<a href="${contextPath}/mycon/likeAction.do?id=${sessionScope.id}&n_num=${notice.n_num}">
								<input type="button" value="찜한 상품">
              				</a>
              			</c:when>
              		</c:choose>
              	  </c:if>		
              	</div>
              	<c:if test="${is_admin == 1}">
        			<input type=submit value="수정하기">
 					<a href="${contextPath}/notice/deleteNotice.do?n_num=${notice.n_num}">
 						<input type="button" value="삭제하기">
 					</a>
 				</c:if>
			</form>
		</div>
	</section>
	 --%>
	
<section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row block-9" style="margin-top: 50px;">
			
			<div class="col-md-10">	
			
			
<!-- 탭메뉴 -->	
<ul class="nav nav-tabs" style="font-size: 14px;">
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link"  href="${contextPath}/notice/listNotice.do" style="padding: 15px 85px 15px 85px;">
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
			
	
	
<!-- 게시판 -->
		<article class="mt-3">
				<table class="table" style="margin-top: 50px;">
					<colgroup>
						<col style="max-width: 15%" />
						<col />
					</colgroup>
					<tr>
						<th class="align-middle">
							<label for="poolName" class="m-0">제목</label>
						</th>
						<td>
						
<!-- 						<input class="form-control" type="text" name="poolName" id="poolName" required /> -->
							<label>${notice.n_title}</label>
						</td>
					</tr>
					
					<tr>
						<th class="align-middle">
							<label for="poolAddress1" class="m-0">분류</label>
						</th>
						<td>
							<label>${notice.n_cate}</label>
						</td>
					</tr>
					
					<tr>
						<th class="align-middle">
							<label for="poolAddress1" class="m-0">작성자</label>
						</th>
						<td>
							<label>관리자</label>
						</td>
					</tr>
					
					<tr>
						<th class="align-middle">
							<label for="contents" class="m-0">내용</label>
						</th>
						<td>
							${notice.n_content}  <br><br><br>
						</td>
					</tr>	
		
					
					
				<c:if test="${is_admin == 1}">
        			<input type=submit value="수정하기">
 					<a href="${contextPath}/notice/deleteNotice.do?n_num=${notice.n_num}">
 						<input type="button" value="삭제하기">
 					</a>
 				</c:if>

					
					
				</table>
				<div class="text-center my-5">
					<button type="button" class="btn btn-secondary" onclick="history.back()">돌아가기</button>
				</div>
		</article>
<!-- 게시판 -->	
	

			</div>
		</div>
	</div>
</section>	
	
	
	
	
	
	<!-- footer -->
   	<jsp:include page="../include/footer.jsp"></jsp:include>
   	<!-- footer -->
  </body>
</html>