package com.ashraf.web.jbdc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class StudentDbUtil {
	private DataSource dataSource;
	
	public StudentDbUtil(DataSource ds) {
		dataSource = ds;
	}
	
	public List<Student> getStudents() throws Exception {
		List<Student> students = new ArrayList<>();
		
		Connection myCn = null;
		Statement myStmnt = null;
		ResultSet myRs = null;
		
		try {
			myCn = dataSource.getConnection();
			String sql = "select * from student order by last_name";
			myStmnt = myCn.createStatement();

			myRs = myStmnt.executeQuery(sql);
			
			while (myRs.next()) {
				int id = myRs.getInt("id");
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String email = myRs.getString("email");
				String course = myRs.getString("course");
				int age = myRs.getInt("age");
				
				Student tempStudent = new Student(id, firstName, lastName, email, age, course);
				
				students.add(tempStudent);
			}
			
			return students;
		}
		finally {
			close(myCn, myStmnt, myRs);
		}
	}

	private void close(Connection myCn, Statement myStmnt, ResultSet myRs) {
		// TODO Auto-generated method stub
		try {
			if (myCn != null) {
				myCn.close();
			}
			
			if (myStmnt != null) {
				myStmnt.close();
			}
			
			if (myRs != null) {
				myRs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addStudent(Student student) throws Exception {
		// TODO Auto-generated method stub
		Connection cn = null;
		PreparedStatement preparedStatement = null;
		
		try {
			cn = dataSource.getConnection();
			
			String sql = "insert into student "
						+ "(first_name, last_name, email, age, course)"
						+ "values(?, ?, ?, ?, ?)";
	
			
			preparedStatement = cn.prepareStatement(sql);
			
			preparedStatement.setString(1, student.getFirstName());
			preparedStatement.setString(2, student.getLastName());
			preparedStatement.setString(3, student.getEmail());
			preparedStatement.setInt(4, student.getAge());
			preparedStatement.setString(5, student.getCourse());
			
			preparedStatement.executeUpdate();
		}
		finally {
			close(cn, preparedStatement, null);
		}
	}

	public Student getStudent(String studId) throws Exception {
		// TODO Auto-generated method stub
		Student stud = null;
		
		Connection myCn = null;
		PreparedStatement pStatement = null;
		ResultSet myRs = null;
		
		int studentId;
		
		try {
			studentId = Integer.parseInt(studId);
			
			myCn = dataSource.getConnection();
			
			String sql = "select * from student where id=?";
			
			pStatement = myCn.prepareStatement(sql);
			pStatement.setInt(1, studentId);
			
			myRs = pStatement.executeQuery();
			
			if (myRs.next()) {
				String tempFName = myRs.getString("first_name");
				String tempLName = myRs.getString("last_name");
				String tempEmail = myRs.getString("email");
				int tempAge = myRs.getInt("age");
				String tempCourse = myRs.getString("course");
				
				stud = new Student(studentId, tempFName, tempLName, tempEmail, tempAge, tempCourse);
			} else {
				throw new Exception("Could not find student id " + studentId);
			}
			
			return stud;
		}
		finally {
			close(myCn, pStatement, myRs);
		}
	}

	public void updateStudent(Student updatedStudent) throws Exception {
		Connection myCn = null;
		Statement myStmnt = null;
		
		try {
			myCn = dataSource.getConnection();
			String sql = "update student "
						+ "set first_name=?, last_Name=?, email=?, age=?, course=? "
						+ "where id=?";
			PreparedStatement pStatement = myCn.prepareStatement(sql);
			
			pStatement.setString(1, updatedStudent.getFirstName());
			pStatement.setString(2, updatedStudent.getLastName());
			pStatement.setString(3, updatedStudent.getEmail());
			pStatement.setInt(4, updatedStudent.getAge());
			pStatement.setString(5, updatedStudent.getCourse());
			pStatement.setInt(6, updatedStudent.getId());
			
			pStatement.executeUpdate();
		} finally {
			close(myCn, myStmnt, null);
		}
		
	}

	public void deleteStudent(int id) throws Exception {
		// TODO Auto-generated method stub
		Connection myCn = null;
		PreparedStatement myStmnt = null;
		
		try {
			myCn = dataSource.getConnection();
			String sql = "delete from student where id=?";
			myStmnt= myCn.prepareStatement(sql);
			myStmnt.setInt(1, id);
			
			myStmnt.execute();
		} finally {
			close(myCn, myStmnt, null);
		}
	}

	public List<Student> searchStudents(String searchTerm) throws Exception {
		// TODO Auto-generated method stub
		List<Student> students = new ArrayList<>();
		
		Connection myCn = null;
		PreparedStatement pStmnt = null;
		ResultSet myRs = null;
		
		try {
			myCn = dataSource.getConnection();
			
			if (searchTerm != null && searchTerm.trim().length() > 0) {
				String sql = "SELECT * FROM student "
						+ "WHERE first_name LIKE ? OR "
						+ "last_name LIKE ? OR "
						+ "email LIKE ? OR "
						+ "age = ? OR "
						+ "course LIKE ?";
				pStmnt = myCn.prepareStatement(sql);
				String searchTermLike = "%" + searchTerm + "%";
				pStmnt.setString(1, searchTermLike);
				pStmnt.setString(2, searchTermLike);
				pStmnt.setString(3, searchTermLike);
				pStmnt.setString(4, searchTerm);
				pStmnt.setString(5, searchTermLike);
				
			} else {
				String sql = "SELECT * FROM student";
				pStmnt = myCn.prepareStatement(sql);
			}
			
			myRs = pStmnt.executeQuery();
            
            // retrieve data from result set row
            while (myRs.next()) {
                
                // retrieve data from result set row
                int id = myRs.getInt("id");
                String firstName = myRs.getString("first_name");
                String lastName = myRs.getString("last_name");
                String email = myRs.getString("email");
                int age = myRs.getInt("age");
                String course = myRs.getString("course");
                
                // create new student object
                Student tStudent = new Student(id, firstName, lastName, email, age, course);
                
                // add it to the list of students
                students.add(tStudent);            
            }
            
            return students;
        } finally {
            // clean up JDBC objects
            close(myCn, pStmnt, myRs);
        } 
	}
}
