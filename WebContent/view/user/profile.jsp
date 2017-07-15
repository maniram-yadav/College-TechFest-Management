<%@page import="student.service.DaoService"%>
<%@page import="student.bean.StudentDetail"%>
<%@page import="student.bean.StudentDetail"%>

<%@page import="student.bean.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>


<link rel="stylesheet" href="../../resources/css/mycssplan.css" type="text/css"/>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css"/>
<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/bootstrap.min.js"></script>
<script src="../../resources/js/controljs78as.js"></script>


</head>
<body>

<jsp:useBean id="ld" class="student.bean.LoginDetail" scope="session"></jsp:useBean>
<div class="usernavba">
<div class="welcome-user">Participant Portal</div>
   <div class="usernavbar-link">

<a href="../index.jsp"><input type="submit" value="Home"  class="btn-primary btn-uselink btn-md btn-lg"/></a>

<input type="submit" value="Participate"  class="btn-primary  btn-uselink btn-md btn-lg" id="participate"/>

<input type="submit" value="UnParticipate"  class="btn-primary  btn-uselink btn-md btn-lg unpart" id="unpart"/>

<input type="submit" value="Profile"  class="btn-primary  btn-uselink btn-md btn-lg profileload"/>

<input type="submit" value="Update Password" class="btn-primary  btn-uselink btn-md btn-lg updatepass"/>

<a href="logout.jsp">

<button class="btn-primary btn-uselink btn-md btn-lg">Logout</button></a>
</div>
</div>



<%
try{
	LoginDetail ld1=new LoginDetail();
     
	ld1=(LoginDetail)session.getAttribute("ld");

  if(ld.getUserid()==null&&ld.getPassword()==null&&ld.getUserid().equals("")&&ld.getStudetail().getFirstname()==null&&ld.getStudetail().getFirstname().equals(""))
	{
		
		response.sendRedirect(request.getContextPath()+"/view/user/login.jsp?message="+"First Login here");
	    	
	}
}

catch(Exception e){
	
    response.sendRedirect(request.getContextPath()+"/view/user/login.jsp?message="+"First Login here"+e.toString());
    
}


try{
String msg=request.getParameter("message");
if(msg!=null&&!msg.equals(""));
{
%>

<div class="message" style="z-index:90;">
  <a href="#" class="close">&times;</a>
  <strong><%=msg %></strong>
  </div>


<%
}}
catch(Exception e){}%>


<div class="profile">
<div class="profilecontent">


<%
StudentDetail sd=new StudentDetail();
LoginDetail ld1=new LoginDetail();
try{

	sd=(StudentDetail)session.getAttribute("sd");
ld1=(LoginDetail)session.getAttribute("ld");
    if(ld.getUserid()==null)
    {
    	response.sendRedirect(request.getContextPath()+"/view/user/login.jsp?message="+"First Login here");
    }
%>

<div class="profiledata">

<div><b>Your Profile</b></div>
<table class="table table-responsive tableback">

<tr><td>Name : </td><td><%out.println(sd.getFirstname()+" "+sd.getLastname()); %></td></tr>
<tr><td>College Name : </td><td><%=sd.getCollegename()%></td></tr>
<tr><td>Mobile Number : </td><td><%=sd.getPhonenumber()%></td></tr>
<tr><td>City : </td><td><%=sd.getCity()%></td></tr>
<tr><td>Email : </td><td><%=sd.getEmail()%></td></tr>
</table>
</div>
<div class="updatepassrd"></div>


<% 
//out.println(sd.getEmail());
//out.println(ld.getUserid());

}
catch(Exception e){
	
}%>
 </div>


<div class="unparticipate">

<%try{ %>
<div>
<form action="unparticipate.jsp" method="post">
Select participated Event :
<select name="ename" class="form form-control" style="width:25%;">
<%

List<Participation> list=new DaoService().myEventList(ld);
Iterator<Participation> it=list.iterator();
while(it.hasNext()){
Participation p=it.next();
%>
<option value="<%=p.getEventname() %>"><%=p.getEventname() %></option>


<%} %>
</select>
<input type="submit" name="submit" class="btn btn-success" value="Submit"/> 
</form>
</div>


<%
}
catch(Exception e){
out.println("Till now no  any participation by you");	
	
}%>
</div>



 <div class="myeventlist">
 <div><b>Your Participation</b></div>
 
 <%
try{
 List<Participation> list=new DaoService().myEventList(ld);
 Iterator<Participation> it=list.iterator();
 while(it.hasNext()){
 %>
 <div><%=it.next().getEventname() %></div>
 <%}
 }
 catch(Exception e){}
 %>
 </div>





 <br/>
 <div class="takepart ">
 <div><b>Remaining Events</b></div>
 
 <%
 List<String> l=new ArrayList<String>();
 try{
  l=new DaoService().takePart(ld);
 Iterator<String> sit=l.iterator();
 while(sit.hasNext())
 {
 %>
 <div><%=sit.next() %></div>
 <br/>
 <%} 
 }
 catch(Exception e){
	 
	 out.println(e);
 }%>
 </div>
 


<img class="content" src="../../resources/images/backgrnd.gif"></img>
<img class="content-move" src="../../resources/images/cloudback13.gif"></img>
<%@page import="org.events.*" %>

<div class="popupbox popupbox1">
  

<div id="popup">
 <a href="#" class="close" data-dismiss="alert" style="color:white;opacity:1;" aria-label="close">&times;</a>
<%----%>
 <form action="../../RegisterEvent" method="post">
 Select Event : 
 <select name="eventname" class="form-control">
 <%
 
 Iterator<String> sit=l.iterator();
 while(sit.hasNext())
 {
	 String str=sit.next();
 %>
 <option value="<%=str %>"><%=str %></option>
 <%
 }
 %>
 
  
 </select>
 <br/>
 <input type="submit" class="btn btn-success" name="submit" value="Submit"/>
 </form>
 
</div>
</div>

<link rel="stylesheet" href="../../resources/css/mycssplan.css" type="text/css"/>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css" type="text/css"/>

<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/bootstrap.min.js"></script>
<script src="../../resources/js/controljs78as.js"></script>

</div>

</body>
</html>