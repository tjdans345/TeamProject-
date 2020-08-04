<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test="${is_admin != 1}">
	<script>
	window.location.href = '${contextPath}/index/index.jsp';
	</script>
</c:if> 
    
<!DOCTYPE html>
<html>
<head>

	<script type="text/javascript">
	
	//수정 함수
	function update(f) {
		console.debug(f);
		f.action = "${contextPath}/admin/MemberUpdate.do";
		f.submit();
	
	}
	
	//삭제 함수
	function delete2(f) {
		console.debug(f);
		f.action = "${contextPath}/admin/MemberDelete.do";
		f.submit();
	
	}
	
	//목록 리스트 이동 
	function list3(f) {
		window.location.href = '${contextPath}/admin/MemberModify.do?nowpage=1';
	}
	
	</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="page-wrapper">
	
			<!-- Header -->
			<jsp:include page="../include/header.jsp" />
			<!-- Main -->
				<div align="center">
				<div class="col-md-6 ftco-animate py-md-5">
            	<form action="#" class="contact-form" method="post">
            	<div class="row">
            		<div class="col-md-6">
	                <div class="form-group">
	                  	<mark>아이디</mark><input type="text" class="form-control" value="${memberInfo.id}" name="id" readonly="readonly"></td>
	                </div>
                </div>
                <div class="col-md-6">
	                <div class="form-group">
	                  	<mark>비밀번호</mark><input type="text" class="form-control" value="${memberInfo.password}" name="password">
	                </div>
	                </div>
	                <div class="col-md-6">
	                <div class="form-group">
	                  	<mark>이름</mark><input type="text" class="form-control" value="${memberInfo.name}" name="name">
	                </div>
	                </div>
	                <div class="col-md-6">
	                <div class="form-group">
	                  	<mark>휴대폰</mark><input type="text" class="form-control" value="${memberInfo.phone}" name="phone">
	                </div>
	                </div>
	                <div class="col-md-6">
	                <div class="form-group">
	                  	<mark>이메일</mark><input type="text" class="form-control" value="${memberInfo.email}" name="email">
	                </div>
	                </div>
	                <div class="form-group">
	                  	<mark>보유 포인트</mark><input type="text" class="form-control" value="${memberInfo.point}" name="point">
	                </div>
	                </div>
	                <div class="col-md-6">
	                <div class="form-group">
	                	<mark>회원 상태</mark> : 
	                	<c:if test="${memberInfo.status == 1}">
	                  	<b>회원 이용 가능</b>
	                  	</c:if>
	                  	<c:if test="${memberInfo.status == 2}">
	                  	<b>회원 이용 정지</b>
	                  	</c:if> 
	                  	<br/>
	                  	회원 상태 변경 : 
	                  	<select name="status" id="status">
	                  	<option value="1" selected="selected">회원 이용 가능</option>
	                  	<option value="2">회원 이용 정지</option>
	                  	</select>
	                </div>
	                </div>
	                <div class="col-md-6">
	                <div class="form-group">
	                  	<mark>회원 권한</mark> : 
	                  	<c:if test="${memberInfo.is_admin == 1}">
	                  	<b>관리자</b>
	                  	</c:if>
	                  	<c:if test="${memberInfo.is_admin == 0}">
	                  	<b>일반 회원</b>
	                  	</c:if> 
	                  	<br/>
	                  	관리자 권한 설정 :
	                  	<select name="admin" id="admin">
	                  	<option value="0" selected="selected">일반 회원</option>
	                  	<option value="1">관리자</option>
	                  	</select>
	                </div>
	                </div>
	                
              </div>
              <div class="col-md-6">
              		
              </div>
              <div class="form-group">
                	
              </div>
              <div class="form-group">
                <input type="button" onclick="update(this.form)" value="수정 하기" class="btn btn-primary py-3 px-5">
                <input type="button" onclick="delete2(this.form)"value="삭제 하기" class="btn btn-primary py-3 px-5">
                <input type="button" onclick="list3()"value="목록 보기" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          </div>
          </div>
          <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					
	<jsp:include page="../include/footer.jsp" />				
</body>
</html>