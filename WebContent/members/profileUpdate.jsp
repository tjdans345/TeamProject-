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
	<script type="text/javascript">
	$(document).on('click', '.browse',function(){
		var file=$(this).parent().parent().parent().find('.file');
		file.trigger('click');
	});
	$(document).on('change','.file',function(){
		$(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
	})

	
</script>
<jsp:include page="../include/header.jsp" />

</head>
<body>




      <div class="container" style="width: 70%;">
        <div class="page-header" style="margin-bottom: 50px;">
          <h1 style="margin-top: 50px;">My Profile</h1>
          <hr>
        </div>
        
        <div class="col-md-6 col-md-offset-3" >
          <form role="form" action="${contextPath}/member/updateProfileAction.do" method="post" name="modifyForm" enctype="multipart/form-data">
            <div class="form-group">
              <label for="username">아이디</label>
                  <input type="text" class="form-control" id="InputId" name="id" readonly value="${id}">
            </div>
           
           <div class="form-group">
           	<label for="username">프로필이미지</label>
	           <input type="file" name="profile_img" class="file" style="display: none;"> 
	           <div class="input-group col-xs-12">
	           		<span class="input-group-addon"><i class="glyphicon glyphicon-picture"></i></span>
	           		<input type="text" class="form-control input-lg" disabled placeholder="이미지를 업로드하세요.">
	           		<span class="input-group-btn">
	           			<button class="browse btn btn-primary input-lg" style="background-color: #EB008B !important; border-color: #EB008B !important; color: #fff !important;" type="button"><i class="glyphicon glyphicon-search" ></i>파일 찾기</button>
	           		</span>
	           </div>
           </div>
           
           </div>

            <div class="form-group text-center" style="margin-top: 100px;">
              <input type="submit" class="btn btn-info" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important; margin-bottom: 50px;" value="프로필수정">
              <input type="button" class="btn btn-warning" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important; margin-bottom: 50px;" onclick="location.href='${contextPath}'" value="취소">
            </div>
          </form>
        </div>


<jsp:include page="../include/footer.jsp" />

  </body>
</html>
