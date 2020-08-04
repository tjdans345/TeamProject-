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
    <script scr="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

  </head>
  <body>


      <article class="container">
        <div class="page-header">
        <hr/>
          <h1>비밀번호 확인</h1>
         <hr/>
         <h4>내정보를 보기위해 비밀번호를 입력해주세요.</h4>
        </div>
        
        <div class="col-md-6 col-md-offset-3">
          <form role="form" action="${contextPath}/member/pwCheck.do" method="post" name="pwCheckForm">        
            <div class="form-group">
              <input type="password" class="form-control" id="InputPassword1" name="password">
            </div>
            <div class="form-group text-center">
              <input type="submit" class="btn btn-info" value="확인">
              <button type="button" class="btn btn-warning" onclick="location.href='../index.jsp';">메인으로</button>
            </div>
          </form>
        </div>
      </article>

  </body>
</html>
