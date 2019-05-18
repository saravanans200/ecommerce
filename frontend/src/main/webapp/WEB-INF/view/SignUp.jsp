<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SignUpPage</title>
<style>
.card {
  background-color: #f2f2f2;
  width: 800px;
  height: 750px;
  border: 1px solid #000000;
  margin-top:25px;
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
<form method="post" action="<c:url value="/addSignUp"/>">
<div class="container">
<div class="card">
<center><h2><b>SignUp</b></h2></center>
<div style="margin-left:20px">
Name<br>
<input type="text" name="name" pattern="[A-Za-z ]{1,}" title="enter only alphabets" required placeholder="Enter name..."><br>
UserName<font color="red" style="float:right; margin-right:30px;">${alert}</font><br>
<input type="text" name="username" pattern="[A-Za-z0-9]{1,}" title="username should be unique" required placeholder="Enter username..."><br>
Password<br>
<input type="password" name="password" pattern="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}" title="should contain atleast one uppercase,one lowercase,one number,one special character" required placeholder="Enter password..."><br>
Address<br>
<input type="text" name="address" pattern="[A-Za-z0-9]{1,}" required placeholder="Enter address..."><br>
Mobile No<br>
<input type="text" name="mobileNo" pattern="[6,9]{1}[0-9]{9}" title="enter only numbers" required placeholder="Enter mobileno..."><br>
Email<br>
<input type="text" name="email" pattern="[A-Za-z0-9]{1,}[@]{1}[a-zA-Z]{2,}[.]{1}[a-zA-Z]{3}" required placeholder="Enter email..." title="abc@gmail.com"><br>
<center><input type="submit" class="btn btn-success" value="SIGN UP"></center><br>
Already have an account? <a href="<c:url value="/login"/>">Login</a>
</div>
</div>
</div>
</form>
</body>
</html>