<html>
<head>
<title>FoodSpot</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<style>
#size { width:100%;max-height=500px;height:500px; }
#stylehead { 
     color:#000000; 
     animation:colorchange 2.5s; 
     font-family:cursive; 
     text-shadow: 0 0 30px #333333;
     }
@keyframes colorchange {
     0%  { color:#ffffff; }		 
     10% { color:#e6e6e6; }	 
     20% { color:#cccccc; }		 
     30% { color:#b3b3b3; }		
     40% { color:#999999; }		 
     50% { color:#808080; }		
     60% { color:#666666; }		 
     70% { color:#4d4d4d  }		 
     80% { color:#333333; }		
     90% { color:#1a1a1a; }		
}
</style>
<body class="bg">
<%@ include file="Header.jsp"%>
<marquee style="z-index:2;scrollamount="5"><a id="hom1"><span style="cursor:default">Order today get 50% offers for next 10 orders.</span></a> </marquee>
<div class="container">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
 
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

 
  <div class="carousel-inner">
    <div class="item active">
      <img src="<c:url value="/resources/images/carousel1.jpg"/>" id="size" alt="horizon">
    </div>

    <div class="item">
      <img src="<c:url value="/resources/images/carousel2.jpg"/>" id="size" alt="deadspace">
    </div>

    <div class="item">
      <img src="<c:url value="/resources/images/carousel3.jpg"/>" id="size" alt="batman">
    </div>
  </div>


  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
<%@ include file="Footer.jsp"%>
</body>
</html>
