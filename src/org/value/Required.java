package org.value;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

public class Required {

	public static Session session=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
}
