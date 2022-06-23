<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mphss.simplilrn.entity.Classes"%>
<%@page import="mphss.simplilrn.util.Hibernate_Util"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="mphss.simplilrn.entity.Students"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="Index.html">Back to Main Menu</a><br>

<h1>Assign a Student to a Class</h1>
<%
	SessionFactory sf  = Hibernate_Util.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Students> students = hibernateSession.createQuery("from Students").list();
	List<Classes> classes = hibernateSession.createQuery("from Classes").list();
%>
<form action="Assign_Student" method="post">
<table>
<tr>
<th>Student Name </th>
<th>Class Name </th>
</tr>
<tr>
<td>
<select name="name">
<%
	for (Students student : students){
	out.print("<option>" + student.getName() + " " + student.getFname());
	out.print("</option>");
	}
%>
</select>
</td>

<td>
<select name="class">
<%
	for (Classes clas : classes){
	out.print("<option>" + clas.getName());
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