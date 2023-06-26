package org.kosta.semiproject.test.food.v1;

import java.sql.SQLException;

import org.kosta.semiproject.model.FoodDAO;
import org.kosta.semiproject.model.FoodVO;

public class TestUnitFindFoodDetailByFoodName {

	public static void main(String[] args) {
		try {
			FoodVO fvo = FoodDAO.getInstance().findFoodDetailByFoodName("볶음밥");
			System.out.println(fvo.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
