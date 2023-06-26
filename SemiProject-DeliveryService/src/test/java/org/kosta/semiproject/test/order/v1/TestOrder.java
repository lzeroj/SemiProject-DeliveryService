package org.kosta.semiproject.test.order.v1;

import java.sql.SQLException;

import org.kosta.semiproject.model.FoodVO;
import org.kosta.semiproject.model.MemberVO;
import org.kosta.semiproject.model.OrderDAO;
import org.kosta.semiproject.model.OrderVO;

public class TestOrder {
	public static void main(String[] args) {
		try {
			int foodprice = 5000;
			String location = "목동역";
			String userid = "test1";
			String foodname = "순대국";
			
			OrderVO ovo = new OrderVO();
//			ovo.setFoodPrice(foodprice);
			
			MemberVO mvo = new MemberVO();
			mvo.setUserId(userid);
			ovo.setMemberVO(mvo);
			
			FoodVO fvo = new FoodVO();
			fvo.setFoodName(foodname);
//			ovo.setFoodVO(fvo);
			
			OrderDAO.getInstance().order(ovo, location);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
