<!-- slider.jsp -->
<!DOCTYPE html>
<html>

<head>
  <title>W3.CSS</title>

  <style>
    .mySlides {display:none;
     width: 100%;
     height: 500px ! important;

   }
   .back-img {
     background: url("img/1back.jpg");
     height: 40vh;
     width: 100%;
     background-repeat: no-repeat;
     background-size: cover;
   }

   .crd-ho:hover {
     background-color: #d9dedb;
   }
 </style>
</head>

<body>


  <div class="w3-content w3-section">
    <img class="mySlides" src="image/slide1.jpg" style="width:100%">
    <img class="mySlides" src="image/slide2.jpg" style="width:100%">
    <img class="mySlides" src="image/slide3.jpg" style="width:100%">
    <img class="mySlides" src="image/slide5.jpg" style="width:100%">
  </div>

  <script>
    var myIndex = 0;
    carousel();

    function carousel() {
      var i;
      var x = document.getElementsByClassName("mySlides");
      for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";  
      }
      myIndex++;
      if (myIndex > x.length) {myIndex = 1}    
        x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 2500); // Change image every 2 seconds
}
</script>

</body>
</html>
