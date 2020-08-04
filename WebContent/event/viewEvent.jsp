<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%
//한글처리
request.setCharacterEncoding("UTF-8");
%>

<%--컨텍스트 주소 얻기 --%>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="timer.js"></script>

	<script type="text/javascript" id="timer">
	CountDownTimer('${event.e_enddate}', 'countExpire');
	function CountDownTimer(dt, id) {
		var end = new Date(dt);
	    var _second = 1000;
	    var _minute = _second * 60;
	    var _hour = _minute * 60;
	    var _day = _hour * 24;
	    var timer;

	    function showRemaining() {
	    	var now = new Date();
	    	var distance = end - now;
	         // 시간 종료 시 뜨는 문구
	        if (distance < 0) {
	            clearInterval(timer);
	            document.getElementById(id).innerHTML = '해당 이벤트가 종료되었습니다.';
	            
	            return;
	         }
	         var days = Math.floor(distance / _day);
	         var hours = Math.floor((distance % _day) / _hour);
	         var minutes = Math.floor((distance % _hour) / _minute);
	         var seconds = Math.floor((distance % _minute) / _second);

	         document.getElementById(id).innerHTML = days + '일 ';
	         document.getElementById(id).innerHTML += hours + '시간 ';
	         document.getElementById(id).innerHTML += minutes + '분 ';
	         document.getElementById(id).innerHTML += seconds + '초';
		}
	     timer = setInterval(showRemaining, 1000);
	}
	
</script>

	<style>
	        #countExpire {
	            display: inline;
	            color: blue;
	            font-weight: bold;
	        }
	</style>


<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css" />
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<jsp:include page="../include/header.jsp"/>

</head>
<body style="text-align: center;">
	<section class="container body-container py-5">
	<a>이벤트 종료까지 남은시간</a><br>
	<div id="countExpire"></div>

		<article class="mt-3">
				<table class="table">
					<colgroup>
						<col style="max-width: 15%" />
						<col />
					</colgroup>
					<tr>
						<th class="align-middle">
							<label for="poolName" class="m-0">제목</label>
						</th>
						<td>
							<label>${event.e_title}</label>
						</td>
					</tr>
					
					<tr>
						<th class="align-middle">
							<label for="poolAddress1" class="m-0">이벤트 기간</label>
						</th>
						<td>
							<label>${event.e_startdate}</label> - <label>${event.e_enddate}</label>
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="contents" class="m-0">내용</label>
						</th>
						<td>
							<img src="${contextPath}/event/image/${event.e_file}"><br>
							${event.e_content}  <br><br><br>
						</td>
					</tr>								
					
				<c:if test="${is_admin == 1}">	
					<a href="${contextPath}/ev/deleteEvent.do?e_num=${event.e_num}">
						<input type="button" value="삭제하기">
					</a>
					
					<a href="${contextPath}/ev/modEventForm.do?e_num=${event.e_num}">
						<input type="button" value="수정하기">
					</a>
				</c:if>					
				</table>
				<div class="text-center my-5">
					<button type="button" class="btn btn-secondary" onclick="history.back()">돌아가기</button>
				</div>
			</article>
		</section>
		<!-- 게시판 -->	
	

<jsp:include page="../include/footer.jsp"/>

	
</body>
</html>