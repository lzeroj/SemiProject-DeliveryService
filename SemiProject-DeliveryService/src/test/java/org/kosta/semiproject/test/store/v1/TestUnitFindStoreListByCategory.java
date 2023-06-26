package org.kosta.semiproject.test.store.v1;

import java.sql.SQLException;
import java.util.ArrayList;

import org.kosta.semiproject.model.StoreDAO;
import org.kosta.semiproject.model.StoreVO;

public class TestUnitFindStoreListByCategory {

	public static void main(String[] args) {
		try {
			ArrayList<StoreVO> list = StoreDAO.getInstance().findStoreListByCategory("한식");
			for(StoreVO svo : list) {
				System.out.println(svo.toString());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
