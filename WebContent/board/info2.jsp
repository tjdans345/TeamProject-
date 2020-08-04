<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

    
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>이용안내</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/lux/bootstrap.min.css">
<!-- 부트스트랩 -->
    
<jsp:include page="../include/header.jsp"></jsp:include>

</head>
<body style="font-family: 'Nanum Gothic Coding', monospace;">

  <section class="ftco-section contact-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row block-9" style="margin-top: 50px;">
			
			<div class="col-md-10">
			
<!-- 탭메뉴 -->	
<ul class="nav nav-tabs" style="font-size: 14px;">
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link active"  href="${contextPath}/notice/listNotice.do" style="padding: 15px 85px 15px 85px;">
 	공지사항
 	</a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link"  href="${contextPath}/board/info2.jsp" style="padding: 15px 85px 15px 85px;">
 	이용안내
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
    <a class="nav-link active"  href="${contextPath}/fboard/faqlist.do" style="padding: 15px 100px 15px 100px;">
    FAQ
    </a>
  </li>
  <li class="nav-item" style="margin-right: 0;">
  
	  <c:choose>
	   	<c:when test="${id != null}">
	    		<a class="nav-link active"  href="${contextPath}/qboard/qnaList.do" style="padding: 15px 70px 15px 70px;">
	    		나의 문의 내역
	    		</a>
	  		</c:when>
	  		<c:when test="${id == null}">
	  			<a class="nav-link active"  href="${contextPath}/member/login.do" style="padding: 15px 70px 15px 70px;">
	  			나의 문의 내역
	  			</a>
	  		</c:when>
	  	</c:choose>

  </li>
</ul>			

<!-- 이용안내 -->

<div class="col">
  <div class="col-2">
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home" style="border-radius: 80px;">예매</a>
      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile" style="border-radius: 80px;">취소/환불</a>
      <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages" style="border-radius: 80px;">발권/배송</a>
    </div>
  </div>
  
  <div class="col-5">
    <div class="tab-content" id="nav-tabContent">
      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
	
	<h3>2티켓 예매 방법을 안내드립니다.</h3>
	<div class="use_guide_box">
	<h4>1.<span>회원가입, 로그인, 본인인증</span></h4>
		<ul>
			<li>예매 전, 회원가입과 로그인을 하셨는 지 확인해 주세요.</li>
			<li>예매를 위해서는 본인인증 절차가 필요하므로, 설정 메뉴에서 본인인증을 하셨는지 확인해 주세요.</li>
		</ul>
	</div>
	<div class="use_guide_box">
	<h4>2.<span>관람하고자 하는 공연 선택</span></h4>
		<ul>
			<li>2티켓에서 제공하는 여러 메뉴를 통해 관람하고자 하는 공연을 선택해 주세요.</li>
		</ul>
	</div>
	<div class="use_guide_box">
	<h4>3.<span>공연 날짜 및 시간 선택</span></h4>
		<ul>
			<li>공연 페이지에서 날짜와 시간을 선택해, 예매 가능한 좌석을 확인 후 예매하기 버튼을 눌러주세요.</li>
		</ul>
		<p class="guide_img">
			<img alt="01" src="${contextPath}/board/image/guide_img_01.png">
		</p>
	</div>
	<div class="use_guide_box">
	<h4>4.<span>원하는 좌석을 선택</span></h4>
		<ul>
			<li>좌석도에서 원하는 좌석을 선택해 주세요.</li>
			<li>선택하신 좌석은 그 시점부터 5분간만 선점되므로, 5분 내 예매/결제를 완료해 주세요.</li>
		</ul>
		<p class="guide_img">
			<img alt="01" src="${contextPath}/board/image/guide_img_02.png">
		</p>
	</div>
	<div class="use_guide_box">
	<h4>5.<span>티켓의 가격과 할인수단을 선택</span></h4>
		<ul>
			<li>티켓의 가격과 할인받을 수단을 선택해 주세요.</li>
		</ul>
		<p class="guide_img">
			<img alt="01" src="${contextPath}/board/image/guide_img_03.png">
		</p>
	</div>
	<div class="use_guide_box">
	<h4>6.<span>배송 방법 선택</span></h4>
		<ul>
			<li>상품별로 제공되는 티켓 배송방법을 선택해 주세요. (배송, 현장수령, 모바일 발권)</li>
			<li>'배송'을 선택하시는 경우 배송지 정보를 입력해야 합니다.</li>
		</ul>
	</div>
	<div class="use_guide_box">
	<h4>7.<span>결제수단 선택 및 결제</span></h4>
		<ul>
			<li>결제하실 수단을 선택하고 결제를 진행하세요. (상품별로 신용카드, 무통장입금, 휴대폰결제, 카카오페이 수단 중 일부만 제공될 수도 있습니다.)
</li>
		</ul>
		<p class="guide_img">
			<img alt="01" src="${contextPath}/board/image/guide_img_04.png">
		</p>
	</div>
	<div class="use_guide_box">
	<h4>8.<span>예매 내역 확인</span></h4>
		<ul>
			<li>'마이티켓 > 예매 확인/취소'에서 예매한 내역을 언제든지 확인하실 수 있습니다.</li>
		</ul>
		<p class="guide_img">
			<img alt="01" src="${contextPath}/board/image/guide_img_05.png">
		</p>
	</div>
	<div class="use_guide_box">
	<h4>9.<span>배송지 및 결제수단 변경</span></h4>
		<ul>
			<li>예매 시 입력 하셨던 배송지 또는 선택하셨던 결제수단을 변경하고자 할 경우, '마이티켓 > 예매확인/취소' 에서 변경하실 수 있습니다.</li>
			<li>결제수단 변경의 경우, 무통장미입금 예매 건에 한하여 신용카드, 카카오페이로 변경이 가능합니다.
그 외 결제수단의 변경이나 할부 개월 변경은 불가하며, 예매 건을 취소하고, 원하는 결제수단으로 재예매 하셔야 합니다.</li>
		</ul>
		<p class="guide_img">
			<img alt="01" src="${contextPath}/board/image/guide_img_06.png">
		</p>
	</div>
	
	
<!-- 취소 -->	

      </div>
      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
	
		<h3>2티켓의 취소/환불 규정을 안내드립니다..</h3>
	<div class="use_guide_box">
	<h4>1.<span>취소 마감 기한</span></h4>
		<p class="guide_img">
			<img alt="02" src="${contextPath}/board/image/g_img01.PNG">
		</p>
	</div>
	<div class="use_guide_box">
	<h4>2.<span>취소 수수료 안내</span></h4>
		<p class="guide_img">
			<img alt="02" src="${contextPath}/board/image/g_img02.PNG">
		</p>
		<ul>
			<li>취소일자에 따라 위와 같이 취소수수료가 부과됩니다.(예매일 기준보다 관람일 기준 우선 적용)</li>
			<li>취소마감시간 이후 또는 관람일 당일 예매 건은 취소/변경/환불이 불가합니다.</li>
			<li>취소 시 예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 해당기간 이후에는 환불되지 않습니다.</li>
		</ul>
	</div>
	<div class="use_guide_box">
	<h4>3.<span>배송 방법별 취소 안내</span></h4>
		<dl>
            <dt>[우편 배송]</dt>
            <dd>예매 당일에는 티켓 예매서비스 또는 티켓예매콜센터를 통해 직접 취소하실 수 있습니다.</dd>
            <dd>티켓이 발송된 이후에는 구매자가 취소를 원하는 티켓을 취소마감시한 전까지 회사로 반송, 도달하도록 한 경우에만 취소가 가능합니다. </dd>
            <dd>부분취소인 경우에도 취소를 원하는 티켓을 반송해야만 환불을 진행할 수 있습니다.</dd>
            <dd>티켓이 발송된 이후 구매 취소를 원하는 경우, 티켓의 왕복 배송비는 회원이 부담하는 것을 원칙으로 합니다.</dd>
            <dd>티켓 반품접수 시 이용자의 연락처, 반품사유, 무통장입금 고객의 경우 환불받은 본인 명의의 계좌를 반품신청서에 작성해 티켓과 동봉해야 합니다.</dd>
            <dd>수령한 티켓은 현금, 상품권과 같은 유가증권이므로 티켓이 분실되거나 훼손되었을 경우 예매 취소 및 변경이 불가합니다.</dd>
            <dt>[현장 수령]</dt>
            <dd>예매 당일에는 티켓 예매서비스 또는 티켓예매콜센터를 통해 직접 취소하실 수 있습니다.</dd>
            <dt>[모바일 티켓]</dt>
            <dd>티켓을 모바일로 수령 및 발권하신 경우 예매 취소가 불가합니다.</dd>
        </dl>
	</div>
	<div class="use_guide_box">
	<h4>4.<span>원하는 좌석을 선택</span></h4>
		<dl>
           <dt>[신용카드]</dt>
           <dd>취소수수료 및 배송료를 재승인 후 원 승인금액은 취소처리 됩니다.</dd>
           <dd>취소일로부터 영업일 3~5일 정도 후 카드사에서 취소 확인 가능합니다.</dd>
           <dd>환불소요기간은 평일 기준이며, 토/일/공휴일은 제외됩니다.</dd>
           <dd>카드사 관련 문의는 개인정보 확인 절차로 인해 멜론티켓에서 대신 확인해 드릴 수 없어 카드사를 통해 확인하시면 됩니다.</dd>
           <dt>[무통장 입금]</dt>
           <dd>취소수수료를 제외한 나머지 금액이 고객 환불 계좌에 입금됩니다.</dd>
           <dd>환불받으실 은행의 계좌번호와 예금주를 본인 명의로 정확하게 입력해 주세요.</dd>
           <dd>타인의 계좌를 이용하거나 명의를 도용했을 경우 서비스 이용이 제한될 수 있습니다.</dd>
           <dd>취소 처리를 접수한 날로부터 영업일 3~5일 이내 환불받으실 수 있습니다.</dd>
           <dt>[휴대폰]</dt>
           <dd>예매 취소 시, 기존에 결제했던 내역이 승인취소 되며, 취소 시점에 따라 취소수수료가 발생할 수 있습니다.</dd>
           <dd>취소수수료 발생 시, 동일한 결제수단으로 취소수수료 결제가 요청됩니다.</dd>
           <dt>[카카오페이]</dt>
           <dd>취소수수료 및 배송료를 재승인 후 원 승인금액은 취소처리 됩니다.</dd>
			<dd>취소일로부터 영업일 0~7일 정도 후 카카오페이(PG)사에서 취소 확인 가능합니다.</dd>
			<dd>환불소요기간은 평일 기준이며, 토/일/공휴일은 제외됩니다.</dd>
        </dl>
	</div>
</div>
	
	
<!-- 발권 -->	

    
    <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
	
	<h3>2티켓의 발권/배송 관련한 안내드립니다.</h3>
	<div class="use_guide_box">
	<h4>1.<span>배송</span></h4>
		<ul>
            <li>티켓 예매 결제 확인 후, 인편 배송으로 배송해 드립니다.</li>
            <li>일반적으로 예매 후 7일 이내 수령이 가능하며, 상품별로 티켓 배송일이 다를 수 있습니다.</li>
            <ul>
                <li>- 지역 및 배송서비스 사정에 따라 배송사가 변경될 수 있으며, 배송일이 추가적으로 소요될 수 있습니다. (CJ대한통운, 우체국 외 1개 업체, 주말/공휴일은 배송하지 않습니다.)</li>
                <li>- 일괄배송의 경우 공연 별로 배송일자가 상이하며 지정된 배송일자 기준으로 배송이 시작됩니다. (지정된 배송일자는 상세정보 및 예매공지사항에서 확인할 수 있습니다.)</li>
                <li>- 티켓 인도 장소에 수령자가 없는 경우 배송기간이 더 소요될 수 있습니다.</li>
                <li>- 행사 또는 행사일에 따라 현장 수령 방법 선택이 제한될 수 있습니다.</li>
            </ul>
            
        </ul>
	</div>
	<div class="use_guide_box">
	<h4>2.<span>현장 수령</span></h4>
		<ul>
           <li>행사 당일, 공연 시작시간 1시간 전 ~ 30분 전까지 행사장 매표소에서 직접 수령하셔야 합니다.</li>
           <li>예매번호가 포함되어 있는 예매확인서와 예매자의 실물 신분증(복사본 및 사진 불가) 을 매표소에 제출하시면 편리하게 티켓을 수령하실 수 있습니다.
           <ul>
               <li>- 예매확인서, 예매번호, 예매자의 주민등록상 생년월일 정보를 반드시 가져오셔야 합니다.</li>
               <li>- 학생, 장애인, 국가유공자 등의 할인 혜택을 받아 예매하신 경우 관련 증빙 서류를 꼭 지참하셔야 합니다.</li>
               <li>- 행사 또는 행사일에 따라 현장 수령 방법의 선택이 제한될 수 있습니다.</li>
               <li>- 공연별 정책이 상이하니 자세한 내용은 예매페이지 내 상세정보 확인 부탁드립니다.</li>
           </ul>
           </li>
       </ul>
	</div>
	<div class="use_guide_box">
	<h4>3.<span>모바일 티켓</span></h4>
		<ul>
            <li>예매하신 모바일티켓은 결제완료(입금완료) 기준으로 최대 1일 이내 카카오콘으로 발급됩니다. (모바일티켓 발급경로: 카카오톡 모바일앱 &gt; 더보기탭 &gt; 카카오콘) </li><li>모바일티켓으로 예매시 종이티켓은 별도로 제공되지 않습니다.</li>
            <li>내 멜론아이디와 연결된 카카오계정으로 모바일티켓이 발급됩니다. 연결된 카카오계정이 없으면 모바일티켓을 예매할 수 없으니, 모바일티켓 예매 전 연결 여부를 확인해주세요.</li>
            <li>학생, 장애인, 국가유공자 등의 할인혜택을 받아 예매하신 경우 관련 증빙 서류를 꼭 지참하셔야 합니다.
            <ul>
                <li>- 공연마다 입장을 위한 검표방식이 달라질 수 있습니다.</li>
                <li>- 검표 가능시간이 되면 모바일티켓 화면에 검표를 위한 ‘코드 스캔하기’ 버튼이 활성화됩니다.</li>
                <li>- 검표가 완료된 모바일티켓은 재검표가 불가능하며, 검표 이후에 는 모바일티켓 전달 및 예매취소 또한 불가능합니다.</li>
                <li>- QR직접스캔을 통해 검표하는 경우, 불법양도 및 캡쳐 이용을 제한하기 위해 최종 입장 전 공연장 직원이 모바일티켓 화면을 확 인할 수 있습니다.</li>
            </ul>
            </li>
        </ul>
	</div>
	
	
	</div>
    </div>
  </div>
</div>

			</div>
        </div>
	</div>
</section>


<jsp:include page="../include/footer.jsp"/>

</body>
</html>