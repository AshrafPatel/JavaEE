package com.ashraf.web.jbdc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class ServletJBDC
 */
@WebServlet("/ServletJBDC")
public class ServletJBDC extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Resource(name="jdbc/web_student")
	private DataSource dataSource;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletJBDC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		
		Connection myCn = null;
		Statement mySt = null;
		ResultSet myRs = null;
		
		try {
			myCn = dataSource.getConnection();
			
			String sql = "select * from student";
			mySt = myCn.createStatement();
			
			myRs = mySt.executeQuery(sql);
			
			while(myRs.next()) {
				String email = myRs.getString("email");
				out.println(email);
			}
		} catch(Exception exc) {
			exc.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
