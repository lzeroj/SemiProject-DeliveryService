package org.kosta.semiproject.test.store.v1;

import java.sql.SQLException;

import org.kosta.semiproject.model.StoreDAO;
import org.kosta.semiproject.model.StoreVO;

public class TestUnitFindStoreDetailByStoreName {

	public static void main(String[] args) {
		try {
			StoreVO svo = StoreDAO.getInstance().findStoreDetailByStoreNumber(1);
			System.out.println(svo.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
