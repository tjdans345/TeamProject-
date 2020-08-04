<%@page import="team.faqboard.faqBean"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    


<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>

<%--컨텍스트 주소 얻기 --%>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%--로그인유무 확인 --%>
<c:if test="${sessionScope.id == null}">
   <script>
      	alert("로그인 후 이용가능합니다.");
      	location.href="${contextPath}/member/login.do";
   </script>
</c:if>
<html>
<head>
<title>FAQ수정</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/lux/bootstrap.min.css">
<!-- 부트스트랩 -->
    
<jsp:include page="../include/header.jsp"></jsp:include>

<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css" />

<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</head>
<body>

  <section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row block-9" style="margin-top: 50px;">
			
			<div class="col-md-10">
			
<!-- 탭메뉴 -->	
<ul class="nav nav-tabs" style="font-size: 14px;">
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link active"  href="${contextPath}/notice/listNotice.do" style="padding: 15px 85px 15px 85px;">
 	공지사항
 	</a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link active"  href="${contextPath}/board/info2.jsp" style="padding: 15px 85px 15px 85px;">
 	이용안내
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link"  href="${contextPath}/fboard/faqlist.do" style="padding: 15px 100px 15px 100px;">
    FAQ
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
  
	  <c:choose>
	   	<c:when test="${id != null}">
	    		<a class="nav-link active"  href="${contextPath}/qboard/qnaList.do" style="padding: 15px 70px 15px 70px;">
	    		나의 문의 내역
	    		</a>
	  		</c:when>
	  		<c:when test="${id == null}">
	  			<a class="nav-link active"  href="${contextPath}/member/login.do" style="padding: 15px 70px 15px 70px;">
	  			나의 문의 내역
	  			</a>
	  		</c:when>
	  	</c:choose>

  </li>
</ul>






<section class="container body-container py-5">
<div class="row">

</div>
<!-- 게시판 -->
<article class="mt-3">
	<form action="${contextPath}/fboard/faqUpdate.do?faq_num=${faqUpdate.faq_num}" method="post">
		<table class="table">
			<colgroup>
				<col style="max-width: 15%" />
				<col />
			</colgroup>
			<tr>
				<th class="align-middle">
					<label for="poolName" class="m-0">카테고리 선택</label>
				</th>
				<td>
						
<!-- 					<input class="form-control" type="text" name="poolName" id="poolName" required /> -->
						<input type="radio" name="cate" value="티켓예매" checked="checked">티켓예매 &nbsp;&nbsp;
						<input type="radio" name="cate" value="취소/환불">취소/환불 &nbsp;&nbsp;
						<input type="radio" name="cate" value="이벤트">이벤트 &nbsp;&nbsp;
						<input type="radio" name="cate" value="티켓수령">티켓수령 &nbsp;&nbsp;
						<input type="radio" name="cate" value="회원">회원 &nbsp;&nbsp;
				</td>
			</tr>
			
			<tr>
				<th class="align-middle">
					<label for="poolAddress1" class="m-0">제목</label>
				</th>
				<td>
					<input type="text" class="form-control" name="title" value="${faqUpdate.faq_title}" id="poolAddress1" maxlength="50" style="width: 100%;">
				</td>
			</tr>
			
			<tr>
				<th class="align-middle">
					<label for="contents" class="m-0">내용</label>
				</th>
				<td>
					<textarea class="form-control" name="contents" id="poolContent" cols="40" rows="13" required style="width: 100%;">${faqUpdate.faq_contents}</textarea>
				</td>
			</tr>
		</table>
		
		<div class="text-center my-5">
			<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
			<button type="submit" class="btn btn-primary">수정하기</button>
		</div>
		
	</form>
</article>
<!-- 게시판 -->
</section>

			</div>
        </div>
	</div>
</section>

<jsp:include page="../include/footer.jsp"/>

</body>
</html>