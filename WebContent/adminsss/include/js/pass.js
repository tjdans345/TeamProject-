 
var result_pwd = false;
var result_pwd2 = false;

function checkPwd(){
	 var pwd1 = $("#InputPassword1").val();
 	 var checkSpan = $("#checkPwd1");
 	 var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
 	
	 if(!reg.test(pwd1)){
		 checkSpan.html("<font color='red'><b>영문,특수문자,숫자 조합으로 8자 이상으로 작성하세요.</b></font>");		 
		 result_pwd = false;
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
		   	if(pwd1 == pwd2){
		    	checkSpan.innerHTML = "<font color='blue'><b>비밀번호가 일치합니다.</b></font>";
		    	result_pwd2 = true;
		   	}else{
		   		checkSpan.innerHTML = "<font color='red'><b>비밀번호가 일치하지 않습니다.</b></font>";
		   		result_pwd2 = false;
		   	}
	    }
}
 
 
 function checkForm2(){
		
		var modalContents = $(".modal-contents");
		var modal = $("#defaultModal");
				
				if($("#InputPassword1").val()==""){
					modalContents.text("비밀번호를 입력해 주시기 바랍니다.");
					modal.modal('show');
					$("#InputPassword1").focus();
					return false;
				}else if($("#InputPassword2").val()==""){
					modalContents.text("비밀번호 확인창을 입력해야 합니다.");
					modal.modal('show');
					$("#InputPassword2").focus();
					return false;
				}else if(result_pwd == false){
					modalContents.text("비밀번호 형식이 잘못되었습니다.");
					modal.modal('show');
					$("#InputPassword1").focus();
					return false;
				}else if(result_pwd2 == false){
					modalContents.text("두 비밀번호가 일치하지 않습니다.");
					modal.modal('show');
					$("#InputPassword1").focus();
					return false;
				}else{
					return;
				}
			}