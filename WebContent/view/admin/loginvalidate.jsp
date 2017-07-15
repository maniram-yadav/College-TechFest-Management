<%@page import="org.validation.Validation"%>
<%@page import="org.admin.AdminBean"%>
<%@page import="student.service.DaoService"%>
<%@page errorPage="error.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validate Login</title>
</head>
<body>
<jsp:useBean id="lad" class="org.admin.AdminBean" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="lad"/>
<%@page import="org.admin.LoginAdmin"%>
<%

   Validation v=new Validation();

   if(v.validatALogin(lad)==true)
   {
	   System.out.println("State : "+v.validatALogin(lad));
	   response.sendRedirect(request.getContextPath()+"/LoginAdmin");
   }
   
   else{
	   String msg="Please enter valid data";
	   response.sendRedirect("login.jsp?message="+msg);
   }
%>
</body>
</html>