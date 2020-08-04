<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%--로그인유무 확인 --%>
<c:if test="${sessionScope.id != null}">
   <script>
      	alert("이미 로그인 중입니다.");
      	location.href="${contextPath}";
   </script>
</c:if>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>네이버 로그인</title>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
  <!-- 네이버아이디로로그인 버튼 노출 영역 -->
  <div id="naver_id_login"></div>
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("8pLz7wxFRYdPZEaM8Wsq", "http://localhost:8090/PP/naver/logincom.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8090/PP/members/login.jsp");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
//   	182808912
  </script>
</html>