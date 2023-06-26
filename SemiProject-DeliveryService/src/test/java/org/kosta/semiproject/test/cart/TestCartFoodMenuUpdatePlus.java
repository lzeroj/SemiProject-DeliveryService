package org.kosta.semiproject.test.cart;

import java.sql.SQLException;

import org.kosta.semiproject.model.CartDAO;

public class TestCartFoodMenuUpdatePlus {
	public static void main(String[] args) {
		try {
			CartDAO.getInstance().updateCartMenuPlus(0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
