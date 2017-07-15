<%@page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>

<link rel="stylesheet" media='screen and (max-width: 600px)' href="../resources/css/mycssplan.css" type="text/css"/>
  

<link rel="stylesheet" href="../../resources/css/mycssplan.css" type="text/css"/>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css"/>
<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/bootstrap.min.js"></script>
<script src="../../resources/js/controljs78as.js"></script>


</head>
<body>
<div class="loginbackground">
<center>
<div style="margin-top:20px;">

<a href="../index.jsp"  class="btn btn-success btn-md btn-lg btn-sm">Home</a>

</div>
</center><div class="login1 showlogin">
<div class="loginhead">Login Here</div>
<div>${param.message}</div>
<form action="loginvalidate.jsp" method="post">


<table class="table table-responsive">
<tr><td>User Id :</td><td><input type="text" name="userid" id="in" class="form form-group form-control input-size" placeholder="userid"/></td></tr>
<tr><td>Password :</td><td><input type="password" name="password" id="in" class="form form-group  form-control input-size"  placeholder="******"/></td></tr>
<tr><td><div class="btn btn-success btn-sm btn-md btn-lg" id="forgetpass">Forget Password</div></td><td><input type="submit" name="submit" class="btn btn-primary" value="Submit"/> </td></tr>
</table>

</form>


</div>

<div class="login1 showforget">
<div style="color:white;"><h4>Enter your profile email for password recovery</h4></div>

<%@page import="student.controller.*" %>

<form action="../../PassRecover" method="post">


<table>
<tr><td>Email :</td><td><input type="email" name="email" id="in" class="form form-group form-control input-size" placeholder="email"/></td></tr>
<tr><td></td><td><input type="submit" name="submit" class="btn btn-primary" value="Submit"/> </td></tr>
</table>

</form>

</div>

</div>
</body>
</html>