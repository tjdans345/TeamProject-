<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>bootstrap template</title>

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

  </head>
  <body>
  
  
  <jsp:include page="../include/subheader.jsp" />

      <div class="container" style="width: 70%;">
     
	      		
      	<!-- START 모달창 -->
      	<div class="modal fade" id="defaultModal">
      		<div class="modal-dialog">
      			<div class="modal-content">
      				<div class="modal-header">
      				<h4 class="modal-title" style="align: left;">알림</h4>
      					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>      					
      				</div>
      				<div class="modal-body">
      					<p class="modal-contents"></p>
      				</div>
      				<div class="modal-footer">
      					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      				</div>
      			</div>   <!-- /.modal-content -->
      		</div>		<!-- /.modal-dialog -->
      	</div>	<!-- /.modal -->
      	<!-- END 모달창 -->
		<!-- 본문 START -->
		<div class="page-header">
          
          <h1 style="margin-top: 100px;">Password Edit</h1>
        </div>
        <hr/>
          <form role="form" action="${contextPath}/member/updatePassAction.do" method="post" name="upForm" onsubmit="return checkForm2()">
			
			<div class="form-group">
				<label for="username">아이디</label>
				<input type="text" name="id" class="form-control" value="${id}" readonly>
			</div>
            
            <div class="form-group">
              <label for="InputPassword1"><font color="red">*</font>비밀번호</label>
              <input type="password" class="form-control" id="InputPassword1" name="password" placeholder="비밀번호" onblur="checkPwd()">
                <span id="checkPwd1">&nbsp;</span>
            </div>
            
            <div class="form-group">
              <label for="InputPassword2"><font color="red">*</font>비밀번호 확인</label>
              <input type="password" class="form-control" id="InputPassword2" placeholder="비밀번호 확인" onblur="checkPwd2()">
                <span id="checkPwd2">&nbsp;</span>
            </div>

       
            <div class="form-group text-center">
              <input type="submit" class="btn btn-info" value="수정">
              <button type="button" class="btn btn-warning" onclick="location.href='${contextPath}'">메인으로</button>
            </div>
          </form>
        </div>
    <script src="../js/pass.js"></script>  
    
    
    <jsp:include page="../include/footer.jsp" />

  </body>
  
</html>
