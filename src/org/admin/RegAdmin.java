package org.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/RegAdmin")
public class RegAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
  public RegAdmin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   try{
	   HttpSession session=request.getSession(false);
	   AdminBean adb=(AdminBean)session.getAttribute("ab");
	   if(new AdminService().regAdmin(adb))
	   {
		   
		   response.sendRedirect(request.getContextPath()+"/view/admin/profile.jsp?message="+"successfully new admin registered");
		   
		   
	   }
	   else{
		   response.sendRedirect(request.getContextPath()+"/view/admin/profile.jsp?message="+"Unable to register new admin");
		   
	   }
	   
   }
   catch(Exception e){
	   response.sendRedirect(request.getContextPath()+"/view/admin/profile.jsp?message="+"Error occured in registeration");
	   
	   
   }
	
	
	}


}
