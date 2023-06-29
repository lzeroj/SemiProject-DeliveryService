package org.kosta.semiproject.test.cart;

import java.sql.SQLException;

import org.kosta.semiproject.model.CartDAO;
import org.kosta.semiproject.model.CartVO;

public class TestUnitInsertCart {

	public static void main(String[] args) {
		String userId = "test1";
		String foodName = "비빔밥";
		int quantity = 1;
		try {
			CartVO cvo = CartDAO.getInstance().checkFoodMenuByIdAndFood(userId, foodName);
			System.out.println(cvo.toString());
			CartDAO.getInstance().insertCart(userId,foodName,quantity);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
