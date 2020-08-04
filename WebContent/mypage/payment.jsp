<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%--로그인유무 확인 --%>
<c:if test="${sessionScope.id == null}">
   <script>
      	alert("로그인 후 이용가능합니다.");
      	location.href="${contextPath}/member/login.do";
   </script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<%-- <link rel="stylesheet" href="${contextPath}/mypage/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath}/mypage/css/custom.css"> --%>

<!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery(부트스트랩의 자바스크립트 플러그인을 위해 필요)-->
    <script src="http://code.jquery.com/jquery.js"></script> 
    <!-- 모든 합쳐진 플러그인을 포함하거나 필요한 파일을 포함 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Respond.js으로 IE8에서 반응형 기능활성화 -->
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    
    
<script type="text/javascript">
	function btnPayment(){
		if(confirm("결제를 진행하시겠습니까?")){
			location.href="${contextPath}/Order/PaymentAction.do?id=${payVO.id}&num=${payVO.num}";
		}else{
			return false;
		}
	}

</script>

<meta charset="UTF-8">
<title>결제페이지</title>
<style type="text/css">
	a:hover{
		color:red;
	}
	
	a{
		color:blue;
		text-decoration: none;
	}
</style>
</head>
<body>


  <jsp:include page="../include/header.jsp" />

	<div class="container" style="margin-top: 50px; margin-bottom: 10px;">
	<div class="page-header">
  
    	<h1 style="margin-top: 10px;">Payment</h1>
   
    </div>
	 	<div class="row">
	 		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd; margin-top: 50px;">
	 			<thead>
	 				<tr>
	 					<th style="background-color: #eeeeee; text-align: center;">번호</th>
	 					<th style="background-color: #eeeeee; text-align: center;">주문자</th>
	 					<th style="background-color: #eeeeee; text-align: center;">공연명</th>
	 					<th style="background-color: #eeeeee; text-align: center;">수량</th>
	 					<th style="background-color: #eeeeee; text-align: center;">가격</th>
	 					<th style="background-color: #eeeeee; text-align: center;">주문일자</th>
	 					<th style="background-color: #eeeeee; text-align: center;">주문취소</th>
	 					
	 				</tr>
	 			</thead>
	 			<tbody>
 			<c:if test="${!empty payVO}">
				
	 				<tr>
	 					<td>${payVO.num}</td>
	 					<td>${payVO.id}</td>
	 					<td>${payVO.name}</td>
	 					<td>${payVO.qty}</td>
	 					<td>${payVO.totalprice}</td>
	 					<td>${payVO.orderdate}</td>
	 					<td><a href="${contextPath}/Order/delCart.do?num=${payVO.num}&id=${payVO.id}">주문취소</a></td>
	 				</tr>
	 			
	 		</c:if>	
	 		<c:if test="${empty payVO}">
	 			<tr>
				<td colspan="7">추가된 상품이 없습니다.</td>
				</tr>
			</c:if>
				
			

	 			</tbody>
	 		</table>
	 		총 금액 : <fmt:formatNumber pattern="###,###,###" value="${total}"/>
	 		
	 		<form action="${contextPath}/Order/kakaoOrder.do" method="post">
	 			<input type="hidden" name="num" value="${payVO.num}">
				<input type="hidden" name="id" value="${payVO.id}">							
				<input type="hidden" name="name" value="${payVO.name}">
				<input type="hidden" name="qty" value="${payVO.qty}">
				<input type="hidden" name="totalprice" value="${payVO.totalprice}">
				<input type="hidden" name="orderdate" value="${payVO.orderdate}">
				<input type="submit" value="카카오페이 결제" class="btn btn-warning pull-right" style="background-color: #EB008B !important; border-color: #EB008B !important; color: #fff !important; margin-bottom: 50px; margin-left: 10px; margin-top: 100px;">
				<button type="button" onclick="btnPayment()" class="btn btn-primary pull-right" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important; margin-bottom: 50px;  margin-left: 10px; margin-top: 100px;">포인트 결제</button>
			<button onclick="location.href='${contextPath}/index.jsp'" class="btn btn-primary pull-right" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important; margin-bottom: 50px; margin-left: 450px; margin-top: 100px;">메인으로</button>
			</form>			
			
	 	</div>
	 </div>
	



   <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->

    <script src="${contextPath}/mypage/js/bootstrap.js"></script>
    
    
    <jsp:include page="../include/footer.jsp" />
    
</body>
</html>