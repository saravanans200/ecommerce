<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ThankYou</title>
</head>
<body>
<%@include file="Header.jsp"%>
<table class="table table-bordered">
<tr>
<td>Name:</td>
<td>${name}</td>
</tr>
<tr>
<td>Date:
<td>${orderdetail.orderDate}</td>
</tr>
<tr>
<td>TotalAmount:</td>
<td>${orderdetail.totalAmount}</td>
</tr>
<tr>
<td>TransactionType:</td>
<td>${orderdetail.transactionType}</td>
</tr>
<tr>
<td>Shipping Address:</td>
<td>${orderdetail.shippingAddr}</td>
</tr>
</table>
<table class="table table-hover">
<tr>
<td>Product Name</td>
<td>Product Price</td>
<td>Quantity</td>
</tr>
<c:forEach items="${listPaidCarts}" var="cart">
<tr>
<td>${cart.productName}</td>
<td>${cart.total}</td>
<td>${cart.quantity}</td>
</tr>
</c:forEach>
</table>
Thank You
<%@ include file="Footer.jsp"%>
</body>
</html>