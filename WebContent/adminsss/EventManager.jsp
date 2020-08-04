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
  <!-- 제이쿼리는 스크립트 안에서 그냥 사용하면 되는구나 ...ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ -->
<script src="//code.jquery.com/jquery.min.js"></script>

	<script type="text/javascript">
	
	function Answer(){     
		
		window.location.href = '${contextPath}/admin/Answer.do';
		
		
		
	}
	
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
   			<div align="center"><h2 class="mb-3">이벤트 관리 페이지</h2></div>
            <br><br>
            <input type="button" onclick="#" value="### " class="btn btn-primary py-3 px-5">
            <input type="button" onclick="#" value="###" class="btn btn-primary py-3 px-5">
            <input type="button" onclick="#" value="###" class="btn btn-primary py-3 px-5">
            
            
			
			<div align="right">
			
			</div>
          </div> <!-- .col-md-8 -->
          <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box">
            
              <!-- 사이드 네비 창 -->
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3 class="heading-2">관리자 목 록</h3>
                <li><a href="${contextPath}/admin/MemberMan.do">회원 관리<span>(12)</span></a></li>
                <li><a href="${contextPath}/admin/ProductMan.do">공연 상품 관리 <span>(22)</span></a></li>
                <li><a href="${contextPath}/admin/EventMan.do">이벤트 관리 <span>(37)</span></a></li>
                <li><a href="${contextPath}/admin/CustomerMan.do">고객 센터 관리 <span>(42)</span></a></li>
                <li><a href="#">### <span>(14)</span></a></li>
                <li><a href="#">### <span>(140)</span></a></li>
              </div>
            </div>
			  <!-- 사이드 네비 창 -->
        </div>
      </div>
    </section> <!-- .section -->
<!-- 푸터 부분 -->
  <jsp:include page="../include/footer.jsp" />
<!-- 푸터 부분 -->    
  </body>
</html>