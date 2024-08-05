package com.entity;

public class Message_Details {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String name;
	private String email;
	private String message;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Message_Details() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Message_Details [id=" + id + ", name=" + name + ", email=" + email + ", message=" + message + "]";
	}
	

}
