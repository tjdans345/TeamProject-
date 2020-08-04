<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script>

function sel() {
	var selectdate = $("#sear").val();
	var name = $("#name").val();
	
 	$.ajax({
		type : "post",
		async: false,
		url : "${contextPath}/Proser/itemselect.do",
		data : {date : selectdate, name : name},
		dataType : "json",
		success : function(data) {
			
			var jsonInfo = JSON.parse(JSON.stringify(data));
			
			var List = jsonInfo.List;
			var info = "<tr>";

			info += "<td>No.</td>";
			info += "<td>공연명</td>";
			info += "<td>공연날짜</td>";
			info += "<td>시작시간</td>";
			info += "<td>잔여좌석</td>";
			info += "<td>좌석수</td>";
			info += "<td>공연장</td>";
			info += "<td>예약하기</td>"+ "</tr>";
			
			if(!List.length){
				info += "<tr><td colspan='8'>예매 가능한 콘서트가 없습니다.</td></tr>"; 
			}else{
				for(var i in List){
					var num = Number(i)+1;
					var Able = Number(List[i].seat) - Number(List[i].totalreserved);

					var detnum = Number(List[i].detnum);
					info += "<tr><td>"+num+"</td>"; 
					info += "<td>${Bean.name}</td>";
					info += "<td>"+List[i].today+"</td>";
					info += "<td>"+List[i].starttime+"</td>";
					info += "<td>"+Able+"</td>";
					info += "<td>"+List[i].seat+"</td>";
					info += "<td>"+List[i].place+"</td>";
					if(Able > 0){
						info += "<td><a href='${contextPath}/Proser/prepare.do?detailnum="+detnum+"'>예약하기</a></td>";
					}else{
						info += "<td>매진</td>";
					}	
					info += "</tr>";
				} 
			}
			 
			$("#part").html(info);
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	}); 
}

</script>
<style type="text/css">

#part{
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
	min-height: 50px;
}

#part tr{
	text-align: center;
}

#part a{
	color: blue;
}
#search{
	margin-top: 50px;
}

#label{
	margin-left: 60%;
	margin-top: 50px;
	font-size: 18px;
	margin-right: 10px;
}

</style>
</head>
<body>

<div style="clear: both;"></div>

   	<label id="label">날짜 검색</label><input type="date" id="sear" onchange="sel()" />

   	<input type="button" value="전체보기" onclick="trybuy()">
   	<input type="hidden" value="${Bean.name}" id="name">
   	<div id="partview"><table id="part" border="1"></table></div>

</body>
</html>