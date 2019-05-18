<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Product Description</title>
<style>
.card {
  background-color: #f2f2f2;
  width: 900px;
  height: 300px;
  border: 1px solid #000000;
  margin-top:50px;
  margin-left:50px;
}
</style>
</head>
<body class="bg">
<%@ include file="Header.jsp" %>
<form method="post" action="<c:url value="/addCart/${product.productId}"/>">
<div class="container">
<div class="card">
<img class="img-fluid img-thumbnail" src="<c:url value="/resources/images/${product.productId}.jpg"/>" style="width:250px; height:300px; float:left;">
<div style="font-size:25px;">
${product.productName}<br>
</div>
<div style="font-size:15px;">
${product.productDesc}<br>
<div style="float:right;margin-right:20px;">
Price:<b>INR</b>&nbsp;${product.price}<br>
${alert}<br>
<input type="submit" class="btn btn-success" value="ADD TO CART">
</div>
</div>
</div>
</form>
<%@ include file="Footer.jsp"%>
</body>
</html>