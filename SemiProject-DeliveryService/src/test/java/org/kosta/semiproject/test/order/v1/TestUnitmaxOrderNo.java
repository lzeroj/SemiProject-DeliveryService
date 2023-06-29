package org.kosta.semiproject.test.order.v1;

import java.sql.SQLException;

import org.kosta.semiproject.model.OrderDAO;

public class TestUnitmaxOrderNo {

	public static void main(String[] args) {
		try {
			int result = OrderDAO.getInstance().maxOrderNo();
			System.out.println(result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
