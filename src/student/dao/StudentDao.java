package student.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.hibernate.*;
import org.events.FestEvent;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.logicalcobwebs.concurrent.FJTask.Par;
import org.value.Required;

import student.bean.LoginDetail;
import student.bean.Participation;
import student.bean.StudentDetail;
import student.service.HiberFactory;

public class StudentDao {
	
	
	public boolean isEmailExist(StudentDetail sd){
		try{
		Session session=HiberFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query=session.createQuery("from StudentDetail where email like "+sd.getEmail());
		List<StudentDetail> list=query.list();
		Iterator<StudentDetail> it=list.iterator();
		session.getTransaction().commit();
		session.close();
		if(it.hasNext())
			return true;
		else 
			return false;
		}
		catch(Exception e)
		{
			return false;
		}
	}
	
public void addStudent(StudentDetail sd){

	try{
	Session session=HiberFactory.getSessionFactory().openSession();
	session.beginTransaction();
	session.save(sd);
	session.getTransaction().commit();
	session.close();
	}
	catch(Exception e){}
}


public boolean isUserIdExist(LoginDetail ld){
	try{
	Session session=HiberFactory.getSessionFactory().openSession();
	session.beginTransaction();
	Query query=session.createQuery("from LoginDetail ld where userid=:ui");
	query.setParameter("ui",ld.getUserid());
	
	List<LoginDetail> list=((org.hibernate.Query) query).list();
	Iterator<LoginDetail> it=list.iterator();

	session.getTransaction().commit();
	session.close();
	
	if(it.hasNext())
		return false;
	return true;
	}
	catch(Exception e){
		return false;
	}
}


public StudentDetail loginUser(LoginDetail ld){

	StudentDetail sd=new StudentDetail();
	try{
	

	Session session=HiberFactory.getSessionFactory().openSession();
	session.beginTransaction();
	Query query=session.createQuery("from LoginDetail where userid=:ui and password=:pass");

	
	query.setParameter("ui",ld.getUserid());
	query.setParameter("pass", ld.getPassword());
    
	//System.out.println("UserId : "+ld.getUserid());
    //System.out.println("Password : "+ld.getPassword());
	
	List<LoginDetail> list= query.list();
	Iterator<LoginDetail> it=list.iterator();
	
	if(it.hasNext()){
	
		LoginDetail ld1=new LoginDetail();
		ld1=it.next();
		Query squery=session.createQuery("from StudentDetail where id=:id");
		
		//System.out.println("Stu Id :"+ld1.getStuid());
		
		squery.setParameter("id",ld1.getStuid());
		List<StudentDetail> list1=((org.hibernate.Query) squery).list();
		
		Iterator<StudentDetail> iter=list1.iterator();
			
		if(iter.hasNext())
			{
				
				sd=iter.next();
		  //  System.out.println("Email : "+sd.getEmail());
			}}
	
	
	session.getTransaction().commit();
	session.close();
	
      return sd;
	}
	catch(Exception e)
	{
		return sd;
	}
}


public LoginDetail getUserId(LoginDetail ld)
{ 
	LoginDetail ld1=new LoginDetail();
	try{
	Session session=HiberFactory.getSessionFactory().openSession();
	session.beginTransaction();
		Query query=session.createQuery("from LoginDetail where userid=:ui and password=:pass");


			query.setParameter("ui",ld.getUserid());
		    query.setParameter("pass",ld.getPassword());
		    List<LoginDetail> list=query.list();
		    Iterator<LoginDetail> it=list.iterator();
		    if(it.hasNext()){
		    	ld1=new LoginDetail();
		    	ld1=it.next();
		   }
 
		    session.getTransaction().commit();
			session.close();
			
		    return ld1;
}
  catch(Exception e){
	  
	  return ld1;
  }	
}

public 	List<String> tekePart(LoginDetail ld){
	List<String> slist=new ArrayList<String>();	
	try{
	Session session=HiberFactory.getSessionFactory().openSession();
	session.beginTransaction();
	
	String str;

	Query query=session.createQuery("from FestEvent");
	List<FestEvent> list=query.list();
//System.out.println("FList : "+list);
	
	List<Participation> l=new  ArrayList<Participation>() ;
      Iterator<Participation> pit=l.iterator();
      Iterator<FestEvent> it=list.iterator();
	while(it.hasNext()){
		slist.add(it.next().getEname());
	                   }

    

	//System.out.println(slist);
	   try{  
			l=this.myEventList(ld);
		    pit=l.iterator();

	//		System.out.println(l);

	
	while(pit.hasNext()){
	
		Participation p=new Participation();
		p=pit.next();
		str=p.getEventname();
		
		//System.out.println(str);
		if(slist.contains(str))
		{
			//System.out.println("Removed");
			slist.remove(str);
		}
	}

	   }
	   
	   catch(Exception e){
		   
		   
	   }

	//System.out.println("Slist Content : "+slist);
	session.getTransaction().commit();
	session.close();

	return slist;
	}
	  catch(Exception e){
		  return slist;
	  }	

}



     public List<Participation> myEventList(LoginDetail ld){

    	 List<Participation> list1=new ArrayList<Participation>();
 		
    	 try{
    	 Session session=HiberFactory.getSessionFactory().openSession();
    		session.beginTransaction();
    		

    		Query query=session.createQuery("select max(id) from Participation");
    		List<Integer> list=query.list();
    		
    		int id=list.get(0);
    		//System.out.println("Id : "+id);
    		Query query1=session.createQuery("from Participation as p where p.id<="+id+" and p.userid='"+ld.getUserid()+"'");
    		list1=query1.list();
    		session.getTransaction().commit();
    		session.close();
    		return list1;
     }
     catch(Exception e){
    		return list1;
     }	

     }
     
     /*????????????    Student request for participation in event   ????????????*/
     public boolean requestEvent(Participation p)
     {
          try{
    	 Session session=HiberFactory.getSessionFactory().openSession();
    		session.beginTransaction();
    	int i=(int) session.save(p);
    	//System.out.println(" I : "+i);
    	session.getTransaction().commit();
    	session.close();
    	  if(i>0)
    		  return true;
    	  else 
    		  return false;
          }
          catch(Exception e){
        	  return false;
          }	

     }


     /**??????????????????  Student request for unparticipation in event  ?????????????????????????????????????????**/

     
     
     public boolean unPartEvent(Participation p){
    	 
    	 try{
    		 Session session=HiberFactory.getSessionFactory().openSession();
    		 session.beginTransaction();
    		 
    		 Query query=session.createQuery("delete from Participation where userid like '"+p.getUserid()+"' and eventname like '"+p.getEventname()+"'");
    		 
    		 int row=query.executeUpdate();
    		 session.getTransaction().commit();
    		 session.close();
    		 if(row>0)
    		 return true;
    		 else
    			 return false;
    		 
    	 }
    	 catch(Exception e){
    		 
    		 return false;
    	 }
     }
     
     
     
/* ????????????????????????   Student password recovery  ?????????????????????  */

public LoginDetail recoverPassword(StudentDetail sd){
	LoginDetail ld=new LoginDetail();
	
	try{
	Session session=HiberFactory.getSessionFactory().openSession();
		session.beginTransaction();

		Query query=session.createQuery("from StudentDetail where email='"+sd.getEmail()+"'");
		List<StudentDetail> list=query.list();
		
		Iterator<StudentDetail> it=list.iterator();
		if(it.hasNext())
		{
			sd=it.next();
			ld=sd.getlDetail();
		}
		session.getTransaction().commit();
    	session.close();
    	
		return ld;
}
catch(Exception e){
	
	return ld;

}	

}



public boolean updatePassword(LoginDetail ld,String pass){
   try{
	Session session=HiberFactory.getSessionFactory().openSession();

	try{

//		Session session=HiberFactory.getSessionFactory().openSession();
		session.beginTransaction();

         Query query=session.createQuery("select max(stuid) from LoginDetail");
         List<Integer> list1=query.list();
         int i=list1.get(0);
	    Query query1=session.createQuery("from LoginDetail where id<="+i+" and userid='"+ld.getUserid()+"'");
	      List<LoginDetail> list=query1.list();
	      Iterator<LoginDetail> it=list.iterator();
	     LoginDetail ld1=new LoginDetail();
	       
	     if(it.hasNext())
              ld1=it.next();
	      
	      ld1.setPassword(pass);
	      //int i=session.(ld);
	      session.save(ld1);
	      session.getTransaction().commit();
	    	session.close();
	    	
	      return true;}
catch(Exception e){
	if(session.getTransaction()!=null)
	     session.getTransaction().commit();
	session.close();
	
	return false;
	
}
   }
   catch(Exception e){
		return false;

   }	

}
	
}

