package com.entity;

public class User {
	private int id;
	private String full_name;
	private String email;
	private String password;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(String full_name, String email, String password) {
		super();
		this.full_name = full_name;
		this.email = email;
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return full_name;
	}
	public void setFullname(String full_name) {
		this.full_name = full_name;
	}
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	

}
