package com.entity;

public class Faq_Details {
	private int id;
	public String question;
	private String answer;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Faq_Details() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Faq_Details( String question, String answer) {
		super();
		this.question = question;
		this.answer = answer;
	}
	
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "Faq_Details [question=" + question + ", answer=" + answer + "]";
	}
	
	
}
