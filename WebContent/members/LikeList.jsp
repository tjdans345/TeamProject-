<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL 사용을 위해 선언 -->    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%--로그인유무 확인 --%>
<c:if test="${sessionScope.id == null}">
   <script>
      	alert("로그인 후 이용가능합니다.");
      	location.href="${contextPath}/member/login.do";
   </script>
</c:if>
<style>
#login:hover {color: #fff;}

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요 목록</title>



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

<div class="container" style="width: 70%;">
	<div class="page-header" style="padding-top: 50px;">
    <hr/>
    	<h1 style="margin-bottom: 50px;">Like List</h1>
    <hr/>
    </div>
   
    <div class="w3-border w3-center w3-padding" style="margin-bottom: 100px;">
    	<c:if test="${id == null}">
    		추천 기능은 <button type="button" id="login" class="btn btn-primary" style="background-color: #EB008B !important; border-color: #EB008B !important;">로그인</button> 후 사용 가능합니다.<br/>
    		<i class="fa fa-heart" style="font-size:16px; color:red"></i>
    		<span class="rec_count"></span>
    	</c:if>
    	<c:if test="${id != null}">
    		<button class="w3-button w3-black w3-round" id="rec_update">
    			<i class="fa fa-heart" style="font-size:16px;color:red"></i>
    			&nbsp;<span class="rec_count"></span>
    		</button>
    	</c:if>
	</div>
</div>


<jsp:include page="../include/footer.jsp" />

</body>
</html>