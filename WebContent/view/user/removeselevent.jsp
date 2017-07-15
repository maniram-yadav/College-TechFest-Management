<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="student.bean.LoginDetail"%>
<%@page import="student.service.DaoService"%>
<%@page import="student.bean.Participation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%try{ %>
<form action="unparticipate.jsp" method="post">
Select Event :
<select name="ename">
<%

LoginDetail ld=(LoginDetail)session.getAttribute("ld");
List<Participation> list=new DaoService().myEventList(ld);
Iterator<Participation> it=list.iterator();
while(it.hasNext()){
Participation p=it.next();
%>
<option value="<%=p.getEventname() %>"><%=p.getEventname() %></option>


<%} %>
</select>
<input type="submit" name="submit" value="Submit"/> 
</form>
<%
}
catch(Exception e){
out.println("Till now no  any participation by you");	
	
}%>
</body>
</html>