<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기공연</title>

<style type="text/css">

.nav-link {float: left;}

</style>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/minty/bootstrap.min.css">


</head>
<body>

<h5 style="margin: 2em;">인기공연</h5>

<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#home">인기공연</a>
    <a class="nav-link" data-toggle="tab" href="${contextPath}/btboard/bestList.do">더보기</a> 
    
    <%-- <a href="${contextPath}/btboard/bestList.do">더보기</a> --%>
  </li>
<!--   <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#profile">Profile</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#">Disabled</a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="#">Action</a>
      <a class="dropdown-item" href="#">Another action</a>
      <a class="dropdown-item" href="#">Something else here</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">Separated link</a>
    </div>
  </li>-->
</ul> 
<div id="myTabContent" class="tab-content">
  <div class="tab-pane fade active show" id="home">
    <table>
    <c:forEach items="${bestList}" var="VO">
    	<tr>
    		<td rowspan="3" width="20%" align="center">${VO.detailnum}</td>
    		<td rowspan="3" style="padding: 1px 1em 1px 1em;"><img src="${contextPath}/consert/${VO.image}" width="80px" height="100px"></td>
    		<td height="70%">${VO.name}</td>
    	</tr>
    	<tr>
    		<td height="15%" style="font-size: 12px; padding: 1em;">${VO.startdate}</td>
    	</tr>
    	<tr>
    		<td height="15%" style="font-size: 12px; padding: 1em;">${VO.place}</td>
    	</tr>
    </c:forEach>	
    </table>
  </div>
<!--   <div class="tab-pane fade active show" id="profile">
    <p>AGUST D</p>
  </div>
  <div class="tab-pane fade" id="dropdown1">
    <p>FILTER</p>
  </div>
  <div class="tab-pane fade" id="dropdown2">
    <p>MOONCHILD</p>
  </div> -->
</div>


</body>
</html>