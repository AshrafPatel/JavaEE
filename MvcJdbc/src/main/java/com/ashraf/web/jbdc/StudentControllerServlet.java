package com.ashraf.web.jbdc;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentDbUtil studentDbUtil;
	
	@Resource(name="jdbc/web_student")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {		
		try {
			studentDbUtil = new StudentDbUtil(dataSource);
		} catch(Exception e) {
			throw new ServletException(e);
		}
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//Read the command
			String command = request.getParameter("command");
			
			if (command==null) {
				listStudents(request, response);
			}
			
			switch(command) {
				case "LIST":
					listStudents(request, response);
					break;
				case "LOAD":
					loadStudent(request, response);
					break;
				case "DELETE":
					deleteStudent(request, response);
					break;
				case "SEARCH":
					searchStudent(request, response);
					break;
				default:
					listStudents(request, response);
					break;
			}
			listStudents(request, response);
		} catch(Exception e) {
			throw new ServletException(e);
		}
	}


	private void searchStudent(HttpServletRequest request, HttpServletResponse response) {
        String searchTerm = request.getParameter("searchTerm");
        List<Student> students = studentDbUtil.searchStudents(searchTerm);
        
        // add students to the request
        request.setAttribute("STUDENT_LIST", students);
                
        // send to JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
        dispatcher.forward(request, response);
	}


	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("studId"));
		studentDbUtil.deleteStudent(id);
		listStudents(request, response);
		
	}


	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("studId"));
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String email = request.getParameter("email");
		int age = Integer.parseInt(request.getParameter("age"));
		String course = request.getParameter("course");
		
		Student updatedStudent = new Student(id, fName, lName, email, age, course);
		
		studentDbUtil.updateStudent(updatedStudent);
		
		response.sendRedirect(request.getContextPath() + "/StudentControllerServlet?command=LIST");
	}


	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String email = request.getParameter("email");
		int age = Integer.parseInt(request.getParameter("age"));
		String course = request.getParameter("course");
		
		Student student = new Student(fName, lName, email, age, course);
		
		studentDbUtil.addStudent(student);
		
		response.sendRedirect(request.getContextPath() + "/StudentControllerServlet?command=LIST");
	}
	
	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String studId = request.getParameter("student");
		
		Student theStudent = studentDbUtil.getStudent(studId);
		
		request.setAttribute("STUDENT", theStudent);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/update-student.jsp");
		dispatcher.forward(request, response);
	}


	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Student> students = studentDbUtil.getStudents();
		
		request.setAttribute("STUDENTS", students);
		
		RequestDispatcher dispatcher =  request.getRequestDispatcher("/list-student.jsp");
		dispatcher.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//Read the command
			String command = request.getParameter("command");
			if (command==null) {
				listStudents(request, response);
			}
			
			switch(command) {
				case "ADD":
					addStudent(request, response);
					break;
				case "UPDATE":
					updateStudent(request, response);
					break;
				default:
					listStudents(request, response);
					break;
			}
		} catch(Exception e) {
			throw new ServletException(e);
		}
	}
}
