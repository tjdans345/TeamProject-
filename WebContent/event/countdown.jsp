<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" id="timer">
	CountDownTimer('07/10/2020', 'countdown');
	CountDownTimer('7/7/2020 5:00 PM', 'HourCountdown');
	CountDownTimer('7/15/2020', 'countExpire');
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
<meta charset="UTF-8">
<title>타이머 테스트</title>
<script type="text/javascript" src="timer.js"></script>
	<style>
	        #countdown,
	        #HourCountdown,
	        #countExpire {
	            display: inline;
	            color: blue;
	            font-weight: bold;
	        }
	</style>
</head>
<body>
	<!--아래와 같이 가져와서 사용한다  -->
	2020년 7월 10일까지 <div id="countdown"></div> 남았습니다.<br>
    2020년 7월 10일 오후 5시까지 <div id="HourCountdown"></div> 남았습니다.<br>
    2020년 7월 7일인 오늘 <div id="countExpire"></div>
</body>
</html>

