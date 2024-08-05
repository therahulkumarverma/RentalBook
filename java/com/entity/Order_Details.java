package com.entity;

public class Order_Details {
	private int oid;
	private int uid;
	private int total;
	private String cardnumber;
	private String expairy;
	private String cvv;
	private String cardholdername;
	
	public Order_Details() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getCardnumber() {
		return cardnumber;
	}
	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}
	public String getExpairy() {
		return expairy;
	}
	public void setExpairy(String expairy) {
		this.expairy = expairy;
	}
	public String getCvv() {
		return cvv;
	}
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}
	public String getCardholdername() {
		return cardholdername;
	}
	public void setCardholdername(String cardholdername) {
		this.cardholdername = cardholdername;
	}
	
	
	
	
	

}
