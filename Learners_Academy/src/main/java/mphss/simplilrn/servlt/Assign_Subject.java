package mphss.simplilrn.servlt;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import mphss.simplilrn.entity.Classes;
import mphss.simplilrn.entity.Subjects;
import mphss.simplilrn.entity.Teachers;
import mphss.simplilrn.util.Hibernate_Util;

/**
 * Servlet implementation class AssignSubject
 */
@WebServlet("/Assign_Subject")
public class Assign_Subject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Assign_Subject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		// Step 1: Get details , user has entered
		String clas = request.getParameter("class");
		String subject = request.getParameter("subject");
				
		// Step2: Create session
		SessionFactory sf  = Hibernate_Util.buildSessionFactory();
		Session session = sf.openSession();
		
		// Step 3: Begin Transaction
		Transaction tx = session.beginTransaction();
		
		String hql_clas= "from Classes where name='" + clas + "'";
		List<Classes> classes = session.createQuery(hql_clas).list();
		
		String hql_subject = "update Subject s set s.classes=:n where s.name=:sn";
		
		Query<Subjects> query = session.createQuery(hql_subject);
		query.setParameter("n", classes.get(0));
		query.setParameter("sn", subject);
				
		query.executeUpdate();

		
		// STep5: Commit transaction and close sessoin
		tx.commit();
		session.close();
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/viewClass.jsp");
        dispatcher.forward(request, response); 
	}

}
