<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
  
  
  
  
  
  
  
 <form action="/blog/board?cmd=writeProc" method="POST">

      <div class="form-group">
         <label for="title">Title:</label> <input type="text" class="form-control" placeholder="title" id="title" name="title">
      </div>

      <div class="form-group">
         <label for="content">Content:</label>
         <textarea id="summernote" class="form-control" rows="5" id="content" name="content"></textarea>
      </div>

      <button type="submit" class="btn btn-primary">글쓰기</button>
   </form>
  
  
  
  
  
  
  
  
  
  
  
  
  <script>
  $(document).ready(function() {
		$('#summernote').summernote({
			tabsize : 2,
			height : 300
		});
	});
    
    $('#summernote').summernote({
    	  height: 500,                 // set editor height
    	  minHeight: null,             // set minimum height of editor
    	  maxHeight: null,             // set maximum height of editor
    	  focus: true                  // set focus to editable area after initializing summernote
    	});
  </script>
</body>
</html>