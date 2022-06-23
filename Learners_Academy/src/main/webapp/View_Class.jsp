<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mphss.simplilrn.entity.Subjects"%>
<%@page import="org.hibernate.Session"%>
<%@page import="mphss.simplilrn.entity.Classes"%>
<%@page import="java.util.List"%>
<%@page import="mphss.simplilrn.util.Hibernate_Util"%>
<%@page import="org.hibernate.SessionFactory"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="Index.html">Back to Main Menu</a><br>
<a href="HTML/Add_Classes.html">Add Class</a><br>
<a href="Assign_Subject_To_Class.jsp">Assign Subject to Class</a><br>

<h1>The Following Classes are listed</h1>
<%
	SessionFactory sf  = Hibernate_Util.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Classes> classes = hibernateSession.createQuery("from Classes").list();
%>
<table>
<tr>
<th>Class Name </th>
<th>Subject Name</th>
</tr>	
	<%		
		for(Classes clas : classes){
			out.print("<tr>");	
			out.print("<td>" + clas.getName() + "</td>");
						
			StringBuffer buf = new StringBuffer();
			boolean first = true;
			for (Subjects subject : clas.getSubjects()){
				if(first== true){
					buf.append("<td>" + subject.getName() + "</td>");
					buf.append("</tr>");
					first = false;
				}else{
					buf.append("<tr><td></td>");
					buf.append("<td>" + subject.getName() + "</td>");
					buf.append("</tr>");
				}
				
			}
			out.print(buf.toString());
		}
	%>
</table>
</body>
</html>