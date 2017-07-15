<%@page import="student.service.DaoService"%>
<%@page import="student.bean.LoginDetail"%>
<%@page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Participate</title>
</head>
<body>
<%
DaoService daos=new DaoService();
LoginDetail ld=new LoginDetail();
ld=(LoginDetail)session.getAttribute("ld");



%>
</body>
</html>