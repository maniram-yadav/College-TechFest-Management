package org.admin;

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
 * Servlet implementation class LoginAdmin
 */
@WebServlet("/LoginAdmin")
public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

    	PrintWriter out=response.getWriter();
    	HttpSession session=request.getSession(false);
		try{
    	AdminBean lad=(AdminBean)session.getAttribute("lad");
		DaoService daos=new DaoService();
    	 AdminBean adb=new AdminBean(); 
    	 adb=daos.loginAdmin(lad);
    
    	 if(adb.getEmail()!=null&&adb.getPassword()!=null){
    	
    		session.setAttribute("adb",adb);
    		response.sendRedirect(request.getContextPath()+"/view/admin/profile.jsp");
	        
    	}
    	
    	else{
    	
    		String message="Either your Userid or your password is incorrect";
    		request.setAttribute("message",message);
    		response.sendRedirect(request.getContextPath()+"/view/admin/login.jsp?message="+message);
	    
    	}
		}
		catch(Exception ex){
			
			response.sendRedirect(request.getContextPath()+"/view/admin/login.jsp?message="+"Exception occured in on server");
		}
    	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
