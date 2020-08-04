<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CodePen - Carousel</title>
  <link rel="stylesheet" href="../css/caro-style.css">



<style>
#prev:hover{background-color: #fff !important; color: #EB008B !important;}
#next:hover{background-color: #fff !important; color: #00E7D6 !important;}

</style>




</head>
<body>
<!-- partial:index.partial.html -->
<main>



    <div id="carousel" style="position: relative; top: 170px; margin-top: 120px;">
 
       <div class="hideLeft">
        <img src="../images/headmu.jpg">
      </div>

      <div class="prevLeftSecond">
        <img src="../images/rebeca.jpg">
      </div>

      <div class="prev">
        <img src="../images/hodu.jpg">
      </div>

      <div class="selected">
        <img src="../images/opera.jpg">
      </div>

      <div class="next">
        <img src="../images/con1.jpg">
      </div>

      <div class="nextRightSecond">
        <img src="../images/cats.jpg">
      </div>

      <div class="hideRight">
        <img src="../images/opera.jpg">
      </div>

    </div>

    <div class="buttons" style="position: relative; top: 50px;">
      <button id="prev" class="btn btn-outline-primary" style="background-color: #EB008B; border-color: #EB008B; color: #fff;">Prev</button>
      <button id="next" class="btn btn-outline-primary" style="background-color: #00E7D6; border-color: #00E7D6; color: #fff;">Next</button>
    </div>



  </main>
<!-- partial -->
  <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script><script  src="../js/script.js"></script>

</body>
</html>
