<%@page import="student.service.DaoService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="fe" class="org.events.FestEvent"></jsp:useBean>
<jsp:setProperty property="*" name="fe"/>
<%
DaoService daos=new DaoService();
boolean status=daos.addEvent(fe);
if(status)
	response.sendRedirect(request.getContextPath()+"/view/admin/profile.jsp?message="+"Event Successfully Saved");
else
	response.sendRedirect(request.getContextPath()+"/view/admin/profile.jsp?message="+"Unable to save Event");
%>
</body>
</html>