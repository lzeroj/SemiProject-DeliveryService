package org.kosta.semiproject.test.cart;

import java.sql.SQLException;
import java.util.ArrayList;

import org.kosta.semiproject.model.CartDAO;

public class TestUnitfindCartNoByIsOrderAndId {

	public static void main(String[] args) {
		try {
			ArrayList<Integer> list = CartDAO.getInstance().findCartNoByIsOrderAndId("shj22k");
			for(int i=0; i<list.size(); i++) {
				System.out.println(list.get(i));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
