<%@page import="mphss.simplilrn.entity.Subjects"%>
<%@page import="mphss.simplilrn.entity.Teachers"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="mphss.simplilrn.util.Hibernate_Util"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="Index.html">Back to Main Menu</a><br>

<h1>Assign a Teacher to a Subject</h1>
<%
	SessionFactory sf  = Hibernate_Util.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Teachers> teachers = hibernateSession.createQuery("from Teachers").list();
	List<Subjects> subjects = hibernateSession.createQuery("from Subjects").list();
%>

<form action="Assign_Teacher" method="post">
<table>
<tr>
<th>Student Name </th>
<th>Subject Name </th>
</tr>
<tr>
<td>
<select name="name">
<%
	for (Teachers teacher : teachers){
	out.print("<option>" + teacher.getName() + " " + teacher.getLname());
	out.print("</option>");
	}
%>
</select>
</td>

<td>
<select name="subject">
<%
	for (Subjects subject : subjects){
	out.print("<option>" + subject.getName());
	out.print("</option>");
	}
%>
</select>
</td>
</tr>
</table>
<input type="submit" value="Submit">
</form>
</body>
</html>