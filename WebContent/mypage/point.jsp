<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%--로그인유무 확인 --%>
<c:if test="${sessionScope.id == null}">
   <script>
      	alert("로그인 후 이용가능합니다.");
      	location.href="${contextPath}/member/login.do";
   </script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트충전</title>
<style type="text/css">
	a:hover{
		color:red;
	}
	
	a{
		color:blue;
		text-decoration: none;
	}
</style>
</head>
<body>


<jsp:include page="../include/header.jsp" />


	<div class="container">
		<div class="page-header" style="margin-top: 50px;">
          
        <h1 style="font-size: 40px; position: relative; left: 50%;">Point</h1>
        </div>
			<div class="row" style="position: relative; left: 10%;">
				<form action="${contextPath}/mycon/addpoint.do" method="post">
					<table class="table" style="text-align: center; border: 1px solid #dddddd; max-width: 80%; " >
						<thead>
							<tr>
								<th style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">입금자</b></th>
								<td>
									<label for="username">${sessionScope.name}</label>
								</td>
							</tr>
							<tr>
								<th style="background-color: #3d435c; text-align: center; vertical-align:middle;"><b style="color: #fff;">충전금액</b></th>
								<td align="center">
									<input type="text" name="point" placeholder="충전할 금액을 입력하세요." class="form-control" 
										style="width: 80%; text-align: center;">
								</td>
							</tr>
							
						
							<tr>
								<th style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">입금할 은행명</b></th>
								<td>
									<label for="username">신한은행</label>
								</td>
							</tr>
							<tr>
								<th style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">예금주</b></th>
								<td>
									<label for="username">티켓</label>
								</td>
							</tr>
							<tr>
								<th style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">계좌번호</b></th>
								<td>
									<label for="username">123-4567-890123</label>
								</td>
							</tr>
						</thead>
					</table>
					<div class="form-group text-center" style="position: relative; left: 50px; bottom: -50px; padding-bottom: ">
						<input type="hidden" name="name" value="${sessionScope.name}">
						<input type="hidden" name="id" value="${sessionScope.id}">
						<input type="submit" value="입금확인신청" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important; margin-bottom: 50px;" class="btn btn-primary">
						<button type="button" class="btn btn-success" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important; margin-bottom: 50px;" onclick="location.href='${contextPath}'">메인으로</button>
					</div>
					<br><br><br>
				</form>
			</div>
	</div>

	 <jsp:include page="../include/footer.jsp" />
</body>
</html>