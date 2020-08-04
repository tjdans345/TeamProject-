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
	function delete2(){     
		 	alert("호출");
         	document.frm1.action=${contextPath}+"/admin/MemberDel.do";      
         	document.frm1.submit();
	}
	function update() {
		frm1.action="/${contextPath}admin/MemberMod.do";      	
	}
	</script>
  </head>
  <body>
 	 <!-- 해더 부분 -->
  	<jsp:include page="../include/header.jsp" />
 	 <!-- 해더 부분 -->
    <!-- END nav -->


    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
         <div align="center"> <h2 class="mb-3">회원 정보 수정</h2></div>
    
            <!-- 회원 정보 뿌려주는 테이블 -->
            <form action="#" name="frm1" method="post" id="frm1">
            <table align="center" border="1" with="100%" font-size="20px">
			<tr height="10" align="center" bgcolor="lightpink">
            		<th>아이디</th>
            		<th>이름</th>
            		<th>이메일</th>
            		<th>우편번호</th>
            		<th>주소1</th>
            		<th>주소2</th>
            		<th>휴대폰 번호</th>
            		<th>정보 수정</th>
            	</tr>
            	<c:forEach var="memberlist" items="${list}" varStatus="membersNum">
            	<tr>
            		<td><b>${memberlist.id}</b></td>
            		<td with="20%">${memberlist.name}</td>
            		<td with="20%">${memberlist.email}</td>
            		<td>${memberlist.zipcode}</td>
            		<td with="35%">${memberlist.address1}</td>
            		<td with="35%">${memberlist.address2}</td>
            		<td with="15%">${memberlist.phone}</td>
            		<td>
            		<input type="button" onclick="location.href='${contextPath}/admin/MemberView.do?id=${memberlist.id}&nowpage=${nowpage}'" value="정보 조회">
            		</td>
            	</tr>
            	</c:forEach>
            </table>
            </form>
			<div align="center">
			<c:if test="${nowpage>blocksize}">
				<a href="${contextPath}/admin/MemberModify.do?nowpage=${blockfirst-blocksize}">[이전]</a>
			</c:if>
			<c:forEach begin="${blockfirst}" end="${blocklast}" var="i">
				<a href="${contextPath}/admin/MemberModify.do?nowpage=${i}">${i}</a>
			</c:forEach>
			<c:if test="${blocklast != totalPage }">
				<a href="${contextPath}/admin/MemberModify.do?nowpage=${blocklast+1}">[다음]</a>
			</c:if>
			</div>
			
			<div align="right">
			
			</div>
          </div> <!-- .col-md-8 -->
          <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box">
            
              <!-- 검색창 -->
              <form action="${contextPath}/admin/MemberModify.do" class="search-form" method="post">
                <div class="form-group">
                	<div class="icon">
	                  <span class="icon-search"></span>
	                </div>
                  <input type="text" name="search" >
                </div>
                	<select name="selectserach" id="selectserach">
	                  	<option value="id" selected="selected">아이디</option>
	                  	<option value="name">이름</option>
	                  	</select>
                <input type="submit" value="검색">
              </form>
              <!-- 검색창 -->
              
              <!-- 사이드 네비 창 -->
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3 class="heading-2">관리자 목 록</h3>
                <li><a href="${contextPath}/admin/MemberMan.do">회원 관리 <span>(12)</span></a></li>
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