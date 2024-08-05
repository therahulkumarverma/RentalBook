//cartDao.java
package com.DAO;

import java.util.List;

import com.entity.Cart_Details;

public interface CartDAO {
	public boolean addcart(Cart_Details c);
	public List<Cart_Details>getbookDetailsById(int uid);
	public boolean deleteFromCart(int uid, int cid);


}
