	function EmailCheck(){
		var email = $("#email2").val();
		var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(email == null || email==""){
			window.alert("이메일을 써주세요.");
		}else if(!regEmail.test(email)){
			window.alert("형식에 맞게 써주세요.");
		}else{
			document.pwForm.submit();
		}
	}

	 
