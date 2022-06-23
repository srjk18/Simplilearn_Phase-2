package mphss.simplilrn.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import mphss.simplilrn.entity.Classes;
import mphss.simplilrn.entity.Students;
import mphss.simplilrn.entity.Subjects;
import mphss.simplilrn.entity.Teachers;

public class Hibernate_Util {

	public static SessionFactory buildSessionFactory() {

		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml")
				.addAnnotatedClass(Teachers.class)
				.addAnnotatedClass(Subjects.class)
				.addAnnotatedClass(Classes.class)
				.addAnnotatedClass(Students.class)
				.buildSessionFactory();
				
		return sessionFactory;
	}
}


