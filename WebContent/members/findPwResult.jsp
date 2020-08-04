<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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

<title></title>

<script type="text/javascript">

function checkAuthNum(){
	var checkNum = $("#authNum").val();
	var authNum = ${authNum}
	
	if(!checkNum){
		alert("인증번호를 입력하십시오.");
	}else{
		if(checkNum == authNum){
			alert("성공적으로 인증되었습니다.");
			document.pwCheckForm.submit();
		}else{
			alert("인증번호가 잘못되었습니다.");
			return false;
		}
	}
}

</script>

</head>
<body>

<jsp:include page="../include/subheader.jsp" />



      <article class="container" style="width: 70%;">
      
      <div class="page-header" style="margin-top: 50px;">
          
          <h1>Certification</h1>
        </div>
        <hr/>
      
      
      
        <div class="col-md-6 col-md-offset-3">
          <form role="form" action="${contextPath}/member/updatePass.do" method="post" name="pwCheckForm">        
            <div class="form-group">
            	<label for="username">아이디</label>
            	<input type="text" name="id" id="id" class="form-control" value="${id}" readonly>
            </div>
            
            <div class="form-group">
             	<label for="username">인증번호를 입력해주세요.</label>
             	<input type="text" name="authNum" id="authNum" placeholder="Enter The Code" class="form-control">             	
            </div>
            <div class="form-group text-center" style="margin-top:50px; margin-bottom: 100px;">
              <button type="button" class="btn btn-primary" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important;" onclick="checkAuthNum()">확인</button>
              <button type="button" class="btn btn-primary" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important;" onclick="location.href='${contextPath}/member/login.do'">로그인하러 가기</button>
            </div>
          </form>
        </div>
      </article>
      
      <jsp:include page="../include/footer.jsp" />

</body>
</html>