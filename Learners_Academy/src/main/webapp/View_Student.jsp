<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mphss.simplilrn.entity.Students"%>
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
<a href="HTML/Add_Student.html">Add Student</a><br>
<a href="Assign_Student_To_Class.jsp">Assign Student</a>

<h1>The Following Students are listed</h1>
<%
	SessionFactory sf  = Hibernate_Util.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Students> students = hibernateSession.createQuery("from Students").list();
%>
<table>
<tr>
<th>Name </th>
<th>Last Name </th>
<th>Assigned Class </th>
</tr>
	<%		
		for(Students student : students){
			out.print("<tr>");	
			out.print("<td>" + student.getName() + "</td>");
			out.print("<td>" + student.getFname() + "</td>");
			out.print("<td>" + getClassName(student) + "</td>");
			out.print("</tr>");	
		}
	%>
</table>

<%!
	public String getClassName(Students student){
	if (student.getClasses() == null){
		return "no class assigned";
	}
	else{
		return student.getClasses().getName();
	}
}

%>
</body>
</html>