package student.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.admin.AdminBean;
import org.admin.AdminDao;
import org.events.FestEvent;

import events.dao.EventDao;
import student.bean.LoginDetail;
import student.bean.Participation;
import student.bean.StudentDetail;
import student.dao.PassRecover;
import student.dao.StudentDao;

public class DaoService {
	
	
	
	public boolean addStudent(StudentDetail sd){
		StudentDao sdao=new StudentDao();
		try{
			sdao.addStudent(sd);
			return true;
			
		}
		catch(Exception e){
			System.out.println(e);
			return false;
		}
	}
	
	
	public boolean addEvent(FestEvent fe){
		try{
		EventDao ed=new EventDao();
		ed.addEvent(fe);
		return true;
		}
		catch(Exception e){
			System.out.println(e);
			return false;
		}
		
	}
	
	public List<FestEvent> fetchEvent(FestEvent fe){
		EventDao ed=new EventDao();
		FestEvent f=new FestEvent();
		List<FestEvent> list=new ArrayList<FestEvent>();
		try{
		list=ed.fetchEvent(fe);
		}
		catch(Exception e){
		
		}
		return list;
	}
		
		public boolean isUserIdExist(LoginDetail ld){
			StudentDao sdao=new StudentDao();
			return sdao.isUserIdExist(ld);
			
		}
		
		
	public StudentDetail loginUser(LoginDetail ld){
		StudentDao sdao=new StudentDao();
		return sdao.loginUser(ld);
		
	}
	
	
	public List<String> takePart(LoginDetail ld){
		
		StudentDao sdao=new StudentDao();
		List<String> list=new ArrayList<String>();
		list=sdao.tekePart(ld);
		
		return list;
		
		
	}
public List<Participation> myEventList(LoginDetail ld){
		
		StudentDao sdao=new StudentDao();
		List<Participation> list=sdao.myEventList(ld);
		return list;
		
		
	}
		public String requestEvent(Participation p){
			String message;
			StudentDao sdao=new StudentDao();
			boolean status=sdao.requestEvent(p);
			
		   System.out.println("Status : "+status);
			if(status)
			   message="You have successfully register for event "+p.getEventname();
		   else
			   message="Unable to register to you due to some exception";
		   return message;
		}
		
		
		
		public boolean unPartEvent(Participation p){
			
			return new StudentDao().unPartEvent(p);
		}
		
		
		
		public String recoverPass(StudentDetail sd) throws AddressException, MessagingException, SQLException{
			
			return PassRecover.sendMail(sd);
		}
		
		public boolean updatePassword(LoginDetail ld,String pass){
			
			boolean b=new StudentDao().updatePassword(ld, pass);
		   return b;
		}
		
		
        public AdminBean loginAdmin(AdminBean adb){
        	AdminDao ado=new AdminDao();
        	return ado.loginAdmin(adb);
        	
        }
        
            public boolean isEmailExist(StudentDetail sd){
            	
            	return new StudentDao().isEmailExist(sd);
            }
}
