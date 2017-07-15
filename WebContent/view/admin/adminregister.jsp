<%@page import="org.admin.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<%@page errorPage="error.jsp" %>
<link rel="stylesheet" href="../../resources/css/admin.css" type="text/css"/>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css"/>
<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/bootstrap.min.js"></script>
<script src="../../resources/js/controljs78as.js"></script>

</head>
<body>

<%
try{
AdminBean adb=(AdminBean)session.getAttribute("adb");
if(adb.getEmail()==null||adb.getEmail().equals("")||adb.getPassword()==null)
{
   response.sendRedirect(request.getContextPath()+"/view/admin/login.jsp?message="+"Login to your account here");	
}
}
catch(Exception e)
{
	   response.sendRedirect(request.getContextPath()+"/view/admin/login.jsp?message="+"Login to your account here");	
	
}
%>


<form action="adminvalidate.jsp" method="post">


<table class="table table-responsive">
<tr><td>Name :</td><td><input type="text" name="name" id="in" class="form form-group form-control input-size" placeholder="name"/></td></tr>
<tr><td>Email :</td><td><input type="email" name="email" id="in" class="form form-group form-control input-size" placeholder="userid"/></td></tr>
<tr><td>Password :</td><td><input type="password" name="password" id="in" class="form form-group form-control input-size"  placeholder="******"/></td></tr>
<tr><td></td><td><input type="submit" name="submit" class="btn btn-primary" value="Submit"/> </td></tr>
</table>
</form>

</body>
</html>