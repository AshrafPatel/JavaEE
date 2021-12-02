package com.ashraf.mvc;

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {
	
	public static List<Student> getStudents() {
		List<Student> students = new ArrayList<>();
		
		students.add(new Student("Ashraf", "Patel", 29, "25/06/1992"));
		students.add(new Student("Ali", "Aidaruse", 23, "16/01/1998"));
		students.add(new Student("Mark", "Frando", 20, "13/07/2001"));
		
		return students;
		
	}
	
}
