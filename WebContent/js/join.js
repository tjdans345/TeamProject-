/**
 * 회원가입 폼 JS
 */

// Daum postcode API

			
var result_pwd = false;

var idx = false;

 function daumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var addr = ''; // 주소 변수
             var extraAddr = ''; // 참고항목 변수

             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 addr = data.roadAddress;
             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 addr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
             if(data.userSelectedType === 'R'){
                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraAddr !== ''){
                     extraAddr = ' (' + extraAddr + ')';
                 }
              // 참고항목의 유무에 따라 최종 주소를 만든다.
                 addr += (extraAddr !== '' ? extraAddr : '');
             
             } 

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById("zip").value = data.zonecode;
             document.getElementById("address1").value = addr;
             // 커서를 상세주소 필드로 이동한다.
             document.getElementById("address2").focus();
         }
     }).open();
 }
 
 
 function checkPwd(){
	 var pwd1 = $("#InputPassword1").val();
 	 var checkSpan = $("#checkPwd1");
 	 var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
 	
	 if(!reg.test(pwd1)){
		 checkSpan.html("<font color='red'><b>영문,특수문자,숫자 조합으로 8자 이상으로 작성하세요.</b></font>");		 
	 }else{
		 checkSpan.html("<font color='blue'><b>사용가능한 비밀번호 입니다.</b></font>");
		 result_pwd = true;
	 }
 }
 
 function checkPwd2(){
	   	var pwd1 = document.getElementById("InputPassword1").value;
	    var pwd2 = document.getElementById("InputPassword2").value;
	    var checkSpan = document.getElementById("checkPwd2");
	    if(pwd2 != ""){
		   	if(pwd2 == pwd1){
		    	checkSpan.innerHTML = "<font color='blue'><b>비밀번호가 일치합니다.</b></font>";
		    }else{
		   		checkSpan.innerHTML = "<font color='red'><b>비밀번호가 일치하지 않습니다.</b></font>";
		   	}
	    }
}
 
 function checkPhone(){
 	var phone = $("#phone").val();
 	var checkSpan2 = $("#checkPhone");
 	var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
 	
  	if(!regPhone.test(phone)){
  		checkSpan2.html("<font color='red'><b>형식이 맞지 않습니다.</b></font>");
  	}else{
  		checkSpan2.html("<font color='blue'><b>사용가능한 전화번호</b></font>");
  	}
 }
 
 function checkId(){
	 var id = $("#InputId").val();
	 var checkSpan4 = $("#checkId");
	 var regId = /^[a-zA-Z0-9]{4,12}$/;
	 
	 if(!regId.test(id)){
		 checkSpan4.html("<font color='red'><b>아이디는 4~12글자로 대/소문자와 숫자만 사용가능합니다.</b></font>");
		 document.getElementById("authBtn").disabled=true;
	 }else{
		 checkSpan4.html("<font color='blue'><b>사용가능한 아이디 입니다.</b></font>");
		 document.getElementById("authBtn").disabled=false;
	 }
 }
 
 function checkName(){
 	var name = $("#name").val();
 	var checkSpan3 = $("#checkName");
 	var regName = /^[가-힣]{2,4}$/;
 	
  	if(!regName.test(name)){
  		checkSpan3.html("<font color='red'><b>형식이 맞지 않습니다.</b></font>");
  	}else{
  		checkSpan3.html("<font color='blue'><b>사용가능 합니다.</b></font>");
  	}
 }
 
 
		function result(){
			opener.document.joinForm.InputId.value = document.idc.userid.value;
			opener.document.getElementById("InputId").readOnly = true;
			opener.document.getElementById("authBtn").disabled = true;
			window.close();
		}
		
function checkForm(){
	
	var modalContents = $(".modal-contents");
	var modal = $("#defaultModal");
	
	var provision = $('#provision');
	var memberInfo = $('#memberInfo');
			
			if($("#InputId").val()==""){
				modalContents.text("아이디를 입력해 주시기 바랍니다.");
				modal.modal('show');
				$("#InputId").focus();
				return false;
			}else if($("#InputPassword1").val()==""){
				modalContents.text("비밀번호를 입력해 주시기 바랍니다.");
				modal.modal('show');
				$("#InputPassword1").focus();
				return false;
			}else if($("#InputPassword2").val()==""){
				modalContents.text("비밀번호 확인창을 입력해야 합니다.");
				modal.modal('show');
				$("#InputPassword2").focus();
				return false;
			}else if(!result_pwd){
				modalContents.text("두 비밀번호가 일치하지 않습니다.");
				modal.modal('show');
				$("#InputPassword1").focus();
				return false;
			}else if($("#name").val()==""){
				modalContents.text("이름을 입력해야 합니다.");
				modal.modal('show');
				$("#name").focus();
				return false;
			}else if(idx==false){
				modalContents.text("이미 사용중인 아이디입니다.");
				modal.modal('show');
				return false;
			}else if($("#agree")==false){
				
			}else if($('#provisionYn:checked').val()=="N"){
				modalContents.text("회원가입약관에 동의하여 주시기 바랍니다.");
				modal.modal('show');
				$('#provisionYn').focus();
				return false;
			}else if($('#memberInfoYn:checked').val()=="N"){
				modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
				modal.modal('show');
				
				$('#memberInfoYn').focus();
				return false;
			}else if($('#InputId')){

			}else{
				return;
			}
		}

function authId(){
	
	var id = $("#InputId").val();
	
	if(id == ""){
		alert("아이디를 입력하세요.");
	}else{
		$.ajax({
			type : 'POST',
			url : '/PP/IdCheck',
			data : {id : id},
			success : function(result1){
				var str1;
				if(result1 == "false"){
					str1 = "<font color='blue'><b>사용 가능한 아이디입니다.</b></font>";
					$('#checkId').html(str1);
					idx=true;
				}else{
					str1 = "<font color='red'><b>이미 사용중인 아이디입니다.</b></font>";
					$('#checkId').html(str1);
				}}, error : function(){
					alert("Error!");
				}
		});
	}
}
 