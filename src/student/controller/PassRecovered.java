package student.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import student.bean.StudentDetail;

@WebServlet("/PassRecover")
public class PassRecovered extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PassRecovered() {
        super();
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter out=response.getWriter();
	
    	StudentDetail sd=new StudentDetail();
    	//sd.setEmail(request.getParameter("email"));
    	String message;
    
    	try{

    	message=student.dao.PassRecover.sendMail(sd);
		//out.print(message);
    	//response.sendRedirect("view/user/login.jsp?message="+message);
    	}
    	catch(Exception e){
    	//	response.sendRedirect("view/user/login.jsp?message="+"Exception occured");
    //    out.println(e);	
    	}

	
	}

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter out=response.getWriter();
	
    	StudentDetail sd=new StudentDetail();
    	sd.setEmail(request.getParameter("email"));
    	String message;
    
    	try{

    	message=student.dao.PassRecover.sendMail(sd);
//		out.print(message);
    	response.sendRedirect("view/user/login.jsp?message="+message);
    	}
    	catch(Exception e){
    		response.sendRedirect("view/user/login.jsp?message="+"Exception occured");
  //      out.println(e);	
    	}

	
	}


}
