package org.kosta.semiproject.test.order.v1;

import java.sql.SQLException;
import java.util.ArrayList;

import org.kosta.semiproject.model.OrderDAO;
import org.kosta.semiproject.model.OrderVO;

public class TestUnitMyOrderList {

	public static void main(String[] args) {
		String userId = "shj22k";
		int orderNo = 42;
		try {
			ArrayList<OrderVO> list = OrderDAO.getInstance().myOrderList(userId,orderNo);
			for(OrderVO ovo : list) {
				System.out.println(ovo.toString());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
