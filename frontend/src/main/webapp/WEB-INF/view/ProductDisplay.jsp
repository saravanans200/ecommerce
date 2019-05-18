<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Product</title>
<style>
.card {
  background-color: #f2f2f2;
  width: 250px;
  height: 325px;
  border: 1px solid #000000;
  margin-top:25px;
  text-align: center;
}
.card:hover {
 box-shadow: 0 0 15px 0 #f2f2f2;
}
</style>
</head>
<body class="bg">
<%@ include file="Header.jsp"%>
<div class="container">
<div class="row">
${alert}
<c:forEach items="${listProducts}" var="product">
<div class="col-lg-4">
<div class="card">
<c:choose>
  <c:when test="${product.stock>0}">
  <a href="<c:url value="/ProductDesc/${product.productId}"/>"><img id="image" class="img-fluid img-thumbnail" src="<c:url value="/resources/images/${product.productId}.jpg"/>" style="width:250px; height:250px; "></a>
  <br><b>${product.productName}</b>
  <br><b>INR</b>&nbsp;${product.price}
  <br><font color="green">In Stock</font>
  </c:when>
  <c:otherwise>
  <img class="img-fluid img-thumbnail" src="<c:url value="/resources/images/${product.productId}.jpg"/>" style="width:250px; height:250px; ">
  <br>${product.productName}
  <br><b>INR</b>&nbsp;${product.price}
  <br><font color="red">Out of Stock</font>
 </c:otherwise>
</c:choose>
</div>
</div>
</c:forEach>
</div>
</div>
<%@ include file="Footer.jsp"%>
</body>
</html>