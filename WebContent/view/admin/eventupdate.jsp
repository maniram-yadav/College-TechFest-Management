<%@page import="org.admin.AdminService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Event</title>
</head>
<body>
<jsp:useBean id="fe" class="org.events.FestEvent"></jsp:useBean>
<jsp:setProperty property="*" name="fe"/>
<%
try{
	
	response.sendRedirect("profile.jsp?message="+new AdminService().updateEvent(fe));
}
catch(Exception e){
	response.sendRedirect("profile.jsp?message="+"Unable to process due to "+e.toString());
	
}

%>
</body>
</html>