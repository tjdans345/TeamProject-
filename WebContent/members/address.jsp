<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery(부트스트랩의 자바스크립트 플러그인을 위해 필요)-->
    <script src="http://code.jquery.com/jquery.js"></script> 
    <!-- 모든 합쳐진 플러그인을 포함하거나 필요한 파일을 포함 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Respond.js으로 IE8에서 반응형 기능활성화 -->
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

<!-- Daum postcode API -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

	function address_check(num){
		if(num == '1'){
			document.getElementById("Naddress").style.display = "none";
			document.getElementById("Baddress").style.display = "";
		}else{
			document.getElementById("Baddress").style.display="none";
			document.getElementById("Naddress").style.display="";
		}
	}
	
		
</script>

<title>address</title>
</head>
<body>


<jsp:include page="../include/subheader.jsp" />

<div class="container" style="width: 70%;">
	<div class="page-header">
  
    	<h1 style="margin-top: 50px;">Shipping address</h1>
    <hr/>
    </div>
    <div class="radio">
    	<input type="radio" id="address_1" name="total" onclick="address_check(1)" checked="checked">
    		<label class="username" for="address_1">기본주소</label>
    </div>
    
    <div class="radio">
    	<input type="radio" id="address_2" name="total" onclick="address_check(2)">
    		<label class="username" for="address_2">새로운 주소</label>
    </div>
    
    <div id="Baddress">
		<form action="${contextPath}/member/BaddressAction.do" method="post" name="addressForm">
			<input type="hidden" name="id" value="${memberBean.id}">
			<div class="form-group">
				<label class="username">받는사람</label>
				<input type="text" name="rpname" id="name" class="form-control" value="${memberBean.name}"> 
			</div>
	        <div class="form-group">
		        <label class="username">주소</label>
			        <div class="input-group">
				        <input type="text" id="zip" name="zipcode" class="form-control" readonly value="${memberBean.zipcode}">
					        <span class="input-group-btn">
					        	<button type="button" class="btn btn-success" style="background-color: #EB008B !important; border-color: #EB008B !important; color: #fff !important;" id="search" onclick="daumPostcode()">우편번호 찾기<i class="fa fa-mail-forward spaceLeft"></i></button>
					        </span>
			        </div>
		        <input type="text" id="address1" name="address1" class="form-control" readonly value="${memberBean.address1}">
		        <input type="text" id="address2" name="address2" class="form-control" placeholder="상세주소를 입력하여 주세요" value="${memberBean.address2}"><br> 
	        </div>
			
			<div class="form-group text-center">
	              <input type="submit" class="btn btn-info" value="배송지 수정">
	              <button type="button" class="btn btn-warning" onclick="location.href='../index.jsp';">메인으로</button>
	        </div>
		</form>
	</div>
	
	<div id="Naddress" style="display:none;">
		<form action="${contextPath}/member/NaddressAction.do" method="post" name="addressForm2">
			<input type="hidden" name="id" value="${memberBean.id}">
			<div class="form-group">
				<label class="username">받는사람</label>
				<input type="text" name="rpname" id="name" class="form-control" > 
			</div>
	        <div class="form-group">
		        <label class="username">주소</label>
			        <div class="input-group">
				        <input type="text" id="Lzip" name="Lzipcode" class="form-control" readonly>
					        <span class="input-group-btn">
					        	<button type="button" class="btn btn-success" id="search" onclick="daumPostcode2()">우편번호 찾기<i class="fa fa-mail-forward spaceLeft"></i></button>
					        </span>
			        </div>
		        <input type="text" id="Laddress1" name="Laddress1" class="form-control" readonly >
		        <input type="text" id="Laddress2" name="Laddress2" class="form-control" placeholder="상세주소를 입력하여 주세요"><br> 
	        </div>
			
			
			<div class="form-group text-center">
	              <input type="submit" class="btn btn-info" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important; margin-bottom: 50px;" value="배송지 수정">
	              <button type="button" class="btn btn-warning" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important; margin-bottom: 50px;" onclick="location.href='${contextPath}'">메인으로</button>
	        </div>
		</form>
	</div>
</div>
<script src="../js/address.js"></script> 


<jsp:include page="../include/footer.jsp" />

</body>
</html>