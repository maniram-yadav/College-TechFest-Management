package org.admin;

import java.util.Iterator;
import java.util.List;

import org.events.FestEvent;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import oracle.net.aso.f;
import student.bean.LoginDetail;
import student.bean.Participation;
import student.bean.StudentDetail;
import student.service.HiberFactory;

public class AdminDao {

	SessionFactory sf=HiberFactory.getSessionFactory();
	

public AdminBean loginAdmin(AdminBean adb){

	

     AdminBean ad=new AdminBean();
     
	Session session=sf.openSession();
	session.beginTransaction();
	Query query=session.createQuery("from AdminBean where email=:e and password=:pass");

	query.setParameter("e",adb.getEmail());
	query.setParameter("pass",adb.getPassword());
    
	List<AdminBean> list= query.list();
	Iterator<AdminBean> it=list.iterator();
	
	if(it.hasNext()){
	
		ad=it.next();
		        
			         }
	
	
	session.getTransaction().commit();
	session.close();
	
return ad;

}

public FestEvent getEventDetail(FestEvent fe){
	

	FestEvent f=new FestEvent();
	
	try{
		Session session=sf.openSession();
		session.beginTransaction();
		
		Criteria criteria=session.createCriteria(FestEvent.class);
		
		criteria.add(Restrictions.like("ename",fe.getEname()));
		//System.out.println(fe.getEname());
		List<FestEvent> list=criteria.list();
		
		Iterator i=list.iterator();
		if(i.hasNext()){
			//System.out.println("Has Class");
			f=(FestEvent) i.next();
			
		}
		session.getTransaction().commit();
		session.close();
		
		return f;
		
		}
		catch(Exception e){
			//System.out.println("Exception"+e);
		return f;	
		}

}

public boolean updateEvent(FestEvent fe){
	try{
	Session session=sf.openSession();

	session.beginTransaction();
	/*FestEvent f=new FestEvent();
	
	f.setEdescription(fe.getEdescription());
	f.setEname(fe.getEname());
	f.setEndtime(fe.getEndtime());
	f.setEventdate(fe.getEventdate());
	f.setId(fe.getId());
	f.setStarttime(fe.getStarttime());
	*/
	session.saveOrUpdate(fe);
	session.getTransaction().commit();
	session.close();
	
	return true;
	
	}
	catch(Exception e){
		
	return false;	
	}
}
	public List fetchStudent(){
		Session session=sf.openSession();
		session.beginTransaction();
		Query query=session.createQuery("from StudentDetail as sd,LoginDetail as ld left outer join Participation p on ld.userid=p.userid where sd.id=ld.stuid");
		List list=query.list();
		/*	Iterator<Object[]> it=list.iterator();
		while(it.hasNext())
		{
			Object[] o=it.next();
			StudentDetail sd=(StudentDetail)o[0];
			LoginDetail ld=(LoginDetail)o[1];
			Participation p=(Participation)o[2];
			System.out.println("\n\nDetails : ----");
			
			System.out.println("ID:   "+sd.getId()+"F:  "+sd.getFirstname()+"L:   "+sd.getLastname()+"C:  "+sd.getCollegename());
			
			System.out.print("SID:   "+ld.getStuid()+"LU:  "+ld.getUserid()+"   ");
			System.out.print("PU:  "+p.getUserid()+"PE:  "+p.getEventname());
		}
		*/
		//System.out.println(query.list());
		session.getTransaction().commit();
		session.close();
	return list;
}
	
	public boolean regAdmin(AdminBean adb){
		try{
		Session session=sf.openSession();
		session.beginTransaction();
		session.saveOrUpdate(adb);
		session.getTransaction().commit();
		session.close();
		return true;
		}
		catch(Exception e){
			return false;
		}
		
	}
	public boolean deleteEvent(FestEvent fe){
		try{
		Session session=sf.openSession();
		session.beginTransaction();
		String hql1="delete from Participation p where p.eventname like '"+fe.getEname()+"'";
		String hql="delete from FestEvent fe where fe.ename like '"+fe.getEname()+"'";
       
		Query query=session.createQuery(hql);
         Query query1=session.createQuery(hql1);
         
         int count=query.executeUpdate();
          int count1=query1.executeUpdate();
         session.getTransaction().commit();
		session.close();
		if(count!=0)
			return true;
		else 
			return false;
		}
		catch(Exception e){
			System.out.println(e.toString());
			return false;
		}
	}
}
