package mphss.simplilrn.servlt;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import mphss.simplilrn.entity.Students;
import mphss.simplilrn.util.Hibernate_Util;

/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/Add_Student")
public class Add_Student extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Student() {
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
		String name = request.getParameter("fname");
		String lname = request.getParameter("lname");
				
		// Step2: Create session
		SessionFactory sf  = Hibernate_Util.buildSessionFactory();
		Session session = sf.openSession();
		
		// Step 3: Begin Transaction
		Transaction tx = session.beginTransaction();
			
		//Step4; Create persistent object and add Teacher
		
		Students student = new Students();
		student.setName(name);
		student.setFname(lname);
		
		
		session.save(student);
		
		// STep5: Commit transaction and close session
		tx.commit();
		session.close();
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/View_Student.jsp");
        dispatcher.forward(request, response); 
	}

}
