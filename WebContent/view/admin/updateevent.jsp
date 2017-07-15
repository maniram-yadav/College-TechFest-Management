<%@page import="org.events.FestEvent"%>
<%@page import="org.admin.AdminDao"%>
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
<jsp:setProperty property="ename" name="fe" param="ename"/>


<%
AdminDao ado=new AdminDao();
FestEvent f=new FestEvent();
f=ado.getEventDetail(fe);

if(f.getEname()!=null)
{
	session.setAttribute("id",f.getId());
%>


<form action="<%=request.getContextPath() %>/view/admin/eventupdate.jsp" method="post">
<table class="table table-responsive">
<tr><td>Event Name :</td><td><input type="hidden" name="id" value="<%=f.getId()%>"/>
<input type="text" value="<%=f .getEname()%>" class="form-control input-size einback" name="ename"/></td></tr>
<tr><td>Event Date :</td><td><input type="date" value="<%=f.getEventdate() %>" class="form form-control input-size einback" name="eventdate"/></td></tr>
<tr><td>Event Start Time :</td><td><input type="time" value="<%=f.getStarttime() %>" class="form-control input-size einback" name="starttime"/></td></tr>
<tr><td>Event End Time :</td><td><input type="time" value="<%=f.getEndtime() %>" class="form-control input-size einback" name="endtime"/></td></tr>
<tr><td>Event Description :</td><td><textarea rows="6" cols="50"  name="edescription" class="form-control input-size  einback"><%=f.getEdescription() %></textarea></td></tr> 
<tr><td><input type="submit" name="submit" class="btn btn-success" value="Submit"/></td></tr>
</table>
<%
}
else{
	
	out.println("No any event found with this name");
}
%>
</form>
</body>
</html>