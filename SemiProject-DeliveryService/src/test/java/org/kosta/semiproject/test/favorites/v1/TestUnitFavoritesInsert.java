package org.kosta.semiproject.test.favorites.v1;

import java.sql.SQLException;

import org.kosta.semiproject.model.FavoritesDAO;

public class TestUnitFavoritesInsert {

	public static void main(String[] args) {
		int storeNumber = 1;
		String userid = "test3";
		try {
			FavoritesDAO.getInstance().favoritesInsertYN(storeNumber, userid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
