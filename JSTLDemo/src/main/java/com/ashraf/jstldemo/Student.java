package com.ashraf.jstldemo;

public class Student {
	private String firstName;
	private String lastName;
	private boolean vipStudent;
	
	public Student(String firstName, String lastName, boolean vipStudent) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.vipStudent = vipStudent;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public boolean isVipStudent() {
		return vipStudent;
	}

	public void setVipStudent(boolean vipStudent) {
		this.vipStudent = vipStudent;
	}
	
	
}
