<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>좋아요 목록</title>
<link rel="stylesheet" href="${contextPath}/mypage/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath}/mypage/css/custom.css">
</head>
<style type="text/css">
	a:hover{
		color:red;
	}
	
	a{
		color:blue;
		text-decoration: none;
	}
	
	.page_wrap{
		text-align: center;
		font-size: 0;
	}
	.page_nation{
		display: inline-block;
	}
	.page_nation .none{
		display: none;	
	}
	.page_nation a{
		display:block;
		margin:0 3px;
		float: left;
		border: 1px solid #e6e6e6;
		width: 28px;
		height: 28px;
		line-height: 28px;
		text-align: center;
		background-color: #fff;
		font-size: 13px;
		color:#999999;
		text-decoration: none;
	}
	.page_nation .arrow{
		border: 1px solid #ccc;
	}
	.page_nation .prev{
		background: #f8f8f8 url('img/page_prev.png') no-repeat center center;
		margin-left: 7px;
	}
	.page_nation .next{
		background: #f8f8f8 url('img/page_next.png') no-repeat center center; 
		margin-left: 7px;
	}
	
	.page_nation a.active{
		background-color:#42454c;
		color: #fff;
		border: 1px solid #42454c; 
	}
	.page_nation a:hover{
		color:#ggg;
	}
	
</style>
<body>

<jsp:include page="../include/header.jsp" /> 

<div class="container" style="width: 70%; padding-bottom: 50px;">

<div class="page-header" style="margin-top: 50px;">
          
        <h1 style="font-size: 40px;">Like List</h1>
        </div>
      
        
        
	 	<div class="row">
	 		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
	 			<thead>
	 				<tr>
	 					<th style="background-color: #eeeeee; text-align: center;">No</th>
	 					<th style="background-color: #eeeeee; text-align: center;">게시글번호</th>
	 					<th style="background-color: #eeeeee; text-align: center;">이미지</th>
	 					<th style="background-color: #eeeeee; text-align: center;">공연명</th>
	 					<th style="background-color: #eeeeee; text-align: center;">ID</th>
	 				</tr>
	 			</thead>
	 			<tbody>
 			
 			<c:if test="${!empty likeList}">
				<c:forEach items="${requestScope.likeList}" var="list" >
	 				<tr>
	 					<td style="vertical-align: middle;">${list.likenum}</td>
	 					<td style="vertical-align: middle;">${list.num}</td>
	 					<td style="vertical-align: middle;">
	 						<a href="${contextPath}/Proser/content.do?num=${list.num}&name=${list.name}" class="block-20"
	 							style="width : 100px; height: 100px; margin-right: 100px; margin-bottom: 100px;"
	 						><img src="${contextPath}/consert/${list.image}" style="width:100px; height:100px;"></a>
	 					</td>
	 					<td style="vertical-align: middle;">${list.name}</td>
	 					<td style="vertical-align: middle;">${list.id}</td>
	 				</tr>
	 			</c:forEach>
	 		</c:if>	
	 		<c:if test="${empty likeList}">
	 			<tr>
				<td colspan="7">찜한 상품이 없습니다.</td>
				</tr>
			</c:if>
	 			</tbody>
	 		</table>
	 		<button onclick="location.href='${contextPath}/index.jsp'" class="btn btn-primary pull-right" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important; margin-bottom: 50px;">메인으로</button>
	 	</div>
	 </div>
	 <div class="page_wrap">
	 	<div class="page_nation" style="position: relative; right: -50px; top: -20px;">
	 		<c:if test="${nowPage>blockSize}">
	 			<a href="location.href='${contextPath}/mycon/likelistForm.do?nowPage=${blockFirst-blockSize}'" class="arrow prev" ></a>
	 		</c:if>
	 		
	 		<c:forEach begin="${blockFirst}" end="${blockLast}" var="i" >
	 			<c:choose>
	 				<c:when test="${i eq nowPage}">
	 					<a href="${contextPath}/mycon/likelistForm.do?nowPage=${i}" class="active">${i}</a>
	 				</c:when>
	 				<c:otherwise>
	 					<a href="${contextPath}/mycon/likelistForm.do?nowPage=${i}">${i}</a>
	 				</c:otherwise>
	 			</c:choose>
	 		</c:forEach>
	 		
	 		
	 		<c:if test="${blockLast != totalPage }">
	 			<a href="location.href='${contextPath}/mycon/likelistForm.do?nowPage=${blockLast+1}'" class="arrow next"></a>
	 		</c:if>
	 	</div>
	 </div>
   <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->

    <script src="${contextPath}/mypage/js/bootstrap.js"></script>
    
    <jsp:include page="../include/footer.jsp" />
    
</body>
</html>