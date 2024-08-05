package com.entity;
import java.util.*;
public class Book_Details {

	private int book_id;
	private String category;
	private String name;
	private String image;
	private String author;
	private String publication;
	private int price;
	private String publication_year;
	private String pages;
	private String isbn;
	public String status;
	public String  seller;
	public Book_Details() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Book_Details(String category, String name, String image, String author, String publication, int price,
		String publication_year, String pages, String isbn,String status,String seller) {
		super();
		this.category = category;
		this.name = name;
		this.image = image;
		this.author = author;
		this.publication = publication;
		this.price = price;
		this.publication_year = publication_year;
		this.pages = pages;
		this.isbn = isbn;
		this.status=status;
		this.seller=seller;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublication() {
		return publication;
	}
	public void setPublication(String publication) {
		this.publication = publication;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPublication_year() {
		return publication_year;
	}
	public void setPublication_year(String publication_year) {
		this.publication_year = publication_year;
	}
	public String getPages() {
		return pages;
	}
	public void setPages(String pages) {
		this.pages = pages;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	

	
}
