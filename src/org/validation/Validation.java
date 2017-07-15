package org.validation;

import org.admin.AdminBean;

import student.bean.LoginDetail;
import student.bean.StudentDetail;

public class Validation {
	
	public boolean validateUserInfo(StudentDetail sd){
		LoginDetail ld=new LoginDetail();
		ld=sd.getlDetail();
		try{
		if(sd!=null&&ld!=null){
			
		
		     if(sd.getCollegename()!=null&&
		        sd.getEmail()!=null&&
				sd.getFirstname()!=null&&
				sd.getGender()!=null&&
				sd.getlDetail()!=null&&
				sd.getPhonenumber()!=null&&
				ld.getPassword()!=null&&
				ld.getUserid()!=null){
			return true;
		}
		else{
			return false;
		}
		}
		else{
			return false;
			
		}}
		catch(Exception ex){
			return false;
		}
		
	}
	

  public boolean validatLogin(LoginDetail ld){
	  if(ld.getPassword()!=null||ld.getUserid()!=null)
	  {
		  
		 return true;
	  }	  
	  else 
	  {
		  return false;
	   }
  }
  

  public boolean validatALogin(AdminBean lad){
	  
	  if(lad.getPassword()!=null&&lad.getEmail()!=null&&!lad.getEmail().equals("")&&!lad.getPassword().equals(""))
	  {
		  
		 return true;
	  }	  
	  else 
	  {
		  return false;
	   }
  }
  

  public boolean validatAReg(AdminBean lad){
	  
	  if(lad.getPassword()!=null&&lad.getEmail()!=null&&!lad.getEmail().equals("")&&!lad.getPassword().equals("")&&lad.getName()!=null&&!lad.getName().equals(""))
	  {
		  
		 return true;
	  }	  
	  else 
	  {
		  return false;
	   }
  }
  
  
  
  
}
