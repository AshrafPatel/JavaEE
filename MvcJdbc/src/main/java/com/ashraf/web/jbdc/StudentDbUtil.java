package com.ashraf.web.jbdc;

import java.sql.Connection;
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
				
				Student tempStudent = new Student(id, firstName, lastName, email, course, age);
				
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
}
