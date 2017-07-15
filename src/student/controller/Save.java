package student.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import student.bean.LoginDetail;
import student.bean.StudentDetail;
import student.service.DaoService;

/**
 * Servlet implementation class Save
 */
@WebServlet("/Signup")
public class Save extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Save() {
        super();
       }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		StudentDetail sd=new StudentDetail();
		LoginDetail ld=new LoginDetail();
		DaoService daos=new DaoService();
		
		
		
	}

}
