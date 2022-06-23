<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mphss.simplilrn.entity.Subjects"%>
<%@page import="mphss.simplilrn.entity.Teachers"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
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
<a href="HTML/Add_Teacher.html">Add Teacher</a><br>
<a href="Assign_Teacher_To_Subject.jsp">Assign Teacher to Subject</a><br>

<h1>The Following Teachers are listed</h1>
<%
	SessionFactory sf  = Hibernate_Util.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Teachers> teachers = hibernateSession.createQuery("from Teachers").list();
%>
<table>
<tr>
<th>First Name </th>
<th>Last Name </th>
<th>Assigned Class</th>
</tr>
	<%		
		for(Teachers teacher : teachers){
			out.print("<tr>");	
			out.print("<td>" + teacher.getName() + "</td>");
			out.print("<td>" + teacher.getLname() + "</td>");
			
			StringBuffer buf = new StringBuffer();
			boolean first = true;
			for (Subjects subject : teacher.getSubjects()){
				if(first== true){
					buf.append("<td>" + subject.getName() + "</td>");
					buf.append("</tr>");
					first = false;
				}else{
					buf.append("<tr><td></td><td></td>");
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