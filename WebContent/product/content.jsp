<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">

    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/ionicons.min.css">

    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/style.css">

	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  

	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<script src="../js/content.js"></script> 
	
	<script>
	
	function trybuy() {
		
		var name = $("#name").val();
		
	 	$.ajax({
			type : "post",
			async: false,
			url : "${contextPath}/Proser/Allitems.do",
			data : {name : name},
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
							info += "<td><a href='${contextPath}/Proser/prepare.do?detailnum="+detnum+"&today="+List[i].today+"'>예약하기</a></td>";
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
		document.getElementById("explanation").style.display = "none";
		document.getElementById("reply").style.display = "none";
		document.getElementById("review").style.display = "none";
		document.getElementById("trybuy").style.display = "block";
	}
	
	function reply() {
		
		var pronum = ${Bean.num};
		var id = document.getElementById("proid").value;
		var admin = Number(document.getElementById("proadmin").value);
		
		$.ajax({
			type : "post",
			async: false,
			url : "${contextPath}/Proser/Allreply.do",
			data : {pronum : pronum},
			dataType : "json",
			success : function(data) {
				var jsonInfo = JSON.parse(JSON.stringify(data));
				
				var List = jsonInfo.List;
				
				var info = "<tr>";
				
				if(!List.length){
					info += "<td colspan='4' width='500' align='center'>등록된 댓글이없습니다.</td></tr>"; 
				}else{
					for(var i in List){
						var replynum = Number(List[i].replynum);
						var parentsnum = Number(List[i].parentsnum);
						var productnum = Number(List[i].productnum);
						var message = "관리자나 본인에 의해 삭제된 댓글입니다.";
						if(parentsnum == 0){
							info +="<td width='100' align='center' style='background-color: #002545; color: #fff;'>ID</td>";
							info +="<td width='200' align='center' style='background-color: #002545; color: #fff;'>내용</td>";
							if(List[i].content == message){
								info +="<td width='100' align='center' style='background-color: #002545; color: #fff;'>삭제한 날짜</td>";
							}else{
								info +="<td width='100' align='center' style='background-color: #002545; color: #fff;'>업로드 날짜</td>";
							}
							info +="<td width='100' align='center' style='background-color: #002545; color: #fff;'></td></tr>";
							info +="<tr>";
							info +="<td width='100' align='center'>"+List[i].id+"</td>";
							info +="<td width='200' align='center'>"+List[i].content+"</td>";
							info +="<td width='100' align='center'>"+List[i].uploaddate+"</td>";
							info +="<td width='100' align='center'>"
							if(List[i].content != message && id != ""){
								info +="<a onclick='doublereply("+replynum+")'>댓글쓰기</a><br>";
								if(id == List[i].id){
									info +="<a onclick='updatereply("+replynum+")'>댓글수정</a><br>";
									info +="<a onclick='fatedelete("+replynum+")'>댓글삭제</a><br>";
								}
								
								if(admin == 1){
									
									info +="<a onclick='alldelete("+replynum+")'>댓글삭제</a>";
								}
							}
							info +="</td></tr>"
							
							for(var j in List){
								var doreply = Number(List[j].replynum);
								var doparents = Number(List[j].parentsnum);
								
								if(replynum == doparents){
									info +="<tr>";
									info +="<td width='100' align='center' style='background-color: #e5e5e5;'>ID</td>";
									info +="<td width='200' align='center' style='background-color: #e5e5e5;'>내용</td>";
									if(List[j].content == message){
										info +="<td width='100' align='center' style='background-color: #e5e5e5;'>삭제한 날짜</td>";
									}else{
										info +="<td width='100' align='center' style='background-color: #e5e5e5;'>업로드 날짜</td>";
									}
									info +="<td width='100' align='center' style='background-color: #e5e5e5;'></td></tr>";
									info +="<tr>";
									info +="<td width='100' align='center'>"+List[j].id+"</td>";
									info +="<td width='200' align='center'>"+List[j].content+"</td>";
									info +="<td width='100' align='center'>"+List[j].uploaddate+"</td>";
									info +="<td width='100' align='center'>";
									if(List[j].content != message && id != ""){
										if(id == List[j].id){
											info +="<a onclick='updatereply("+doreply+")'>댓글수정</a><br>";
											info +="<a onclick='fatedelete("+doreply+")'>댓글삭제</a><br>";
										}
										
										if(admin == 1){
											info +="<a onclick='replydelete("+doreply+")'>댓글삭제</a>";
										}
									}
									info +="</td></tr>"
								}
							}
						}
					}
				}
				
				$("#replytable").html(info);
				
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
		document.getElementById("explanation").style.display = "none";
		document.getElementById("reply").style.display = "block";
		document.getElementById("review").style.display = "none";
		document.getElementById("trybuy").style.display = "none";
	}
	
	function replywrite() {
		var parentsnum = document.frmReply.parentsnum.value;
		var id = document.frmReply.id.value;
		var content = document.frmReply.content.value;
		var pronum = ${Bean.num};
		
		$.ajax({
			type : "post",
			async: false,
			url : "${contextPath}/Proser/reply.do",
			data : {pronum : pronum, parentsnum:parentsnum, id:id, content:content},
			success : function() {
				
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		
		document.getElementById("write").style.display = "none";
		reply();
	}
	
	function replyupdate() {
		var replynum = document.upReply.replynum.value;
		var upcontent = document.upReply.upcontent.value;
		
		$.ajax({
			type : "post",
			async: false,
			url : "${contextPath}/Proser/updatereply.do",
			data : {replynum : replynum, upcontent:upcontent},
			success : function() {
				
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		
		document.getElementById("upwrite").style.display = "none";
		reply();
		
	}
	
	function fatedelete(replynum) {
		$.ajax({
			type : "post",
			async: false,
			url : "${contextPath}/Proser/fatedelete.do",
			data : {replynum : replynum},
			success : function() {
				
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		
		reply();
	}
	
	function alldelete(replynum) {
		$.ajax({
			type : "post",
			async: false,
			url : "${contextPath}/Proser/alldelete.do",
			data : {replynum : replynum},
			success : function() {
				
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		
		reply();
	}
	
	function replydelete(replynum) {
		$.ajax({
			type : "post",
			async: false,
			url : "${contextPath}/Proser/replydelete.do",
			data : {replynum : replynum},
			success : function() {
				
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		
		reply();
	}
	
	</script> 

</head>
  <body>
<jsp:include page="../include/header.jsp" />
    <!-- END nav -->

<!-- 
  <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/concert.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-3 bread">Our Blog</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>Blog</span></p>
          </div>
        </div>
      </div>
    </section>
     -->
	<input type="hidden" id="proid" value="${sessionScope.id}">
	<input type="hidden" id="proadmin" value="${sessionScope.is_admin}">
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div>
					<div class="row">
						<div class="col-md-12 d-flex ftco-animate">
							<div
								class="blog-entry blog-entry-2 justify-content-end d-md-flex w-100">
								<a href="blog-single.jsp" class="block-20"
									style="background-image: url('../consert/${Bean.image}'); width: 250px; height: 350px; margin-right: 100px; margin-bottom: 150px;">
								</a>
								<div class="text pl-md-4 ml-md-2 pt-4"
									style="margin-right: 100px;">
									<div class="meta">
									
									<!-- 
										<div>
											<a href="#">단독 판매</a>
										</div>
										 -->

									</div>
									<h3 class="heading mt-2">
										<a href="#">${Bean.name}</a>
									</h3>
									<table style="width: 700px;">

										<tr>
											<td>공연시간</td>
											<td><fmt:formatDate value="${Bean.startdate}" /> ~ <fmt:formatDate
													value="${Bean.enddate}" /></td>
											<td>관람시간</td>
											<td>${Bean.runtime}분</td>
										</tr>
										<tr>

											<td>관람등급</td>
											<td>${Bean.cla}</td>
											<td>장르</td>
											<td>${Bean.genre}</td>
										</tr>
										<tr>
											<td>가격</td>
											<td><fmt:formatNumber value="${Bean.price}" pattern="#,###" />원</td>
											<td>공연장소</td>
											<td>${detailList.place}</td>
										</tr>
										<tr>
											<td>좋아요<span class="icon icon-heart"></span></td>
											<td>${requestScope.likeCount}</td> 
											<td></td>
											<td></td>
										</tr>
									</table>

									<p style="margin-top: 70px;">
									<c:choose>
										<c:when test="${sessionScope.is_admin+0 == 1+0}">
											<a href="${contextPath}/Proser/details.do?num=${Bean.num}" class="btn btn-outline-primary" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important;">상세등록</a> 
											<a href="${contextPath}/Proser/delete.do?num=${Bean.num}&path=consert&image=${Bean.image}&content=${Bean.content}" class="btn btn-outline-primary" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important;">삭제하기</a>
										</c:when>
									</c:choose>
										<a href="${contextPath}/Proser/imcontact.do" class="btn btn-outline-primary" style="background-color: #EB008B !important; border-color: #EB008B !important; color: #fff !important;">목록보기</a>					
									<!-- 좋아요 판별부분  checkZ 값이 false이면 찜하기 버튼이 보이고 true이면 찜한 상품이라고 표시된다  -->
									<c:if test="${sessionScope.id != null}">      
										<c:choose>
											<c:when test="${requestScope.checkZ == 'false'}">
												<a href="${contextPath}/mycon/likeAction.do?id=${sessionScope.id}&num=${Bean.num}&name=${Bean.name}&image=${Bean.image}" class="btn btn-outline-primary">찜하기</a>
											</c:when>
											<c:when test="${requestScope.checkZ == 'true'}">
												<a href="${contextPath}/mycon/likeAction.do?id=${sessionScope.id}&num=${Bean.num}&name=${Bean.name}&image=${Bean.image}" class="btn btn-outline-primary">찜취소</a>
											</c:when>
										</c:choose>
									</c:if>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section>
		<nav style="width: 1500px; height:60px; position: relative; top: -100px; right: -300px;">
			<ul style="	list-style:none; font-family: verdana,Geneba,sans-serif;">
				<li style="float: left;margin-left: 175px;"><a style="text-decoration: none;color: #333;font-size: 25px;" onclick="explanation()">상세정보</a></li>
				<li style="float: left;margin-left: 175px;"><a style="text-decoration: none;color: #333;font-size: 25px;" onclick="reply('${sessionScope.id}','${sessionScope.is_admin}')">관람후기</a></li>
				<li style="float: left;margin-left: 175px;"><a style="text-decoration: none;color: #333;font-size: 25px;" onclick="review()">공연장소</a></li>
				<li style="float: left;margin-left: 175px;"><a style="text-decoration: none;color: #333;font-size: 25px;" onclick="trybuy()">티켓예매</a></li>
			</ul>
		</nav>
		<hr style="width: 1200px; position: relative; top: -100px;">


		<div class="detail" id="explanation"><jsp:include page="../proinc/explanation.jsp" /></div>
		<div class="detail" id="reply"  style="display: none; position: relative; top: -100px;"><jsp:include page="../proinc/reply.jsp"/></div>
		<div class="detail" id="review" style="overflow:hidden;position:relative;width:0;height:0">
			<div style="position:absolute;">
				<jsp:include page="../proinc/review.jsp" />
			</div>
		</div>
		<div class="detail" id="trybuy" style="display: none; position: relative; top: -100px;"><jsp:include page="../proinc/trybuy.jsp" /></div>
	</section>

	<jsp:include page="../include/footer.jsp" />    
    
  
  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/bootstrap-datepicker.js"></script>
  <script src="../js/jquery.timepicker.min.js"></script>
  <script src="../js/scrollax.min.js"></script>
  <script src="../js/main.js"></script>
    
  </body>
</html>