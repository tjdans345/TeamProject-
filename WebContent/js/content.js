/**
 * 
 */

function explanation() {
	document.getElementById("explanation").style.display = "block";
	document.getElementById("reply").style.display = "none";
	document.getElementById("review").style.display = "none";
	document.getElementById("trybuy").style.display = "none";
}

function review() {
	document.getElementById("explanation").style.display = "none";
	document.getElementById("reply").style.display = "none";
	//document.getElementById("review").style.display = "block";
	document.getElementById("review").style.width = "650px";
	document.getElementById("review").style.height = "400px";
	document.getElementById("review").style.margin = "0 auto";
	document.getElementById("trybuy").style.display = "none";
}

function openreply() {
	var form = document.frmReply;
	var contextPath = document.getElementById("contextPath").value;
	form.parentsnum.value = 0;
	document.frmReply.content.value ="";
	document.getElementById("write").style.display = "block";
}

function hide() {
	document.getElementById("write").style.display = "none";
}

function doublereply(num) {
	var form = document.frmReply;
	var contextPath = document.getElementById("contextPath").value;
	form.parentsnum.value = num;
	form.content.value="";
	document.getElementById("write").style.display = "block";
}

function updatereply(num) {
	var form = document.upReply;
	var contextPath = document.getElementById("contextPath").value;
	form.replynum.value = num;
	document.upReply.upcontent.value="";
	document.getElementById("upwrite").style.display = "block";
}
function uphide() {
	document.getElementById("upwrite").style.display = "none";
}

$(function() {
	$( "#testDatepicker" ).datepicker({
	});
});


