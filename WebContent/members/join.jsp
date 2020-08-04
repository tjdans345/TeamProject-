<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%--로그인유무 확인 --%>
<c:if test="${sessionScope.id != null}">
   <script>
      	alert("이미 로그인 중입니다.");
      	location.href="${contextPath}";
   </script>
</c:if>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>bootstrap template</title>
	
    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery(부트스트랩의 자바스크립트 플러그인을 위해 필요)-->
    <script src="http://code.jquery.com/jquery.js"></script> 
    <!-- 모든 합쳐진 플러그인을 포함하거나 필요한 파일을 포함 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Respond.js으로 IE8에서 반응형 기능활성화 -->
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	
<!-- Daum postcode API -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

  </head>
  <body>
<jsp:include page="../include/header.jsp" />
      <div class="container" style="width: 70%;">
     
	      		
      	<!-- START 모달창 -->
      	<div class="modal fade" id="defaultModal">
      		<div class="modal-dialog">
      			<div class="modal-content">
      				<div class="modal-header">
      				<h4 class="modal-title" style="align: left;">알림</h4>
      					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>      					
      				</div>
      				<div class="modal-body">
      					<p class="modal-contents"></p>
      				</div>
      				<div class="modal-footer">
      					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      				</div>
      			</div>   <!-- /.modal-content -->
      		</div>		<!-- /.modal-dialog -->
      	</div>	<!-- /.modal -->
      	<!-- END 모달창 -->
		<!-- 본문 START -->
		<div class="page-header" style="margin-top: 50px;">
          
          <h1>Sign Up</h1>
        </div>
        <hr/>
          <form role="form" action="${contextPath}/member/joinAction.do" method="post" name="joinForm" onsubmit="return checkForm()">

            <div class="form-group">
              <label for="username"><font color="red">*</font>아이디</label>
                <div class="input-group">
                  <input type="text" class="form-control" id="InputId" name="id" placeholder="ID입력" onblur="checkId()">
                  <span class="input-group-btn">
                  <input type="button" class="btn btn-primary" style="background-color: #EB008B !important; border-color: #EB008B !important; color: #fff !important;" onclick="authId()" id="authBtn" value="중복확인">
                  </span>
			   </div>
			   <span id="checkId">&nbsp;</span>
            </div>
            
            <div class="form-group">
              <label for="InputPassword1"><font color="red">*</font>비밀번호</label>
              <input type="password" class="form-control" id="InputPassword1" name="password" placeholder="비밀번호" onblur="checkPwd()">
                <span id="checkPwd1">&nbsp;</span>
            </div>
            
            <div class="form-group">
              <label for="InputPassword2"><font color="red">*</font>비밀번호 확인</label>
              <input type="password" class="form-control" id="InputPassword2" placeholder="비밀번호 확인" onblur="checkPwd2()">
                <span id="checkPwd2">&nbsp;</span>
            </div>
            
            <div class="form-group">
              <label for="username"><font color="red">*</font>이름</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해 주세요" onblur="checkName()">
                <span id="checkName">&nbsp;</span>
            </div>
            
            <div class="form-group">
              <label for="username">휴대폰</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="- 없이 입력해 주세요" onblur="checkPhone()">   
            	<span id="checkPhone">&nbsp;</span>
            </div>
            
            <div class="form-group">
            	<label for="username">이메일</label>
            	  <input type="email" class="form-control" id="email" name="email" placeholder="Ex) Admin@google.com">
            </div>
            
            <div class="form-group">
              <label for="username">주소</label>
               <div class="input-group">
                <input type="text" id="zip" name="zipcode" class="form-control" readonly>
                 <span class="input-group-btn" height="58px">
                  <button type="button" class="btn btn-success" style="background-color: #00E7D6 !important; border-color: #00E7D6 !important; color: #fff !important" id="search" onclick="daumPostcode()">우편번호 찾기<i class="fa fa-mail-forward spaceLeft"></i></button>
                 </span>
                </div>
                <input type="text" id="address1" name="address1" class="form-control" readonly >
                <input type="text" id="address2" name="address2" class="form-control" placeholder="상세주소를 입력하여 주세요"><br>
           
            </div>
            <div class="form-group">
            	<label for="provision">회원가입약관</label>
            	<div id="provision">
            		<textarea class="form-control" rows="8" style="resize:none" readonly>약관동의
            		제 1 조 (목적)
1. 본 약관은 기업마당 사이트가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 기업마당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2 조 (약관의 효력과 변경)
1. 기업마당 사이트는 귀하가 본 약관 내용에 동의하는 경우 기업마당 사이트의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.
2. 기업마당 사이트는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 기업마당 사이트 내에 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다.
이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.
제 3 조 (약관 외 준칙)
1. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.
제 4 조 (용어의 정의)
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.

1. 이용자 : 본 약관에 따라 기업마당 사이트가 제공하는 서비스를 받는 자.
2. 가입 : 기업마당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위.
3. 회원 : 기업마당 사이트에 개인 정보를 제공하여 회원 등록을 한 자로서 기업마당 사이트가 제공하는 서비스를 이용할 수 있는 자.
4. 비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합.
5. 탈퇴 : 회원이 이용계약을 종료시키는 행위.
            		</textarea>
            		<div class="radio">
            			<label>
            				<input type="radio" id="provisionYn" name="provisionYn" value="Y" checked>
            				동의합니다.
            			</label>
            		</div>
            		<div class="radio">
            			<label>
            				<input type="radio" id="provisionYn" name="provisionYn" value="N">
            				동의하지 않습니다.
            			</label>
            		</div>
            	</div>
            </div>
            <div class="form-group">
            	<label for="memberInfo">개인정보취급방침</label>
            	<divid="memberInfo">
            		<textarea rows="8" class="form-control" style="resize:none" readonly>개인정보의 항목 및 수집 방법
            		개인정보의 항목 및 수집 방법
            	가. 수집하는 개인정보 항목
1) 필수항목
① 인터넷 회원가입: 이름, 본인확인기관을 통한 본인인증 결과 값(CI, 마이핀, 생년월일, 성별, 내외국인 정보), 아이디, 비밀번호, 휴대폰, 이메일, 14세 미만 아동의 경우 법정대리인 이름, 법정 생년월일, 휴대폰번호 마케팅활용동의
② 호텔서비스 이용 시 : 정산내역, 쿠폰사용내역, 불량 이용 기록
2) 선택항목
① 인터넷 회원가입: 우편물 수령지, 주소, 전화, 직장인 경우(직장명, 직위, 부서), 생년월일, 결혼기념일, 영문명, 닉네임, 사진
② 호텔 방문 시 : 차량번호, 차량종류, 화상정보(카메라, CCTV에 의한 촬영, 실시간 날씨 정보 웹캠)
3) 서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집 될 수 있는 항목: IP Address, 쿠키
4) 유료 서비스 이용 과정 시 수집하는 정보: 신용카드(카드사명, 카드번호), 휴대폰(휴대폰번호, 통신사, 결제승인번호), 계좌이체(은행명, 계좌번호)
5) 수집하는 개인정보는 서비스 제공에 필요한 최소한의 정보만으로 한정되며, 회원(고객)의 기본적 인권을 침해할 우려가 있는 민감한 개인정보(인종, 종교, 사상, 출신지, 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.
            		</textarea>
            		<div class="radio">
            			<label>
            				<input type="radio" id="memberInfoYn" name="memberInfoYn" value="Y" checked>
            				동의합니다.
            			</label>
            		</div>
            		<div class="radio">
            			<label>
            				<input type="radio" id="memberInfoYn" name="memberInfoYn" value="N">
            				동의하지 않습니다.
            			</label>
            		</div>
            	</div>
            </div>
            <div class="form-group text-center" style="margin-bottom: 100px;">
              <input type="submit" class="btn btn-info" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important;" value="회원가입">
              <button type="button" class="btn btn-warning" style="background-color: #A9FF7F !important; border-color: #A9FF7F !important; color: #fff !important; onclick="location.href='${contextPath}'">메인으로</button>
            </div>
          </form>
    <script src="../js/join.js"></script>
    <jsp:include page="../include/footer.jsp"></jsp:include>  

  </body>
  
</html>
