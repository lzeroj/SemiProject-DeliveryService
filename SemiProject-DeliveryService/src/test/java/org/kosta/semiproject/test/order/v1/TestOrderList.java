package org.kosta.semiproject.test.order.v1;

import java.sql.SQLException;
import java.util.ArrayList;

import org.kosta.semiproject.model.OrderDAO;
import org.kosta.semiproject.model.OrderVO;

public class TestOrderList {
	public static void main(String[] args) {
		try {
			String user_id = "kim12";
			ArrayList<OrderVO> orderList = OrderDAO.getInstance().OrderList(user_id);
			for (OrderVO order : orderList) {
				System.out.println(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
