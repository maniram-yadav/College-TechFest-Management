<%@page import="org.admin.AdminService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Event</title>
<%@page errorPage="error.jsp" %>
</head>
<body>
<jsp:useBean id="fe" class="org.events.FestEvent"></jsp:useBean>
<jsp:setProperty property="ename" name="fe" param="ename"></jsp:setProperty>
<%

try{
	if(new AdminService().deleteEvent(fe)){
	response.sendRedirect("profile.jsp?message="+"Event deleted successfully");
}
	else{
		
		response.sendRedirect("profile.jsp?message="+"Unable to delete event");
	}	
}
catch(Exception e){
	response.sendRedirect("profile.jsp?message="+"Error occure during deleteing the event");
	
	
}
%>
</body>
</html>