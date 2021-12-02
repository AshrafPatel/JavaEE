package com.ashraf.web.jbdc;

public class Student {
	private int id;
	private String lastName;
	private String firstName;
	private String email;
	private String course;
	private int age;
	
	
	public Student(String lastName, String firstName, String email, String course, int age) {
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.course = course;
		this.age = age;
	}

	public Student(int id, String lastName, String firstName, String email, String course, int age) {
		super();
		this.id = id;
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.course = course;
		this.age = age;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	
	@Override
	public String toString() {
		return "Student [id=" + id + ", lastName=" + lastName + ", firstName=" + firstName + ", email=" + email
				+ ", course=" + course + ", age=" + age + "]";
	}	
}
