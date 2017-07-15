<%@page import="student.service.DaoService"%>
<%@page import="student.bean.StudentDetail"%>
<%@page import="student.dao.PassRecover"%>
<%@page import="javax.mail.*,javax.mail.internet.*"%>
<%@page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recovered Password</title>
</head>
<body>

<%
StudentDetail sd=new StudentDetail();
sd.setEmail("maniramy3@gmail.com");
try{
//System.out.println(new DaoService().recoverPass(sd));
System.out.println(PassRecover.sendMail(sd));
}
catch(Exception e){
	e.printStackTrace();
	System.out.println(e);
}


/*
StudentDetail sd1=new StudentDetail();
DaoService daos=new DaoService();
sd1.setEmail("maniram");
try{

	String message=daos.recoverPass(sd1);
out.println(message);

}
catch(Exception e){
	out.println(e);
}

*///response.sendRedirect("login.jsp?message="+message);
%>
</body>
</html>