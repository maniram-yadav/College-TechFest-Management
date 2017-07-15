<%@page import="student.bean.LoginDetail"%>
<%@page import="student.service.DaoService"%>
<%@page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Participation</title>
</head>
<body>
<% 
LoginDetail ld=(LoginDetail)session.getAttribute("ld");
DaoService daos=new DaoService();
     
%>
</body>
</html>