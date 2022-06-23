<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mphss.simplilrn.entity.Students"%>
<%@page import="mphss.simplilrn.entity.Teachers"%>
<%@page import="mphss.simplilrn.entity.Subjects"%>
<%@page import="mphss.simplilrn.entity.Classes"%>
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
<%String clas = request.getParameter("class");%>
<h1>Class Report for <%=clas%></h1>

<%
	SessionFactory sf  = Hibernate_Util.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Classes> classes =(hibernateSession.createQuery("from Classes cl where cl.name='" + clas + "'")).list();

	Classes clasForReport = classes.get(0);
%>
<table>
<tr>
<th>Subject Name </th>
<th>Teacher Name </th>
</tr>
<%	
	for(Subjects subject: clasForReport.getSubjects()){
		out.print("<tr>");	
		out.print("<td>" + subject.getName() + "</td>");
		out.print("<td>" + getTeacherName(subject) + "</td>");
		out.print("</tr>");
	}
%>
</table>
<%!
	public String getTeacherName(Subjects subject){
		Teachers teacher = subject.getTeacher();
		String name;
		String lname;
	
		if(teacher != null){
			name=teacher.getName();
			lname = teacher.getLname();
			
			return name + " " + lname;
		}else{
			return "No Teacher assigned";
		}

}

%>
<table>
<br>
<tr>
<th>Listed Students</th>
</tr>
<%
	for(Students student : clasForReport.getStudents()){
		out.print("<tr>");
		out.print("<td>" + student.getName() + " " + student.getFname() + "</td>");
		out.print("</tr>");
	}
%>
</table>
</body>
</html>