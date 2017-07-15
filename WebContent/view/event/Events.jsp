<%@page import="student.service.DaoService"%>
<%@page import="java.util.*,org.events.*" %>
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
<jsp:setProperty property="id" name="fe" value="1"/>
<%
DaoService daos=new DaoService();
FestEvent f=new FestEvent();
List<FestEvent> list=daos.fetchEvent(fe);

Iterator it=list.iterator();
if(it.hasNext())
	
while(it.hasNext())
{
	f=(FestEvent) it.next();
%>
<br/>
<div class="eventdetail">
<table>
<tr><td>Name : </td><td><%=f.getEname() %></td></tr>
<tr><td>Date :</td><td><%=f.getEventdate() %></td></tr>
<tr><td>Description :</td><td><%=f.getEdescription() %></td></tr>
<tr><td>Timing : </td><td><%=f.getStarttime() %>&nbsp;:&nbsp;<%=f.getEndtime() %></td></tr>

<%} %>
</table>
</div>
</body>
</html>