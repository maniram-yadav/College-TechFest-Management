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
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css"/>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/adminjs.js"></script>

</head>
<body>

<%--****************    Update event **************** --%>

<select name="ename" class="form form-control input-size ename">
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
<br/>
<input type="submit" name="submit" class="btn btn-success upevent" value="Submit"/>
</body>
</html>