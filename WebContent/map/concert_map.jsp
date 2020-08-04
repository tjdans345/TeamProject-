<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
    <meta charset="utf-8">
    <title>공연장 지도</title>
	<jsp:include page="../include/header.jsp"></jsp:include>
</head>
<body>

    <div class="page-header">
   	<h1 style="margin-top: 50px; margin-left: 700px;">Address</h1>
    <hr/>
    </div>
    
    


<div id="map" style="width:50%;height:400px; margin-left: 25%;"></div>
<div id="map2" style="width:50%; height:400px;"></div>




<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed9791d0d9caeff08abc43ebd08003f0" ></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.557717, 127.000502), // 지도의 중심좌표
	        level: 7 // 지도의 확대 레벨
	    };
	
	var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div  
		mapOption2 = { 
		    center: new kakao.maps.LatLng(35.145842, 129.072631), // 지도의 중심좌표
		    level: 7 // 지도의 확대 레벨
		};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	var map2 = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '서울문화회관 대극장', 
	        latlng: new kakao.maps.LatLng(37.572451, 126.975812)
	    },
	    {
	        title: '충무 아트센터', 
	        latlng: new kakao.maps.LatLng(37.565965, 127.014642)
	    },
	    {
	        title: '국립극장', 
	        latlng: new kakao.maps.LatLng(37.552505, 126.999641)
	    },
	    {
	        title: '홍익대학교 대학로 아트센터',
	        latlng: new kakao.maps.LatLng(37.576480, 127.001426)
	    }
	];
	
	var positions2 = [
	    {
	        title: '부산 시민회관', 
	        latlng: new kakao.maps.LatLng(35.138752, 129.065271)
	    },
	    {
	        title: '부산 문화회관', 
	        latlng: new kakao.maps.LatLng(35.127237, 129.093500)
	    },
	    {
	        title: '영화의 전당', 
	        latlng: new kakao.maps.LatLng(35.171064, 129.127110)
	    },
	    {
	        title: 'KBS 부산홀',
	        latlng: new kakao.maps.LatLng(35.145050, 129.109045)
	    }
	];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		for (var i = 0; i < positions.length; i ++) {
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map : map, // 마커를 표시할 지도
		        position : positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		} 
		for (var i = 0; i < positions2.length; i ++) {
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map : map2, // 마커를 표시할 지도
		        position : positions2[i].latlng, // 마커를 표시할 위치
		        title : positions2[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });    
		}	
</script>

<script type="text/javascript">
	(function(){
		var x = document.getElementById("map2");
		    x.style.display = "none"; 
		  }());
	function te3(t) {
		if(t == 1) {
			var z = document.getElementById("map");
		    z.style.display = "block";
		  	var x = document.getElementById("map2");
		 	    x.style.display = "none"; 
		 }	
		if(t == 2) {	
			var z = document.getElementById("map");
				z.style.display = "none";
	
			var x = document.getElementById("map2");
			 	x.style.display = "block";	
		}
	}
</script>


<div style="margin-left: 650px; margin-top: 100px;">	
	<a href="#" onclick="te3(1)"><input type="button" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important; width: 100px;" value="서울" id="seoul"></a>
</div>
<div style="margin-left: 800px; margin-top: -30px;">
	<a href="#" onclick="te3(2)"><input type="button" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important; margin-bottom: 100px; width: 100px;" value="부산" id="busan"></a>
</div>
  
   
<jsp:include page="../include/footer.jsp"/>

</body>
</html>