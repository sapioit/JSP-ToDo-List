import javax.servlet.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import java.sql.*;

/**
 * Servlet implementation class act
 */
@WebServlet("/act")
public class act extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public act() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql;
		String txt = request.getParameter("txt"); // content
		String id = request.getParameter("id"); // ID
		String act = request.getParameter("a"); // action: Add, Edit, Delete
		if(act.equals("Add")){
			sql = "INSERT INTO `todolist`(`txt`) VALUES (`"+txt+"`);";
		} else if(act.equals("Edit")){
			sql = "UPDATE `todolist` SET `txt`=`"+txt+"` WHERE `id`=`"+id+"`;";
		} else if(act.equals("Delete")){
			sql = "INSERT INTO `todolist`(`txt`) VALUES (`"+txt+"`);";
		}
		
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
			
			/*if(!con.isClosed())
				out.println("Successfully connected to " + "MySQL server using TCP/IP...");*/
			/*con.close();*/
			
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery(sql);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			response.setHeader("Location", request.getContextPath() + "/index.jsp");
		} catch(Exception ex){
			response.sendRedirect(request.getContextPath() + "/index.jsp?error");
			response.setHeader("Location", request.getContextPath() + "/index.jsp?error");
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
