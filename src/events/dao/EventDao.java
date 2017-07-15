package events.dao;

import java.util.List;

import org.events.FestEvent;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.value.Required;

import student.service.HiberFactory;

public class EventDao {
	SessionFactory sessionFactory=HiberFactory.getSessionFactory();
public void addEvent(FestEvent fe){
	
	Session session=sessionFactory.openSession();
	session.beginTransaction();
	session.save(fe);
	session.getTransaction().commit();
	session.close();
}

public List<FestEvent> fetchEvent(FestEvent fe){

	Session session=sessionFactory.openSession();
	
	session.beginTransaction();
	
	Query query=session.createQuery("from FestEvent");
	
	List list=query.list();
	
	session.getTransaction().commit();
	session.close();
	return list;
}
}
