package student.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import student.bean.LoginDetail;
import student.bean.StudentDetail;
import student.service.DaoService;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	PrintWriter out=response.getWriter();
    	
    	HttpSession session=request.getSession(false);
    //	System.out.println("Session"+session);
    	try{
    	LoginDetail ld=(LoginDetail) session.getAttribute("ld");
		//out.println(ld.getPassword());
    	
		DaoService daos=new DaoService();
    	StudentDetail sd=new StudentDetail();
    	sd=daos.loginUser(ld);
    	
    	if(sd.getEmail()!=null){
    	
    		session.setAttribute("sd",sd);
    		response.sendRedirect("view/user/profile.jsp");
	        
    	}
    	
    	else{
    	
    		String message="Either your Userid or your password is incorrect";
    		request.setAttribute("message",message);
    		response.sendRedirect("view/user/login.jsp?message="+message);
	    
    	}
		}
		catch(Exception ex){
			
			response.sendRedirect("view/user/login.jsp?message="+"Exception occured in on server");
		}
    	
    }
    
  

}
