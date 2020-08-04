<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test="${id !='admin'}">
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
	
	</script>
  </head>
  <body>
 	 <!-- 해더 부분 -->
  	<jsp:include page="../include/header.jsp" />
 	 <!-- 해더 부분 -->
    <!-- END nav -->
	<div align="center">
    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
         <div align="center"> <h2 class="mb-3">신규 회원 관리</h2></div>
          
    <!-- 총회원수 출력 -->        
  	<section class="ftco-counter img" id="section-counter" style="background-image: ${contextPath}/url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center">
        	<div class="col-md-10">
        		<div class="row">
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="${total}"></strong>
		              	<span>일일 신규 가입</span>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
        </div>
      </div>
       <form action="#" name="frm1" method="post" id="frm1">
            <table align="center" border="1" with="100%" font-size="20px">
			<tr height="10" align="center" bgcolor="lightpink">
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            	</tr>
            	<tr>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            	</tr>
            </table>
            </form>
      
    </section>
    <section class="ftco-counter img" id="section-counter" style="background-image: ${contextPath}/url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center">
        	<div class="col-md-10">
        		<div class="row">
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="${total}"></strong>
		              	<span>주간 신규 가입</span>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
        </div>
      </div>
       <form action="#" name="frm1" method="post" id="frm1">
            <table align="center" border="1" with="100%" font-size="20px">
			<tr height="10" align="center" bgcolor="lightpink">
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            	</tr>
            	<tr>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            	</tr>
            </table>
            </form>
      
    </section>
    
    <section class="ftco-counter img" id="section-counter" style="background-image: ${contextPath}/url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center">
        	<div class="col-md-10">
        		<div class="row">
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="${total}"></strong>
		              	<span>월간 신규 가입</span>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
        </div>
      </div>
       <form action="#" name="frm1" method="post" id="frm1">
            <table align="center" border="1" with="100%" font-size="20px">
			<tr height="10" align="center" bgcolor="lightpink">
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            		<th>#</th>
            	</tr>
            	<tr>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            		<td>#</td>
            	</tr>
            </table>
            </form>
    </section>
          </div> <!-- .col-md-8 -->
    </section> <!-- .section -->
	</div>
<!-- 푸터 부분 -->
  <jsp:include page="../include/footer.jsp" />
<!-- 푸터 부분 -->    
  </body>
</html>