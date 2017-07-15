<%@page import="org.admin.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Event</title>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />"/>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>" ></script>
<script src="<c:url value="/resources/js/jquery.min.js"/>" ></script>


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

<div>
<form action="<%=request.getContextPath() %>/view/event/SaveEvent.jsp" method="post">
<table class="table table-responsive">

<tr><td>Event Name :</td><td><input type="text" class="form-control input-size einback" name="ename"/></td></tr>
<tr><td>Event Date :</td><td><input type="date" class="form form-control input-size einback" name="eventdate"/></td></tr>
<tr><td>Event Start Time :</td><td><input type="time" class="form-control input-size einback" name="starttime"/></td></tr>
<tr><td>Event End Time :</td><td><input type="time" class="form-control input-size einback" name="endtime"/></td></tr>
<tr><td>Event Description :</td><td><textarea rows="6" cols="50" name="edescription" class="form-control input-size  einback"></textarea></td></tr> 

<tr><td><input type="submit" name="submit" class="btn btn-success" value="Submit"/></td></tr>

</table>
</form>
</div>
</body>
</html>