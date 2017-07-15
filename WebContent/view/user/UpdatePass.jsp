<%@page import="student.bean.LoginDetail"%>
<%@page import="student.service.DaoService"%>
<%@page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Password</title>
</head>
<body>
<%
String pass=request.getParameter("pass");
String repass=request.getParameter("repass");
if(pass.equals(repass)&&pass!=null&&!pass.equals(""))
{
LoginDetail ld=(LoginDetail)session.getAttribute("ld");
boolean b=new DaoService().updatePassword(ld, pass);
if(b)
{
session.invalidate();
response.sendRedirect("login.jsp?message="+"Passward updated successfully. Login Again");

}
else{
	response.sendRedirect("profile.jsp?message="+"Unable to update your password");
	
	
}
}
else{
	response.sendRedirect("profile.jsp?message="+"Password mismatch");
	
	}
%>
</body>
</html>