package org.kosta.semiproject.test.order.v1;

import java.sql.SQLException;

import org.kosta.semiproject.model.OrderDAO;

public class TestUnitOrderDetail {

	public static void main(String[] args) {
		try {
			OrderDAO.getInstance().orderDetail(37, 94);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
