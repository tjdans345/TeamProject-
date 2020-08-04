<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:useBean id="now" class="java.util.Date"/>  
<fmt:formatDate value="${now}" pattern="yyyy.MM.dd HH:mm:ss" var="today"/>

  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기공연</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/lux/bootstrap.min.css">
<!-- 부트스트랩 -->

    
<jsp:include page="../include/header.jsp" />

</head>
<body>

 <section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
	<div class="container">
<!-- 		<div class="row block-9"> -->
		
<!-- 		<div class="col-md-10"> -->
		
		
<div class="col">
  <div class="col-2">
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" 
      	 href="#list-concert" role="tab" aria-controls="concert" style="border-radius: 80px;">
      	 콘서트
      </a>
      <a class="list-group-item list-group-item-action" id="list-musical-list" data-toggle="list" 
      	 href="#list-musical" role="tab" aria-controls="musical" style="border-radius: 80px;">
      	 뮤지컬/연극
      </a>
      <a class="list-group-item list-group-item-action" id="list-classic-list" data-toggle="list" 
      	 href="#list-classic" role="tab" aria-controls="classic" style="border-radius: 80px;">
      	 클래식
      </a>
    </div>
</div>
		
		
<div class="col-5">
  <div class="tab-content" id="nav-tabContent">

<!-- 콘서트탭 -->
<div class="tab-pane fade show active" id="list-concert" role="tabpanel" aria-labelledby="list-concert-list">
	<div class="rank_date">
		<p><span class="nowTextInfo">인기콘서트 <br>
		<font size="4px;" style="letter-spacing:3px;">(<c:out value="${today}"/> 현재)</font></span><span class="bg_arrow"></span></p>
	</div>

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col" style="width: 7%;">랭킹</th>
      <th scope="col" style="width: 15%;"></th>
      <th scope="col" style="width: 40%;">공연명</th>
      <th scope="col" style="width: 21%;">공연일시</th>
      <th scope="col" style="width: 47%;">공연장소</th>
      <th scope="col" style="width: 2%;">예매</th>
    </tr>
  </thead>
  <tbody>
  
  <c:forEach items="${bestList}" var="VO" varStatus="num">
 
    <tr>
      <td scope="row" >${num.count}</td>
      <td width="30%"><img src="${contextPath}/consert/${VO.image}" width="350px" height="300px"></td>
      <td>${VO.name}</td>
      <td>${VO.startdate}</td>
      <td>${VO.place}</td>
<!--       <td><button>예매하기</button></td> -->
	  <td>
		  <a type="button" class="btn btn-outline-success" style="border-color: #ccc; color: #4a4a4a; border-radius: 1em; width: 90px;"
		  href="${contextPath}/Proser/content.do?num=${VO.num}&name=${VO.name}">
		    예매하기
		  </a>
	  </td>
      
    </tr>
    
    </c:forEach>
    
   </tbody>
</table>

	</div>

<!-- 뮤지컬/연극탭 -->
<div class="tab-pane fade" id="list-musical" role="tabpanel" aria-labelledby="list-musical-list">

	<div class="rank_date">
		<p><span class="nowTextInfo">인기뮤지컬 / 연극 <br>
		<font size="4px;" style="letter-spacing:3px;">(<c:out value="${today}"/> 현재)</font></span><span class="bg_arrow"></span></p>
	</div>

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">랭킹</th>
      <th scope="col"></th>
      <th scope="col">공연명</th>
      <th scope="col">공연일시</th>
      <th scope="col">공연장소</th>
      <th scope="col">예매</th>
    </tr>
  </thead>
  <tbody>
  
    <tr>
      <td scope="row">1</td>
      <td><img src="${contextPath}/best/bestimg/01optimize.jpg" width="500px" height="500px"></td>
      <td>뮤지컬 〈모차르트！〉 10주년 기념공연</td>
      <td>2020.07.20</td>
      <td>세종문화회관 대극장</td>
	  <td>
		  <a type="button" class="btn btn-outline-success" style="border-color: #ccc; color: #4a4a4a; border-radius: 1em; width: 90px;"
		  href="#">
		    예매하기
		  </a>
	  </td>
    </tr>
    
     <tr>
      <td scope="row">2</td>
      <td><img src="${contextPath}/best/bestimg/02murder.jpg" width="500px" height="500px"></td>
      <td>뮤지컬〈머더 발라드</td>
      <td>2020.07.20</td>
      <td>세종문화회관 S씨어터</td>
<!--       <td><button>예매하기</button></td> -->
	  <td>
		  <a type="button" class="btn btn-outline-success" style="border-color: #ccc; color: #4a4a4a; border-radius: 1em; width: 90px;"
		  href="#">
		    예매하기
		  </a>
	  </td>
    </tr>
    
   </tbody>
</table>

</div>

<!-- 클래식탭 -->
<div class="tab-pane fade" id="list-classic" role="tabpanel" aria-labelledby="list-classic-list">

	<div class="rank_date">
		<p><span class="nowTextInfo">클래식 <br>
		<font size="4px;" style="letter-spacing:3px;">(<c:out value="${today}"/> 현재)</font></span><span class="bg_arrow"></span></p>
	</div>

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">랭킹</th>
      <th scope="col"></th>
      <th scope="col">공연명</th>
      <th scope="col">공연일시</th>
      <th scope="col">공연장소</th>
      <th scope="col">예매</th>
    </tr>
  </thead>
  <tbody>
  
    <tr>
      <td scope="row">1</td>
      <td><img src="${contextPath}/best/bestimg/01shinbi.jpg" width="500px" height="500px"></td>
      <td>신비아파트 미디어 어드벤처：내가 구하리！</td>
      <td>2020.07.20</td>
      <td>서울숲 갤러리아포레 더 서울라이티움 2관</td>
<!--       <td><button>예매하기</button></td> -->
	  <td>
		  <a type="button" class="btn btn-outline-success" style="border-color: #ccc; color: #4a4a4a; border-radius: 1em; width: 90px;"
		  href="#">
		    예매하기
		  </a>
	  </td>
    </tr>
    
    <tr>
      <td scope="row">2</td>
      <td><img src="${contextPath}/best/bestimg/02asy.jpg" width="500px" height="500px"></td>
      <td>2020 아시아프 ＆ 히든아티스트 페스티벌</td>
      <td>2020.07.20</td>
      <td>홍익대학교 현대미술관</td>
<!--       <td><button>예매하기</button></td> -->
	  <td>
		  <a type="button" class="btn btn-outline-success" style="border-color: #ccc; color: #4a4a4a; border-radius: 1em; width: 90px;"
		  href="#">
		    예매하기
		  </a>
	  </td>
    </tr>
    
   </tbody>
</table>

</div>
<!-- 클래식 탭 끝 -->

  </div>
</div>
<!-- 탭 끝 -->
			</div>
        </div>
<!-- 	</div>
	</div> -->
</section>

<jsp:include page="../include/footer.jsp"/>



</body>
</html>