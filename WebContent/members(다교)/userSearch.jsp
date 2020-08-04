<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>

    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery(부트스트랩의 자바스크립트 플러그인을 위해 필요)-->
    <script src="http://code.jquery.com/jquery.js"></script> 
    <!-- 모든 합쳐진 플러그인을 포함하거나 필요한 파일을 포함 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Respond.js으로 IE8에서 반응형 기능활성화 -->
    <script scr="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script type="text/javascript">

	function search_check(num){
		if(num == '1'){
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";
		}else{
			document.getElementById("searchI").style.display="none";
			document.getElementById("searchP").style.display="";
		}
	}
	
	
	
</script>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>     		
      	<!-- START 모달창 -->
      	<div class="modal fade" id="defaultModal">
				<div class="modal_contents">
					<h4>
						<b>아이디는 ?</b><span class="close">&times;</span>
					</h4><br>
						<h2 id="id_value"></h2>
					<br>
					<button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
					<i class="fa fa-envelope">비밀번호 찾기</i></button>
				</div> <!-- ./modal contents -->
      	</div>	<!-- /.modal -->
      	<!-- END 모달창 -->
      	
      	
<!-- 본문 START -->
<div class="container">
		<div class="page-header">
          <hr/>
          <h1>아이디/비밀번호 찾기</h1>
        </div>
        <hr/>
    <div style="margin-bottom: 10px;" 
    class="radio">
		<input type="radio" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
           <label class="username" for="search_1">아이디 찾기</label>
    </div>
    
    <div class="radio">
    	<input type="radio" id="search_2" name="search_total" onclick="search_check(2)">
    	<label class="username" for="search_2">비밀번호 찾기</label>
    </div>      
 		<div id="searchI">
 			<form action="${contextPath}/member/findIdAction.do" method="post">
            <div class="form-group">
              <label for="username">이름</label>
              	<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해 주세요" >
            </div>

            <div class="form-group">
            	<label for="username">이메일</label>
            	  <input type="email" class="form-control" id="email" name="email" placeholder="Ex) Admin@google.com">
            </div>

            <div class="form-group text-center">
              <input type="submit" class="btn btn-primary" value="확인" id="searchBtn" onclick="()">
              <button type="button" class="btn btn-warning" onclick="location.href='../index.jsp';">메인으로</button>
            </div>
          </form>
		</div>
	
	<div id="searchP" style="display:none;">
	 <form action="${contextPath}/member/findPwAction.do" method="post">
		<div class="form-group">
			<label for="username">아이디</label>
				<input type="text" class="form-control" name="id" id="id2" placeholder="아이디를 입력하세요.">
		</div>
		
		<div>
			<label for="username">이메일</label>
			<input type="email" class="form-control" name="email" id="email2" placeholder="Ex) Admin@google.com">
		</div>
		
		<div class="form-group text-center">
              <input type="submit" class="btn btn-primary" id="searchBtn2" value="확인">
              <button type="button" class="btn btn-warning" onclick="location.href='../index.jsp';">메인으로</button>
        </div>
	  </form>
	</div>
</div>
</body>
</html>