package student.service;
import org.hibernate.*;
import org.hibernate.cfg.*;
public class HiberFactory {
	static SessionFactory sessionFactory;
	static{
		try{
		sessionFactory=new Configuration().configure().buildSessionFactory();
		}
		catch(Exception e){
			sessionFactory=null;
		}
		}
	public static SessionFactory getSessionFactory(){
		
		return sessionFactory;
	}

}
