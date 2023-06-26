package org.kosta.semiproject.test.order.v1;

import java.sql.SQLException;

import org.kosta.semiproject.model.FoodVO;
import org.kosta.semiproject.model.MemberVO;
import org.kosta.semiproject.model.OrderDAO;
import org.kosta.semiproject.model.OrderVO;

public class TestOrder {
	public static void main(String[] args) {
		try {
			OrderVO orderVO = new OrderVO();
			orderVO.setFoodPrice(6000);
			orderVO.setOrderSuccess("Y");
			orderVO.setOrderDate("2023-06-26");
			MemberVO memberVO = new MemberVO();
			memberVO.setUserId("test1");
			orderVO.setMemberVO(memberVO);
			FoodVO foodVO = new FoodVO();
			foodVO.setFoodName("");
			orderVO.setFoodVO(foodVO);

			OrderDAO.getInstance().order(orderVO);
			System.out.println("주문이 완료되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
