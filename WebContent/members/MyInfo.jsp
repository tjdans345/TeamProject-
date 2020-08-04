<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
 <%--로그인유무 확인 --%>
<c:if test="${sessionScope.id == null}">
   <script>
      	alert("로그인 후 이용가능합니다.");
      	location.href="${contextPath}/member/login.do";
   </script>
</c:if>
 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>팀프</title>
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
	<link href="../css/custom" rel="stylesheet">
	
	<jsp:include page="../include/header.jsp" />

</head>
  <body>
  
  
  
  
  
  
      <div class="container" style="width: 70%;">
        <div class="page-header" style="margin-top: 50px;">
          <h1 style="margin-bottom: 50px;">Information</h1>
          <hr>
        </div>
        
        <div class="col-md-6 col-md-offset-3">
          <form role="form" action="${contextPath}/member/modifyAction.do" method="post" name="modifyForm">
            <div class="form-group">
              <label for="username">아이디</label>
                  <input type="text" class="form-control" id="InputId" name="id" readonly value="${memberBean.id}">
            </div>
            
            <div class="form-group">
              <label for="InputPassword1"><font color="red">*</font>비밀번호</label>
              <input type="password" class="form-control" id="InputPassword1" name="password" value="${memberBean.password}" onblur="checkPwd()">
                <span id="checkPwd1">&nbsp;</span>
            </div>
            
            <div class="form-group">
              <label for="InputPassword2"><font color="red">*</font>비밀번호 확인</label>
              <input type="password" class="form-control" id="InputPassword2" value="${memberBean.password}" onblur="checkPwd2()">
                <span id="checkPwd2">&nbsp;</span>
            </div>
            
            <div class="form-group">
              <label for="username">이름</label>
              <input type="text" class="form-control" id="name" name="name" value="${memberBean.name}" readonly>
            </div>
            
            <div class="form-group">
              <label for="username">휴대폰</label>
                <input type="text" class="form-control" id="phone" name="phone" value="${memberBean.phone}">   
            	<span id="checkPhone">&nbsp;</span>
            </div>
            
            <div class="form-group">
            	<label for="username">이메일</label>
            	  <input type="email" class="form-control" id="email" name="email" value="${memberBean.email}">
            </div>
            
            <div class="form-group">
              <label for="username">주소</label>
               <div class="input-group">
                <input type="text" id="zip" name="zipcode" class="form-control" readonly value="${memberBean.zipcode}">
                 <span class="input-group-btn">
                  <button type="button" class="btn btn-success" style="background-color: #EB008B; border-color: #EB008B; color: #fff; id="search" onclick="daumPostcode()" >우편번호 찾기<i class="fa fa-mail-forward spaceLeft"></i></button>
                 </span>
                </div>
                <input type="text" id="address1" name="address1" class="form-control" readonly value="${memberBean.address1}">
                <input type="text" id="address2" name="address2" class="form-control" placeholder="상세주소를 입력하여 주세요" value="${memberBean.address2}"><br>
           <div class="form-group">
           		<label for="username">보유포인트</label>
           		<input type="text" class="form-control" name="point" id="point" value="${memberBean.point}" readonly>          	           
           </div>
         
           </div>

            <div class="form-group text-center" style="position: relative; left: 350px; margin-top: 100px; margin-bottom: 100px;">
              <input type="submit" class="btn btn-info" style="background-color: #00E7D6; border-color: #00E7D6; color: #fff;" value="정보수정">
              <input type="reset" class="btn btn-warning" style="background-color: #A9FF7F; border-color: #A9FF7F; color: #fff;" onclick="location.href='${contextPath}'" value="메인으로">
            </div>
          </form>
        </div>
      </div>

    <!--  Join -->
    <script src="../js/join.js"></script> 
    
    
    
	<jsp:include page="../include/footer.jsp" />
  </body>
</html>
