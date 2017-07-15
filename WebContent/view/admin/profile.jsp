<%@page import="org.admin.AdminBean"%>
<%@page import="student.bean.*"%>
<%@page import="org.admin.*"%>
<%@page import="java.util.*"%>
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
<title>Profile</title>
  
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css"/>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/adminjs.js"></script>

<!-- 


<link rel="stylesheet" href="../resources/css/admin.css" type="text/css"/>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css"/>
<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/bootstrap.min.js"></script>
<script src="../../resources/js/controljs78as.js"></script>
<script src="../../resources/js/adminjs.js"></script>
 -->
<style type="text/css">

.adminblock{
display:none;
}
.anav{
margin-top:20px;
}
.navlinks{
padding:10px;
font-size:15px;
}
.admincontent{
	
	min-width:100%;
	height:100%;
	background:rgb(220,220,220);
}
body{
background:radial-gradient(ellipse,rgb(200,10,10),rgb(10,10,10));
}
.tcolor{
color:yellow;
}

</style>


</head>
<body class="container">

    <nav class="navbar navbar-inverse">
    <div class="container-fluid">
  
        <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
        </button>
        </div>
        <div class="collapse navbar-collapse navbar-right anav" id="myNavbar">

<ul  class="navbar navbar-nav">

<li><a class="navlinks active" href="../index.jsp" id="#">Home</a></li>
<li><a class="navlinks"  href="#enew" id="enew">New Event</a></li>
<li><a class="navlinks"  href="#eupdate" id="eupdate">Update Event</a></li>
<li><a class="navlinks"  href="#edelete" id="edelete">Delete Event</a></li>
<li><a class="navlinks"  href="#students" id="students">Students</a></li>
<li><a class="navlinks"  href="#regadmin" id="regadmin">Register Admin</a></li>
<li><a class="navlinks"  href="logout.jsp" id="adlog">Logout</a></li>

</ul>
</div>
</diV>
</nav>
<% 
if(request.getParameter("message")!=null&&!request.getParameter("message").equals(""))
{
%>
<center>
 <div class="alert alert-success alert-dismissable">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>${param.message}</strong>
  </div>
</div>
</center>
<%} %>
<%
try{
AdminBean adb=(AdminBean)session.getAttribute("adb");
if(adb.getEmail()==null||adb.getEmail().equals("")||adb.getPassword()==null)
{
  // response.sendRedirect(request.getContextPath()+"/view/admin/login.jsp?message="+"Login to your account here");	
}
}
catch(Exception e)
{
	//   response.sendRedirect(request.getContextPath()+"/view/admin/login.jsp?message="+"Login to your account here");	
	
}
%>
<div class="admincontent"></div>

<div class="updateevent tcolor"></div>

<div class="updateinfo tcolor"></div>

<div class="edelete adminblock tcolor">
<%
try{

%>
<form action="deleteevent.jsp">
<select name="ename" class="form form-control input-size">
<%
DaoService daos=new DaoService();
FestEvent f=new FestEvent();

List<FestEvent> list1=daos.fetchEvent(f);
Iterator it1=list1.iterator();
if(it1.hasNext())
	
while(it1.hasNext())
{
	f=(FestEvent) it1.next();
%>
<option value="<%=f.getEname() %>"><%=f.getEname() %></option>
<%
} 
%>
</select>
<input type="submit" name="submit" value="Submit" class="btn btn-success"/>
</form>
<%
}
catch(Exception e){
%>
<h3>There is no any event</h3>
<%	
}

%>
</div>



<div class="students adminblock tcolor">
<center><h3>Student Participation</h3></center>
<% try{ %>

<table class="table table-responsive">
<thead><td>Name</td><td>College Name</td><td>Event Name</td></thead>
<%
List<Object[]> list=new AdminService().fetchStudent();
Iterator<Object[]> it=list.iterator();
while(it.hasNext())
{
	
	Object[] o=it.next();
	StudentDetail sd=(StudentDetail)o[0];
	LoginDetail ld=(LoginDetail)o[1];
	Participation p=(Participation)o[2];
if(p.getEventname()!=null&&!p.getEventname().equals(""))
{
%>
<tr><td><%out.print(" "+sd.getFirstname()+" "+sd.getLastname()); %></td><td><%=sd.getCollegename() %></td><td><%=p.getEventname() %></td></tr>
<%
}
}}
catch(Exception e){%>

<%} %>
</table>

</div>

<div class="edelete"></div>
<div class="eupdate"></div>


<div class="selEvent"></div>


<div class="regadmin  adminblock tcolor">
<form action="adminvalidate.jsp" method="post">


<table class="table table-responsive">
<tr><td>Name :</td><td><input type="text" name="name" id="in" class="form form-group form-control input-size" placeholder="name"/></td></tr>
<tr><td>Email :</td><td><input type="email" name="email" id="in" class="form form-group form-control input-size" placeholder="userid"/></td></tr>
<tr><td>Password :</td><td><input type="password" name="password" id="in" class="form form-group form-control input-size"  placeholder="******"/></td></tr>
<tr><td></td><td><input type="submit" name="submit" class="btn btn-primary" value="Submit"/> </td></tr>
</table>
</form>

</div>

</body>
</html>