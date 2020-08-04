<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Array"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="${contextPath}/mypage/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath}/mypage/css/custom.css">
<meta charset="UTF-8">
<title>포인트 신청내역</title>
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

<script type="text/javascript">
	function btnDelete(){
			if(confirm("전체 삭제를 하시겠습니까?")){
				location.href="${contextPath}/mycon/delAllpoint.do";
			}else{
				return false;
			}
	}

	
	
</script>
</head>
<body>
 <div class="container">
	 	<div class="row">
	 		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
	 			<thead>
	 				<tr>
	 					<th style="background-color: #eeeeee; text-align: center;">입금자</th>
	 					<th style="background-color: #eeeeee; text-align: center;">입금액</th>
	 					<th style="background-color: #eeeeee; text-align: center;">포인트충전</th>
	 					<th style="background-color: #eeeeee; text-align: center;">삭제</th>
	 				</tr>
	 			</thead>
	 			<tbody>
 			<c:if test="${!empty pointList}">
				<c:forEach var="point" items="${requestScope.pointList}">
	 				<tr>
	 					<td>${point.name}</td>
	 					<td>${point.point}</td>
	 					<td><a href="${contextPath}/mycon/addpointCom.do?id=${point.id}&point=${point.point}&num=${point.num}">포인트충전</td></td>
	 					<td><a href="${contextPath}/mycon/delPoint.do?id=${point.id}&num=${point.num}">삭제</a></td>
	 				</tr>
	 			</c:forEach>
	 		</c:if>	
	 		<c:if test="${empty pointList}">
	 			<tr>
				<td colspan="8">입금신청 내역이 없습니다.</td>
				</tr>
			</c:if>
				
			

	 			</tbody>
	 		</table>
			<button type="button" onclick="btnDelete()" class="btn btn-primary pull-right">입금내역 비우기</button>
	 		<button onclick="location.href='${contextPath}/index.jsp'" class="btn btn-primary pull-right" >메인으로</button>
	 	</div>
	 </div>
	 
	 
	 <div class="page_wrap">
	 	<div class="page_nation">
	 		<c:if test="${nowPage>blockSize}">
	 			<a href="location.href='${contextPath}/mycon/pointList.do?nowPage=${blockFirst-blockSize}'" class="arrow prev"></a>
	 		</c:if>
	 		
	 		<c:forEach begin="${blockFirst}" end="${blockLast}" var="i">
	 			<c:choose>
	 				<c:when test="${i eq nowPage}">
						<a href="location.href='${contextPath}/mycon/pointList.do?nowPage=${i}'" class="active">${i}</a>	 				
	 				</c:when>
	 				<c:otherwise>
	 					<a href="location.href='${contextPath}/mycon/pointList.do?nowPage=${i}'">${i}</a>
	 				</c:otherwise>
	 			</c:choose>
	 		</c:forEach>
	 		
	 		<c:if test="${blockLast != totalPage}">
	 			<a href="location.href='${contextPath}/mycon/pointList.do?nowPage=${blockLast+1}'" class="arrow next"></a>
	 		</c:if>
	 	</div>
	 </div>



   <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->

    <script src="${contextPath}/mypage/js/bootstrap.js"></script>
</body>
</html>