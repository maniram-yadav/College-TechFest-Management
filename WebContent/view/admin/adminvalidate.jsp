<%@page import="org.validation.Validation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Validate</title>
</head>
<body>
<%@page import="org.admin.RegAdmin" %>
<%@page errorPage="error.jsp" %>
<jsp:useBean id="ab" class="org.admin.AdminBean" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="ab"/>
<%

boolean state=new Validation().validatAReg(ab);

if(state){
	
	response.sendRedirect(request.getContextPath()+"/RegAdmin");
}
else{
	response.sendRedirect("profile.jsp?message="+"Please enter validate data");
	
}

%>
</body>
</html>