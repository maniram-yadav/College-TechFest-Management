<%@page import="student.service.DaoService"%>
<%@page import="student.bean.Participation"%>
<%@page import="student.bean.LoginDetail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

try{
	Participation p=new Participation();
	LoginDetail ld=(LoginDetail)session.getAttribute("ld");
	p.setUserid(ld.getUserid());
	p.setEventname(request.getParameter("ename"));
	
	new DaoService().unPartEvent(p);
	response.sendRedirect(request.getContextPath()+"/view/user/profile.jsp");
	
	
}
catch(Exception e){
	
	response.sendRedirect(request.getContextPath()+"/view/user/profile.jsp");
	
}

%>

</body>
</html>