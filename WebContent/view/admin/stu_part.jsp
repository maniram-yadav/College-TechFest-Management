<%@page import="student.bean.Participation"%>
<%@page import="student.bean.LoginDetail"%>
<%@page import="student.bean.StudentDetail"%>
<%@page import="org.admin.AdminService"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Participate</title>
</head>
<body>
<center><h3>Student Participation</h3></center>
<table>
<thead><td>Name</td><td>College Name</td><td>Event Name</td></thead>
<%
List<Object[]> list=new AdminService().fetchStudent();
Iterator<Object[]> it=list.iterator();
while(it.hasNext())
{
try{
	Object[] o=it.next();
	StudentDetail sd=(StudentDetail)o[0];
	LoginDetail ld=(LoginDetail)o[1];
	Participation p=(Participation)o[2];
	if(p.getEventname()!=null&&!p.getEventname().equals(""))
	{

%>
<tr><td><%out.print(" "+sd.getFirstname()+" "+sd.getLastname()); %></td><td><%=sd.getCollegename() %></td><td><%=p.getEventname() %></td></tr>
<%}}

catch(Exception e){
	
	
}}%>
</table>
</body>
</html>