<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
  
    <title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
   
  </head>
  <body>
  	<jsp:include page="../include/subheader.jsp" />
    <!-- END nav -->

    

    <section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
      <div class="container">
        <div class="row block-9">
			<div class="col-md-4 contact-info ftco-animate p-4 w-100 py-md-5">
				<div class="row">
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/member/pwCheckForm.do">내 정보수정</a></p>
		            </div>
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/member/updateProfile.do">프로필 이미지</a></p>
		            </div>
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/member/address.do">배송지 관리</a></p>
		            </div>
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/mycon/likelistForm.do">좋아요 리스트</a></p>
		            </div>
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/Order/cartList.do">장바구니</a></p>
		            </div>
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/Order/payList.do">결제내역보기</a></p>
		            </div>
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/mycon/addpointForm.do">포인트충전</a></p>
		            </div>
		            <div class="col-md-12 mb-3">
		              <p style="font-size: 16px;"><a href="${contextPath}/mycon/pointList.do">포인트충전 신청내역조회</a></p>
		            </div>
				</div>
			</div>  
			
 <table border="1" font-size="30px"  style="width:50%; margin: 100px; text-align: center;" >      
 	<tbody>
    	<tr>
        	<td width="50%;" height="300px;" >
    			<c:choose> 
     				<c:when test="${!empty profile_img}">
	       				<img src="${contextPath}/upload/${profile_img}" alt="프로필 이미지" style="max-width: 250px;">
     				</c:when>
     
    				<c:when test="${empty profile_img}">
						<img src="${contextPath}/images/icon.png" style="max-width: 250px;">
  					</c:when>
   				</c:choose>    
       		</td>  
          <td>예매 내역 : <a href="${contextPath}/Order/cartList.do?id=${sessionScope.id}">${sessionScope.cartCount}</a></td>
        </tr>
      
   <tbody>
      <tr>
        <td  height="150px">${sessionScope.id}</td>
        <td rowspan="2">문의 내역</td>
      </tr>
        <tr>
          <td height="150px">${sessionScope.name}</td>
        </tr>
        <tr>
        	<td>결제 내역 : <a href="${contextPath}/Order/payList.do?id=${sessionScope.id}">${requestScope.payCount}</a></td>
        </tr>
      </tbody>
</table>



 <jsp:include page="../include/footer.jsp" />

    
  </body>
</html>