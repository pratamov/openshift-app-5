<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	
	out.println("<h1>Connecting to database</h1>");
	out.println("</br>MYSQL_USER:"+System.getenv("MYSQL_USER"));
	out.println("</br>MYSQL_PASSWORD:"+System.getenv("MYSQL_PASSWORD"));
	out.println("</br>MYSQL_DATABASE:"+System.getenv("MYSQL_DATABASE"));
	
	String MYSQL_USER = System.getenv("MYSQL_USER");
	String MYSQL_PASSWORD = System.getenv("MYSQL_PASSWORD");
	String MYSQL_DATABASE = System.getenv("MYSQL_DATABASE");
	String MYSQL_HOSTNAME = "localhost";
	String JDBC_URL = "jdbc:mysql://" + MYSQL_HOSTNAME + ":3306/" + MYSQL_DATABASE;
%>
<p>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		out.println("Where is your MySQL JDBC Driver?");
		return;
	}

	Connection connection = null;
	
	try {
		connection = DriverManager.getConnection(JDBC_URL,MYSQL_USER, MYSQL_PASSWORD);
	} catch (SQLException e) {
		out.println("Connection Failed! " + e.getMessage());
	}

	if (connection != null) {
		out.println("You made it, take control your database now!");
	} else {
		out.println("Failed to make connection!");
	}
%>
</p>

</body>
</html>