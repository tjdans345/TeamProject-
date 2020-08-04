<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />    

<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("8pLz7wxFRYdPZEaM8Wsq", "http://localhost:8090/PP/naver/logincom.jsp");
  // 접근 토큰 값 출력
//   alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
//     alert(naver_id_login.getProfileData('email'));
//     alert(naver_id_login.getProfileData('nickname'));
//     alert(naver_id_login.getProfileData('age'));
//        alert(naver_id_login.getProfileData('name'));
//        alert(naver_id_login.getProfileData('id'));
//        alert(naver_id_login.getProfileData('email'));
       
     
       
       
       var name = naver_id_login.getProfileData('name');
       var id = naver_id_login.getProfileData('id');
       var email = naver_id_login.getProfileData('email');
       
       
    window.location.href="${contextPath}/admin/NaverTest.do?name="+name+"&nst=1&id="+id+"&email="+email;
    
    alert("로그인 성공!!");
    
//     window.close()
  }
  
  
  
  
  
  
  
  
</script>
</body>
</html>