<%@page import="student.bean.LoginDetail"%>
<%@page import="student.bean.StudentDetail"%>
<%@page import="org.validation.Validation"%>
<%@page import="student.service.DaoService"%>
<%@page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validate Login</title>
</head>
<body>
<jsp:useBean id="ld" class="student.bean.LoginDetail" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="ld"/>
<%

   Validation v=new Validation();
   if(v.validatLogin(ld))
   {
	//   response.sendRedirect("../../Login");
   
   
   
   
   
   
	   try{
	    	LoginDetail ld1=(LoginDetail) session.getAttribute("ld");
			//out.println(ld.getPassword());
	    	
			DaoService daos=new DaoService();
	    	StudentDetail sd=new StudentDetail();
	    	sd=daos.loginUser(ld1);
	    	
	    	if(sd.getEmail()!=null){
	    	
	    		session.setAttribute("sd",sd);
	    		response.sendRedirect(request.getContextPath()+"/view/user/profile.jsp");
		        
	    	}
	    	
	    	else{
	    	
	    		String message="Either your Userid or your password is incorrect";
	    		request.setAttribute("message",message);
	    		response.sendRedirect(request.getContextPath()+"/view/user/login.jsp?message="+message);
		    
	    	}
			}
			catch(Exception ex){
				
				response.sendRedirect(request.getContextPath()+"/view/user/login.jsp?message="+"Exception occured in on server");
			}
	    	
	    }

   
   
   else{
	   String msg="Please enter valid data";
	   response.sendRedirect("login.jsp?message="+msg);
   }
%>
</body>
</html>