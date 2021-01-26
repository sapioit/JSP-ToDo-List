<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.io.IOException" %>

<%@ page import = "javax.servlet.ServletException" %>
<%@ page import = "javax.servlet.annotation.WebServlet" %>
<%@ page import = "javax.servlet.http.HttpServlet" %>
<%@ page import = "javax.servlet.http.HttpServletRequest" %>
<%@ page import = "javax.servlet.http.HttpServletResponse" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
// <!-- View Start -->
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ToDo List</title>
</head>
<body> 
<form action="" method="get">
  <input type="text" id="txt" name="txt" value="test0"><br/>
  <input type="hidden" id="id" name="id" value="0">
  <input type="submit" id="a" name="a" value="Add">
</form> <a href="?">Clear</a><br/>
<!-- View Pause -->
<%


//<!-- Controller Start -->
try {
	String dbDriver = "com.mysql.jdbc.Driver"; 
	String dbURL = "jdbc:mysql://localhost:3306/"; 
	String dbName = "java"; 
	String dbUsername = "root"; 
	String dbPassword = "root"; 
	
	//Class.forName(dbDriver);
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con = DriverManager.getConnection(
			dbURL + dbName, dbUsername,   dbPassword);
	
	/*
	if(!con.isClosed())
		out.println("Successfully connected to " + "MySQL server using TCP/IP...");*/
	/*con.close();*/	
	Statement st = con.createStatement();

	

	String sql;
	String txt = request.getParameter("txt"); // content
	String id = request.getParameter("id"); // ID
	String a = request.getParameter("a"); // action: Add, Edit, Delete

	//out.println("txt: "+txt+"<br/>id: "+id+"<br/>a: "+a+"<br/>");
	//print everything I GET
	
	if(a != null){
		if(a.equals("Add")){
			sql = "INSERT INTO todolist (txt) VALUES ('"+txt+"');";
			//out.println(sql);
			int dump = st.executeUpdate(sql);
		} else if(a.equals("Edit")){
			sql = "UPDATE todolist SET txt='"+txt+"' WHERE id="+id+";";
			//out.println(sql);
			int dump = st.executeUpdate(sql);
		} else if(a.equals("Delete")){
			sql = "DELETE FROM todolist WHERE id="+id+";";
			//out.println(sql);
			int dump = st.executeUpdate(sql);
		}
	}
	//<!-- View Resume -->
	sql = "select id, txt from todolist;";
	ResultSet rs = st.executeQuery(sql);
	
	while (rs.next()) {
		out.println("<form action=\"\" method=\"get\">");
		out.println("<input type=\"text\" id=\"txt\" name=\"txt\" value=\""+rs.getString(2)+"\"><br/>");
		out.println("<input type=\"hidden\" id=\"id\" name=\"id\" value=\""+rs.getInt(1)+"\">");
		out.println("<input type=\"submit\" id=\"a\" name=\"a\" value=\"Edit\"> ");
		out.println("<input type=\"submit\" id=\"a\" name=\"a\" value=\"Delete\"><br/>");
		out.println("</form><br/>");
	}
	
} catch(Exception ex){
	out.println("Unable to connect to database. "+ex);
}
//<!-- Controller End --> 


%>
</body>
</html>
<!-- View End -->













<!-- 

	
/*
public add(String txt){
	String sql = "INSERT INTO `todolist`(`txt`) VALUES (`"+txt+"`);";
	ResultSet rs = st.executeQuery(sql);
}
public edit(Int id, String txt){
	String sql = "UPDATE `todolist` SET `txt`=`"+txt+"` WHERE `id`=`"+id+"`;";
	ResultSet rs = st.executeQuery(sql);
}
public delete(Int id){
	String sql = "INSERT INTO `todolist`(`txt`) VALUES (`"+txt+"`);";
	ResultSet rs = st.executeQuery(sql);
}
*/


<form action="/act" method="get">
  <input type="text" id="txt" name="txt" value="test"><br/>
  <input type="submit" id="a" value="Add">
  <input type="hidden" id="id" name="id" value="0">
</form><br/>

<form action="/act" method="get">
  <input type="text" id="txt" name="txt" value="test"><br/>
  <input type="submit" value="Edit"> 
  <input type="submit" value="Delete"><br/>
  <input type="hidden" id="id" name="id" value="2">
</form><br/>



String dbDriver = "com.mysql.jdbc.Driver"; 
String dbURL = "jdbc:mysql:// localhost:3306/"; 
String dbName = "java"; 
String dbUsername = "root"; 
String dbPassword = "root"; 

Class.forName(dbDriver); 
Connection con = DriverManager.getConnection(
		dbURL + dbName, dbUsername,   dbPassword); 
Statement st = con.createStatement();

/*String sql = "select count(*) from todolist;";
ResultSet rs = st.executeQuery(sql);
int  linii = Integer.parseInt(rs.getString(1));*/

String sql = "select * from todolist;";
ResultSet rs = st.executeQuery(sql);
 -->