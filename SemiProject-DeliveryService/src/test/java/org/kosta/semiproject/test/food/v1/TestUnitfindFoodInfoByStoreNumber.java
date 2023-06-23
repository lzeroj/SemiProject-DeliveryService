package org.kosta.semiproject.test.food.v1;

import java.sql.SQLException;
import java.util.ArrayList;

import org.kosta.semiproject.model.FoodDAO;
import org.kosta.semiproject.model.FoodVO;

public class TestUnitfindFoodInfoByStoreNumber {

	public static void main(String[] args) {
		try {
			ArrayList<FoodVO> list = FoodDAO.getInstance().findFoodInfoByStoreNumber(1);
			for(FoodVO fvo : list) {
				System.out.println(fvo.toString());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
