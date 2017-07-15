package org.events;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import student.bean.LoginDetail;
import student.bean.Participation;
import student.service.DaoService;

/**
 * Servlet implementation class RegisterEvent
 */
@WebServlet("/RegisterEvent")
public class RegisterEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public RegisterEvent() {
        super();}
      	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
      	
      	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		System.out.println("Post Method");
    	PrintWriter out=response.getWriter();
    	Participation part=new Participation();
    	DaoService daos=new DaoService();
    	HttpSession session=request.getSession(false);
		try{
    	LoginDetail ld=(LoginDetail) session.getAttribute("ld");
    	part.setEventname((String)request.getParameter("eventname"));
    	
    	System.out.println(request.getParameter("eventname"));
    	System.out.println((String)ld.getUserid());
    	
    	part.setUserid((String)ld.getUserid());
    	String message;
    	if(request.getParameter("eventname")!=null&&!request.getParameter("eventname").equals(""))
    	message=daos.requestEvent(part);
    	else
    		message="Sorry null value of the event";
    	response.sendRedirect("view/user/profile.jsp?message="+message);
    	}
		
		catch(Exception e){
		System.out.println("Exception : "+e);
			response.sendRedirect("view/user/profile.jsp?message="+"Error Occured");
		}
		
	}

}
