//faqDAO.java
package com.DAO;

import java.util.List;

import com.entity.Book_Details;
import com.entity.Faq_Details;

public interface FaqDAO {
	public boolean addQuestion(Faq_Details f);
	public List<Faq_Details> getAllFaq();
	public boolean deleteQuestion(int id);
	



}
