package org.kosta.semiproject.test.cart;

import java.sql.SQLException;
import java.util.ArrayList;

import org.kosta.semiproject.model.CartDAO;
import org.kosta.semiproject.model.CartVO;

public class TestCartFindByUserIdByFoodName {
	public static void main(String[] args) {
		ArrayList<CartVO> list = new ArrayList<>();
		try {
			list = CartDAO.getInstance().findByIdByFoodName();
			for (CartVO cartVO : list) {
			    System.out.println(cartVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
