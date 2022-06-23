<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mphss.simplilrn.entity.Subjects"%>
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
<a href="HTML/Add_Subject.html">Add Subject</a><br>

<h1>The Following Subjects are listed</h1>
<%
	SessionFactory sf  = Hibernate_Util.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Subjects> subjects = hibernateSession.createQuery("from Subjects").list();
%>
<table>
<tr>
<th>Subject Name </th>
</tr>
	<%		
		for(Subjects subject : subjects){
			out.print("<tr>");	
			out.print("<td>" + subject.getName() + "</td>");
			out.print("</tr>");	
		}
	%>
</table>



</body>
</html>