<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LoginPage</title>
<style>
.card {
  background-color: #f2f2f2;
  width: 800px;
  height: 320px;
  border: 1px solid #000000;
  margin-top:50px;
  margin-left: 175px;
  font-weight:bold;
}
input[type=text], input[type=password] {
  width: 750px;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #bfbfbf;
}
input[type=text]:focus, input[type=password]:focus {
  background-color: #a6a6a6;
  outline: none;
}
</style>
</head>
<body class="bg">
<%@ include file="Header.jsp"%>
<form method="post" action="<c:url value="/perform_login"/>">
<div class="container">
<div class="card">
<center><h2><b>Login</b></h2></center>
<div style="margin-left:20px">
User Name<font color="red" style="float:right; margin-right:30px;">${ErrorMessage}</font><br>
<input type="text" name="username"><br>
Password<br>
<input type="password" name="password"><br>
<center><input type="submit" class="btn btn-success" value="LOGIN"></center>
</div>
</div>
</div>
</form>
<%@ include file="Footer.jsp"%>
</body>
</html>