package student.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Stack;

import org.admin.AdminBean;
import org.admin.AdminDao;
import org.admin.AdminService;
import org.events.FestEvent;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

import events.dao.EventDao;
import student.bean.LoginDetail;
import student.bean.Participation;
import student.bean.StudentDetail;
import student.dao.PassRecover;
import student.dao.StudentDao;

public class CheckService {
	public static void main(String[] arg){
		
		FestEvent fe=new FestEvent();
		StudentDetail sd=new StudentDetail();
		LoginDetail ld=new LoginDetail();
		DaoService daos=new DaoService();
		Participation part=new Participation();
		StudentDao sdo=new StudentDao();
		AdminDao ado=new AdminDao();
		Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
		session.beginTransaction();

		/*
		sd.setCity("Ratapur");
		sd.setCollegename("FGIET");
		sd.setEmail("maniramemail");
		sd.setFirstname("Maniram");
		sd.setGender("Male");
		sd.setLastname("Yadav");
		sd.setPhonenumber("7896786875");
		
		ld.setUserid("user");
		ld.setPassword("pass");
		
		sd.setlDetail(ld);
		ld.setStudetail(sd);
		
		*/
		//session.persist(sd);
		//ld.setUserid("use");
		//boolean status=daos.addStudent(sd);
		
		
	//StudentDao sdao=new StudentDao();
	
	//System.out.println(sdao.isUserIdExist(ld));
		/*
		fe.setId(1);
		fe.setEdescription("Use the software");
		fe.setEname("Maniram");
		fe.setEndtime("5:00 PM");
		fe.setStarttime("2:00 PM");
		fe.setEventdate("8-March-2017");
		*/
		
	   //part.setEventname("Algol");
	    // part.setEventname("AppDroid");
		//part.setUserid("maniram");
    //session.save(part);
		
	
		
		
		/*Query query=session.createQuery("from Participation P where userid=:ui ORDER BY P.eventid asc");
		query.setParameter("ui","maniram");
		List list=query.list();
		Iterator it=list.iterator();
		while(it.hasNext()){
			Participation p=(Participation) it.next();
			System.out.println(p.getEventid());
			
		}
		*/
		

		/*
		fe.setEdescription("event3");
		fe.setEname("event3");
		fe.setEndtime("5:00 PM");
		fe.setStarttime("2:00 PM");
		fe.setEventdate("8-March-2017");
		daos.addEvent(fe);
*/
		/*Query query=session.createQuery("from FestEvent");
		List list=query.list();
		Iterator<FestEvent> it=list.iterator();
		while(it.hasNext())
		{
			FestEvent f=it.next();
		
		
	*/
		
		
//		session.beginTransaction();

		
		
		
		
		
		/*????????????????????  Logging in user  ??????????????????????*/
		/*ld.setUserid("maniram");
		ld.setPassword("maniram");
		sd=daos.loginUser(ld);
		if(sd.getFirstname()!=null)
		   System.out.println("First Name : "+sd.getFirstname());
		else
			System.out.println("Error in logging");
		ld=sdo.getUserId(ld);
		System.out.println(ld.getStuid());
     */
		
		
		
		
		/*???????????????????     Check participated events  ??????????????????????*/
		
	/*	Participation pa=new Participation();
		ld.setUserid("maniram2");
		List<Participation> list=sdo.myEventList(ld);
		
		Iterator<Participation> iter=list.iterator();
		while(iter.hasNext()){
			Participation par=new Participation();
			par=iter.next();
			System.out.println("  Student Event Deatil ");
			
			System.out.println("Event Name : "+par.getEventname());
			System.out.println(" Id: "+par.getId());
			System.out.println("Event Name : "+par.getEventname());
			System.out.println("User id : "+par.getUserid());
		}
		
		
		*/
		
		/*?????????????????   Fetch event in which student has not taken part   ??????????????????????????????*/
	   /*
    ld.setUserid("maniram2");
		
    List<String> list1=sdo.tekePart(ld);
    
		Iterator<String> it=list1.iterator();
		while(it.hasNext()){
			
			//FestEvent fest=new FestEvent();
			//fest=it.next();
			System.out.println("Ename : "+it.next());
			
		}
		
		*/

		
		/*sd.setEmail("manir@gmail.com");
		try{
		System.out.println(new DaoService().recoverPass(sd));
		}
		catch(Exception e){
			System.out.println(e);
		}*/
		
		
		/****************   Enter Admin value  ************************/
		 /*AdminBean adb=new AdminBean();
		 adb.setEmail("amerendra@gmail.com");
		 adb.setName("Amerendra Tiwari");
		 adb.setPassword("amerendra");
		*/// System.out.println(session.save(adb));
		
		 
		 
		 /****************  Checking Admin value  ***************/
		 
AdminBean adb=new AdminBean();
		  adb.setEmail("admin@gmail.com");
			adb.setPassword("dmin");
		 System.out.println(daos.loginAdmin(adb));	 

/*         fe.setEname("Digi-Canva");
  		FestEvent f=ado.getEventDetail(fe);
		
		if(f.getEdescription()!=null){
			//f.setEname("Digi-Canva");
			System.out.println(f.getEdescription());
			//System.out.println(ado.updateEvent(f));
		}
		else 
			System.out.println("Unable");
	*/
		
		/***********?????????Fetch Student  ?????????????*******/
		
		//new AdminDao().fetchStudent();
		//session.getTransaction().commit();
		
		
		
		
		/*******************   Delete event admin profile        ********************************/
		//fe.setEname("AppDroid");
		//System.out.println(new AdminService().deleteEvent(fe));
		
		
		
		session.close();	
		System.out.println("Successfull");

}
	

}

