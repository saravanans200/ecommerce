<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstarp.min.js"></script>
<title>ManageProductPage</title>
<style>
#sel { width:175px; }
</style>
</head>
<body>
<%@ include file="Header.jsp"%>
<h4>Add Product</h4>
<form method="post" action="<c:url value="/updateProductDB/${product.productId}"/>" enctype="multipart/form-data">
<table class="table table-hover">
<tr>
<td>Select Category:</td>
<td><select required id="sel" name="categoryId">
<option value="${cat.categoryId}">${cat.categoryName}</option>
<c:forEach items="${listCategories}" var="category">
<c:if test="${cat.categoryId!=category.categoryId}">
<option value="${category.categoryId}">${category.categoryName}</option>
</c:if>
</c:forEach>
</select>
</td>
</tr>
<tr>
<td>Select Supplier:</td>
<td><select required id="sel" name="supplierId">
<option value="${sup.supplierId}">${sup.supplierName}</option>
<c:forEach items="${listSuppliers}" var="supplier">
<c:if test="${sup.supplierId!=supplier.supplierId}">
<option value="${supplier.supplierId}">${supplier.supplierName}</option>
</c:if>
</c:forEach>
</select>
</td>
</tr>
<tr>
<td>Product Name</td>
<td><input name="proname" value="${product.productName}"/></td>
</tr>
<tr>
<td>Product Description</td>
<td><input name="prodesc" value="${product.productDesc}"/></td>
</tr>
<tr>
<td>Product Price</td>
<td><input name="proprice" value="${product.price}"/></td>
</tr>
<tr>
<td>Product Stock</td>
<td><input name="prostock" value="${product.stock}"/></td>
</tr>
<tr>
<td>Product Image</td>
<td><img src="<c:url value="/resources/images/${product.productId}.jpg"/>" width="75px" height="75px"></td>
</tr>
<tr>
<td>Change Image</td>
<td><input type="file" accept="/resources/images/*" name="pimage"/></td>
</tr>
<tr>
<td colspan = "2">
<center><input type="submit" class="btn btn-success btn-xs" value="UPDATE"/>
<input type="reset" class="btn btn-danger btn-xs" value="RESET"/></center>
</td>
</tr>
</table>
<div class="container">
<table class="table table-bordered" style="border-width:3px;border-color:black;">
<tr style="background-color:black; color:white;">
<td>Product ID</td>
<td>Product Name</td>
<td>Product Description</td>
<td>Product Price</td>
<td>Product Stock</td>
<td>Category ID</td>
<td>Supplier ID</td>
<td>Product Image</td>
<td>Operation</td>
</tr>
<c:forEach items="${listProducts}" var="product">
<tr>
<td>${product.productId}</td>
<td>${product.productName}</td>
<td>${product.productDesc}</td>
<td>${product.price}</td>
<td>${product.stock}</td>
<td>${product.categoryId}</td>
<td>${product.supplierId}</td>
<td><img src="<c:url value="/resources/images/${product.productId}.jpg"/>" width="75px" height="75px"></td>
<td>
<a href="<c:url value="/updateProduct/${product.productId}"/>" class="btn btn-success btn-xs">UPDATE</a>
<a href="<c:url value="/deleteProduct/${product.productId}"/>" class="btn btn-danger btn-xs">DELETE</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</form>
</body>
</html>