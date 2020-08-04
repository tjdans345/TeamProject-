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
    <title>팀프</title>

    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery(부트스트랩의 자바스크립트 플러그인을 위해 필요)-->
    <script src="http://code.jquery.com/jquery.js"></script> 
    <!-- 모든 합쳐진 플러그인을 포함하거나 필요한 파일을 포함 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Respond.js으로 IE8에서 반응형 기능활성화 -->
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

  </head>
  <body>


<jsp:include page="../include/subheader.jsp" />

      <article class="container" style="width: 70%;">
        <div class="page-header">
        
          <h1 style="margin-top: 100px;">Password Check</h1>
         <hr/>
         <h5 style="font-family:나눔고딕;">내 정보를 보기위해 비밀번호를 입력해주세요.</h5>
        </div>
        
        <div class="col-md-6 col-md-offset-3" style="margin-left: -10px;">
          <form role="form" action="${contextPath}/member/pwCheck.do" method="post" name="pwCheckForm">        
            <div class="form-group">
              <input type="password" class="form-control" id="InputPassword1" name="password">
            </div>
            <div class="form-group text-center" style="margin-right: -600px; margin-top: 100px;">
              <input type="submit" class="btn btn-info" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important; margin-bottom: 50px;" value="확인">
              <button type="button" class="btn btn-warning" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important; margin-bottom: 50px;" onclick="location.href='${contextPath}'">메인으로</button>
            </div>
          </form>
        </div>
      </article>


<jsp:include page="../include/footer.jsp" />

  </body>
</html>
