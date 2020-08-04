<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

    <!-- 회원 관리 페이지 -->
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Ready Bootstrap Dashboard</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="${contextPath}/admins/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="${contextPath}/admins/assets/css/ready.css">
	<link rel="stylesheet" href="${contextPath}/assets/css/demo.css">
<!-- 	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->

  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
	
  <script type="text/javascript">
  
  function sendFile(file, editor) {
	  	alert("왔는데?");
		var data = new FormData();
		data.append('uploadFile', file);
		
		$.ajax({// ajax를 통해 파일 업로드 처리
		
			data: data,
			dataType : "json",
			type: "POST",
			url: "${contextPath}/admin/test3.do",
			cache: false,
			contentType: false,
			processData: false,
			success: function(data) {// 처리가 성공할 경우
				// 에디터에 이미지 출력
				//alert(data.url);
				//alert(JSON.stringify(data));
				var aa = JSON.parse(JSON.stringify(data));
				var bb = aa.List;
				var image = bb[0].url;
				alert(image);
				alert("콜백성공");
				var te3 = "<img src="+"'"+image+"'/>";
				$("#test5").html(te3);
			}
			
		});
		
	}
  
  
  </script>
	
</head>
<body>
<jsp:include page="./include/top_navi.jsp" />


	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<h4 class="page-title"><mark>${qnaUpdate.id}</mark>님의 문의 내역</h4>

				<form action="${contextPath}/admin/AqnaUpdate.do?status=1" method="POST">
				<input type="hidden" name=qna_num value="${qnaUpdate.qna_num}">
					<div class="form-group">
						<label for="title">제목:</label> 
						<input type="text" class="form-control" placeholder="title" id="title" name="title" value="${qnaUpdate.qna_title}" readonly="readonly">
					</div>
					
					<div class="form-group">
						<label for="title">카테고리:</label> 
							<input type="text" class="form-control" placeholder="title" id="title" name="cate" value="${qnaUpdate.qna_cate}" readonly="readonly">
							
					</div>
					
<!-- 					<div class="form-group"> -->
<!-- 						<label for="title">Category:</label> -->
<%-- 						<c:if test="${notice.n_cate == '서비스 소식' }"> --%>
<!-- 							<select class="form-control input-square" id="squareSelect" name= "n_cate" style="width: 10%;"> -->
<!-- 							<option value="서비스 소식" selected="selected">서비스 소식</option> -->
<!-- 							<option value="서비스 점검">서비스 점검</option> -->
<!-- 							<option value="안내">안내</option> -->
<%-- 						</c:if>	 --%>
<%-- 						<c:if test="${notice.n_cate == '서비스 점검' }"> --%>
<!-- 							<select class="form-control input-square" id="squareSelect" name= "n_cate" style="width: 10%;"> -->
<!-- 							<option value="서비스 소식">서비스 소식</option> -->
<!-- 							<option value="서비스 점검" selected="selected">서비스 점검</option> -->
<!-- 							<option value="안내">안내</option> -->
<%-- 						</c:if>		 --%>
<%-- 						<c:if test="${notice.n_cate == '안내' }"> --%>
<!-- 							<select class="form-control input-square" id="squareSelect" name= "n_cate" style="width: 10%;"> -->
<!-- 							<option value="서비스 소식">서비스 소식</option> -->
<!-- 							<option value="서비스 점검">서비스 점검</option> -->
<!-- 							<option value="안내" selected="selected">안내</option> -->
<%-- 						</c:if> --%>
<!-- 						</select> -->
<!-- 					</div> -->

						<div class="form-group">
						<label for="title">문의 내용:</label> 
							<textarea class="form-control" id="comment" rows="10" readonly="readonly" name="contents">${qnaUpdate.qna_contents}</textarea>
						</div>
					
						
					<div class="form-group">
						<label for="content">답변 입력 칸:</label>
						<textarea id="summernote" class="form-control" rows="5" name="answer" >
						<p>-- 문의하신 내용에 대한 2Ticket 답변입니다 --</p>
						 <p id="test5"></p>
						 </textarea>
					</div>
					<br><br>
					<div align="center">
					<button type="submit" class="btn btn-success" >답변 등록</button>
					<button type="reset" class="btn btn-warning">다시 쓰기</button>
					<button onclick="location.href='${contextPath}/admin/Aqnaboardp.do?status=0'" type="reset" class="btn btn-danger">목록 으로</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	</div>
	<!-- Modal -->
	<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h6 class="modal-title"><i class="la la-frown-o"></i> Under Development</h6>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span> 
					</button>
				</div>
				<div class="modal-body text-center">									
					<p>Currently the pro version of the <b>관리자 페이지</b> Bootstrap is in progress development</p>
					<p>
						<b>We'll let you know when it's done</b></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	 <!-- 이 부분 질문 하기 -->
	<script> 
  $(document).ready(function() {
		$('#summernote').summernote({
			tabsize : 2,
			height : 300
		});
		
// 		$('.dropdown-toggle').dropdown()


	});
    
    $('#summernote').summernote({
    		
    	  height: 300,                 // set editor height
    	  minHeight: null,             // set minimum height of editor
    	  maxHeight: null,             // set maximum height of editor
    	  focus: true,                 // set focus to editable area after initializing summernote
    	  
    	  callbacks: {// 콜백을 사용
    		  // 이미지를 업로드할 경우 이벤트를 발생
    		  onImageUpload: function(files, editor, welEditable) {
    			  alert("엥?");
    			  sendFile(files[0], this);
    		  } 
    	   }
    	});
    
   		
    
    
  </script>
  
  
</body>
<script src="${contextPath}/admins/assets/js/core/jquery.3.2.1.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="${contextPath}/admins/assets/js/core/popper.min.js"></script>
<script src="${contextPath}/admins/assets/js/core/bootstrap.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/chartist/chartist.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/chart-circle/circles.min.js"></script>
<script src="${contextPath}/admins/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="${contextPath}/admins/assets/js/ready.min.js"></script>
<script src="${contextPath}/admins/assets/js/demo.js"></script>
</html>