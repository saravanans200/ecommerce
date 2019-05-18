<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order</title>
</head>
<body>
<%@include file="Header.jsp"%>
<div class="container">
<form method="post" action="<c:url value="/paymentconfirm"/>">
<table class="table table-hover">
<tr>
<td>Product Image</td>
<td>Product Name</td>
<td>Product Price</td>
<td>Quantity</td>
</tr>
<c:forEach items="${listCarts}" var="cart">
<tr>
<td><img src="<c:url value="/resources/images/${cart.productId}.jpg"/>" width="75px" height="75px"><br>
</td>
<td>${cart.productName}</td>
<td>${cart.total}</td>
<td>${cart.quantity}</td>
</tr>
</c:forEach>
<tr>
<td></td>
<td>GrandTotal<td>
<td>${grandtotal}</td>
<td></td>
</tr>
<tr>
<td>Payment Option</td>
</tr>
<tr>
<td>Payment Mode:</td>
<td>
<input type="radio" name="payment" value="Credit Card"/>Credit Card
<input type="radio" name="payment" value="Net Banking"/>Net Banking 
<input type="radio" name="payment" value="Cash On Delivery"/>Cash On Delivery
</td>
</tr>
<tr>
<td>Shipping Address:</td> 
<td><textarea name="ShippingAddress" ></textarea></td>
<td><input type="submit" value="PAY"></td>
</tr>
</table>
</form>
</div>
<%@ include file="Footer.jsp"%>
</body>
</html>