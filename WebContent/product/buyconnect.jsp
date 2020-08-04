<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
		$(document).ready(function(){	
			//체크박스들이 변경되었을 때
			$(":checkbox").change(function(){	
				var cnt = $("#count").val();
				
				
			//셀렉트박스의 값과 체크박스중 체크된 갯수가 같을때, 다른 체크박스들을 disabled처리함
				if(cnt == $(":checkbox:checked").length){
					$(":checkbox:not(:checked)").attr("disabled","disabled");
					$("#submit").attr("disabled",false);
				}else{	//체크된 갯수가 다르면 활성화 시킴
					$(":checkbox").removeAttr("disabled");
					$("#submit").attr("disabled",true);
				}
			
				var seat = document.getElementsByName("seat");
				var before = "${chseat}";
				var reseat = before.split(',');

 				for(var i=0;seat.length;i++){
 					for(var j=0;j<reseat.length;j++){
 						if(seat[i].value == reseat[j]){
 							seat[i].disabled = true;
 						}
					}
 				}			
			});
			
			//셀렉트박스에서 다른 인원수를 선택하면 초기화를 시킴
 			$("#count").change(function(){
				$(":checkbox").removeAttr("checked");
				$(":checkbox").removeAttr("disabled");	
				
				var count = Number(document.getElementById("count").value);

				var price = Number(${DBean.price});
				var Max = price*count;
				
				var print = Max.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
				$("#total").text(print);
				document.getElementById("totalprice").value = Max;	
				
				var seat = document.getElementsByName("seat");
				var before = "${chseat}";
				var reseat = before.split(',');

 				for(var i=0;seat.length;i++){
 					for(var j=0;j<reseat.length;j++){
 						if(seat[i].value == reseat[j]){
 							seat[i].disabled = true;
 						}
					}
 				}
				
			}); 
		
		});

		</script>
		
	<style type="text/css">
		#table{
			margin-left: 200px;
			width: 600px;
			min-height:800px;
			text-align: center;
			font-size: 16px;
		}
		 
		#count{
			vertical-align: middle;
			text-align-last: center;
			width: 80px;
		}
		#submit{
			width: 150px;
			height: 40px;
			margin-left: 650px;
		}
	
	</style>  
</script>
</head>
  <body>
<jsp:include page="../include/header.jsp" />
    <!-- END nav -->
    

	<section class="ftco-section">
		<div class="container">
		
		<div class="page-header" style="margin-top: -50px;">
          
        <h1 style="margin-left: 300px;">Check</h1>
        </div>
       
        
		
			<div class="row">
				<div>
					<div class="row">
						<div class="col-md-12 d-flex ftco-animate">
							<div class="blog-entry blog-entry-2 justify-content-end d-md-flex w-100">
								<form action="${contextPath}/Order/order.do" name="selectform">
									<input type="hidden" name="id" value="${sessionScope.id}">
									<input type="hidden" name="name" value="${DBean.name}">
									<input type="hidden" name="detailnum" value="${DBean.detailnum}">
									<input type="hidden" name="today" value="${DBean.today}">
									<table border="1" id="table" style="text-align: center; border: 1px solid #dddddd; max-width: 80%; margin-left: 300px;">
										<tr>
											<td style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">콘서트명</b></td>
											<td>${DBean.name}</td>
										</tr>
										<tr>
											<td style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">포스터</b></td>
											<td><img src="../consert/${DBean.image}"></td>
										</tr>
										<tr>
											<td style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">장르</b></td>
											<td>${DBean.genre}</td>
										</tr>
										<tr>
											<td style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">>관람등급</b></td>
											<td>${DBean.cla}</td>
										</tr>
										<tr>
											<td style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">관람시간</b></td>
											<td>${DBean.runtime}분</td>
										</tr>
										<tr>
											<td style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">공연장</b></td>
											<td>${DBean.place}</td>
										</tr>
										<tr>
											<td style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">공연날짜</b></td>
											<td><fmt:formatDate value="${DBean.today}" type="date"
													dateStyle="full" /></td>
										</tr>
										<tr>
											<td style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">시작시간</b></td>
											<td>${fn:split(DBean.starttime,':')[0]}시
												${fn:split(DBean.starttime,':')[1]}분</td>
										</tr>
										<tr>
											<td style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">가격</b></td>
											<td><fmt:formatNumber value="${DBean.price}"
													pattern="#,###" />원</td>
										</tr>
										<tr>
											<td style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">예매수</b></td>
											<td><select id="count" name="count">

													<c:choose>
														<c:when test="${(DBean.seat-DBean.totalreserved) > 4}">
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
														</c:when>
														<c:when test="${(DBean.seat-DBean.totalreserved) < 4}">
															<c:forEach begin="1"
																end="${DBean.seat-DBean.totalreserved}"
																varStatus="seatnum">
																<option>${seatnum.count}</option>
															</c:forEach>
														</c:when>
													</c:choose>
											</select></td>
										<tr>
										<tr>
											<td style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">총가격</b></td>

											<td id="total"><fmt:formatNumber value="${DBean.price}"
													pattern="#,###" />원</td>
										</tr>
										<tr>
											<td style="background-color: #3d435c; text-align: center;"><b style="color: #fff;">좌석선택</b></td>
											<td>
												<p>좌석 배치도</p>
												
												<table align="center">
													<c:set var="alphabet" value="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T"/>
												
													<tr>
														<td style="float: left; margin-left: 10px;"></td>
														<c:forTokens items="${alphabet}" delims="," var="letter">
														<c:forEach var="i" items="${letter}">
															<td>${i}</td>
														</c:forEach>
														</c:forTokens>
													</tr>
													<c:forEach begin="1" end="${DBean.seat}" varStatus="num">
														<fmt:parseNumber var="titlenum" value="${(num.count+19)/20}" integerOnly="true" />
														<c:choose>
															<c:when test="${num.count%20==1}">
																<tr>
																	<td>${titlenum}</td>
															</c:when>
														</c:choose>
														<c:forTokens items="${alphabet}" delims="," var="letter">
														
															<c:choose>
																<c:when test="${num.count%20==1}">
																	<td><input type="checkbox" name="seat" value="${letter}${titlenum}" onclick="check()"></td> 
																		<%-- <td>${letter}${titlenum}</td> --%>
																</c:when>
															</c:choose>

														</c:forTokens>
														<c:choose>
															<c:when test="${num.count%20==0}">
																</tr>
															</c:when>
														</c:choose>

													</c:forEach>

												</table>						
											</td>
										</tr>
									</table>


									<script>
										var seat = document.getElementsByName("seat");
										var before = "${chseat}";
										var reseat = before.split(',');

					 					for(var i=0;seat.length;i++){
					 						for(var j=0;j<reseat.length;j++){
					 							if(seat[i].value == reseat[j]){
					 								seat[i].disabled = true;
					 							}
											}
										}
									</script>



									<%-- <c:set var="alphabet" value="A,B,C,D,E,F,G,H,I,G,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"/>
								<c:forTokens items="${alphabet}" delims="," var="letter"  >
									${letter}
								</c:forTokens> --%>
								<script>
									var cnt = $("#count").val();
									
									if(cnt != $(":checkbox:checked").length){
										alert("예매선택한 갯수와 좌석선택수가 일치하지 않습니다.");
										$(".submit").attr("disabled",false);
										return;
									}
								</script>
								
									<input type="submit" style="margin-top:50px; margin-right:-10px; background-color: #00E7D6 !important; 
									border-color: #00E7D6 !important; color: #fff !important; margin-bottom: 10px;" 
									value="장바구니에 담기" id="submit" disabled="disabled" class="btn btn-info" >
								
									<input type="hidden" id="totalprice" name="totalprice" value="${DBean.price}">
								</form>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div>

	</div>
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