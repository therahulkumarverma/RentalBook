package com.entity;

public class Category_Details {
	private int category_id;
	private String categoryname;
	public Category_Details(int category_id, String categoryname) {
		super();
		this.category_id = category_id;
		this.categoryname = categoryname;
	}
	public Category_Details() {
		// TODO Auto-generated constructor stub
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	

}
