<%@page import="student.service.DaoService"%>
<%@page import="student.controller.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
<%@page import="org.validation.*" %>

<jsp:useBean id="sd" class="student.bean.StudentDetail"></jsp:useBean>
<jsp:setProperty property="*" name="sd"/>

<jsp:useBean id="ld" class="student.bean.LoginDetail"></jsp:useBean>
<jsp:setProperty property="*" name="ld"/>
<%
sd.setlDetail(ld);
ld.setStudetail(sd);

Validation val=new Validation();
boolean status=val.validateUserInfo(sd);
DaoService daos=new DaoService();




String message;
try{

	if(daos.isEmailExist(sd))
	{
		

		message="This Email id already exist use another email id";
		response.sendRedirect("signup.jsp?message="+message);

	}
	
	
	
	
	else{
	
	
if(daos.isUserIdExist(ld)){	

if(status)
{
	boolean stat=daos.addStudent(sd);
	WelcomeMessage.sendWelcome(sd);
	message="You have been Signup Successfully Login Now";
	response.sendRedirect("../index.jsp?message="+message);

}

else{
	
	message="There is error in your data. Make sure enter information is right and in right format";
	response.sendRedirect("signup.jsp?message="+message);
}
}

else{
	

	message="This User id already exist";
	response.sendRedirect("signup.jsp?message="+message);

}}
	
	
}
catch(Exception ex){
	
	message="Server Exception : There is error in your data. Make sure enter information is right and in right format";
	response.sendRedirect("signup.jsp?message="+message);
	
}


%>
</body>
</html>