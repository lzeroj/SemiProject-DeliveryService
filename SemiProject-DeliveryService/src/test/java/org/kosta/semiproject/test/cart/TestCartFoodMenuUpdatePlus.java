package org.kosta.semiproject.test.cart;

import java.sql.SQLException;

import org.kosta.semiproject.model.CartDAO;

public class TestCartFoodMenuUpdatePlus {
	public static void main(String[] args) {
		String id = "test1";
		String menu = "순대국";
		try {
			CartDAO.getInstance().updateCartMenuPlus(id,menu);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
