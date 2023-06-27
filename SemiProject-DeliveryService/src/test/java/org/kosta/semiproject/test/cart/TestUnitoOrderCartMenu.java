package org.kosta.semiproject.test.cart;

import java.sql.SQLException;

import org.kosta.semiproject.model.CartDAO;

public class TestUnitoOrderCartMenu {

	public static void main(String[] args) {
		String userId = "test1";
		try {
			CartDAO.getInstance().orderCartMenu(userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
