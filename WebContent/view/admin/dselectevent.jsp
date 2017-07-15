<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.events.FestEvent"%>
<%@page import="student.service.DaoService"%>
<%@page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Event</title>
</head>
<body>
<form action="deleteevent.jsp">

<select name="ename" class="form form-control input-size">
<%
DaoService daos=new DaoService();
FestEvent f=new FestEvent();

List<FestEvent> list=daos.fetchEvent(f);
Iterator it=list.iterator();
Iterator eventit=list.iterator();
if(it.hasNext())
	
while(it.hasNext())
{
	f=(FestEvent) it.next();
%>
<option value="<%=f.getEname() %>"><%=f.getEname() %></option>
<%
} 
%>
</select>
</form>
</body>
</html>