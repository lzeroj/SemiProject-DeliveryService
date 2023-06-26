package org.kosta.semiproject.test.order.v1;

import java.sql.SQLException;

import org.kosta.semiproject.model.MemberVO;
import org.kosta.semiproject.model.OrderDAO;
import org.kosta.semiproject.model.OrderVO;

public class TestOrder {
	public static void main(String[] args) {
		try {
			int totalPrice = 20000;
			String location = "목동역";
			String userid = "test1";
			
			OrderVO ovo = new OrderVO();
			ovo.setTotalPrice(totalPrice);
			
			MemberVO mvo = new MemberVO();
			mvo.setUserId(userid);
			ovo.setMemberVO(mvo);
			
			OrderDAO.getInstance().order(ovo, location);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
