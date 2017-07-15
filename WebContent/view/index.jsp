<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>YantraGene</title>


    <%@page errorPage="error.jsp" %>

 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
  <script src="../resources/js/controljs78as.js"></script>
  <!-- <script src="../resources/js/homejs.js"></script>-->


<link rel="stylesheet" href="../resources/css/mycssplan.css" type="text/css"/>

<link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css"/>
<script src="../resources/js/jquery.min.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>

<%@page errorPage="error.jsp" %>
</head>
<body>

 <nav class="navbar" style="z-index:100;">
    <div class="container-fluid">
  
        <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
        </button>
        </div>


        <div class="navbar1 collapse navbar-collapse" id="myNavbar">

<ul  class="navbar navbar-nav" style="float:right;margin-top:1px;z-index:100;">
<li><a class="navlinks" href="index.jsp">Home</a></li>
<li><a class="navlinks"  href="contactus.jsp" id="contactus">Contact Us</a></li>
<li><a class="navlinks"  href="#events" id="#">Events</a></li>
<li><a class="navlinks"  href="termcond.jsp" id="termcond">Term & Cond.</a></li>
<li><a class="navlinks"  href="user/login.jsp" id="#">Login</a></li>
<li><a class="navlinks"  href="#" id="register">Register</a></li>
</ul>
</div>
</diV>
</nav>


<div class="mainhome">
<div class="home">


<div>
<div id="background" class="image1  image-responsive"></div>
<div class="imageback"></div>

<img class="imag mobile image-responsive" src="images/fshield.gif"></img>
<img class="yantragene mobile  image-responsive" src="images/yantragene1.gif"></img>

<div class="festdate">Coming Soon...</div>

<%@page import="student.service.DaoService"%>
<%@page import="java.util.*,org.events.*" %>
</div>
</div>

<div id="events" class="events  image-responsive">
<div class="hide1 mobile1"><h3>All Events</h3></div>
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


<div id="<%=f.getEname() %>" class="hide1 eventdescription">

<div class="mobile"><h3>Event Detail</h3></div>
<div>
<h4><%=f.getEname() %></h4>

</div>

<div>
<div class="hide1 mobile1 col-sm-12 col-xs-12 col-md-12 col-lg-12"><h4>Description :</h4> </div><%=f.getEdescription() %>
</div>
<div>
Date : <%=f.getEventdate()%>

</div>

<div>
<%=f.getStarttime() %>&nbsp;&nbsp;to&nbsp;&nbsp;<%=f.getEndtime()%> 
</div>
</div>

<%} %>

<div class="eventslink">
<div class="mobile">
<%

while(eventit.hasNext()){

	f=(FestEvent) eventit.next();

%>
<button id="<%=f.getEname() %>" class="btn btn-success mobile"><%=f.getEname() %></button>
<%
}
%>
</div>
</div>
</div>


</div>


<div class="register register1">
   <div class="registerback">
        <div class="opaque">
            <div class="registerdata">
            </div>
        </div>
   </div>
</div>

<%--
<div class="contactus hide1">
<h3><div><center>Contact Us</center></div></h3></div>



<div id="termcond" class="termcond  hide1"><div>
<h3>
<center>Term and Condition</center>
</h3></div></div>
--%>



<div class="register"></div>

<script type="text/javascript">

if (screen.width>750) { 

    document.write("<script src=\"..\/resources\/js\/controljs78as.js\"><\/script>"); 
 }
else{
	   document.write("<script src=\"..\/resources\/js\/mymob.js\"><\/script>"); 
	   	
	
}

</script>
</body>
</html>
