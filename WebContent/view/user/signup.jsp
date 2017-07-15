<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>

<link rel="stylesheet" href="../../resources/css/mycssplan.css" type="text/css"/>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css"/>
<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/bootstrap.min.js"></script>

</head>
<body>

<div class="registerdata registerback opaque">


<div class="signupform"><b>Signup Form</b></div>
 <div class="register1">
<%
String message=request.getParameter("message");
if(message!=null&&!message.equals("")){
%>
<div class="alert">
<%=message %>
</div>
<form action="register.jsp" method="post">
<%}
else
{%>


<form action="user/register.jsp" method="post">

<%} %>

<table style="border:none;">
<tr><td>First Name : </td><td><input type="text" class="form form-control form-group input-size register-input" id="in" name="firstname" plaeholder="First Name"/></td></tr>
<tr><td>Last Name : </td><td><input type="text" class="form form-control form-group  input-size" name="lastname" id="in" plaeholder="Last Name"/></td></tr>

<tr><td>Email : </td><td><input type="email" class="form form-control form-group  input-size" name="email"id="in" plaeholder="Email"/></td></tr>
<tr><td>Mobile Number : </td><td><input type="text" maxlenght="10"  pattern=".{10}" required title="10 characters" id="in" class="form form-control form-group  input-size" min="10" name="phonenumber" plaeholder="mobile number"/></td></tr>
<tr><td>College : </td><td><input type="text" class="form form-control form-group  input-size" name="collegename" id="in" plaeholder="college name"/></td></tr>
<tr><td>City : </td><td><input type="text" class="form form-control form-group  input-size" name="city" id="in" plaeholder="City"/></td></tr>
<tr colspan="2"><td><center>Login Information</center></td></tr>
<tr><td>User id :</td><td> <input type="text" class="form form-control form-group  input-size" id="in" name="userid" plaeholder="user id"/></td></tr>
<tr><td>Password : </td><td><input type="password" class="form form-control form-group  input-size" id="in" name="password" plaeholder="*******"/></td></tr>

<tr><td>Gender : </td><td><input type="radio" id="in" name="gender"/>Male
 <input type="radio" id="in" name="gender"/>Female</td></tr>
 

 <tr><td>
 

<a href="<%=request.getContextPath()%>/view/index.jsp" class="btn btn-success btn-md btn-lg btn-sm">Home</a>



</td><td><input type="submit" name="submit" class="btn btn-success" value="Register"/></td></tr><br/><br/>
</table>
</form>
</div>
</div>
</body>
</html>