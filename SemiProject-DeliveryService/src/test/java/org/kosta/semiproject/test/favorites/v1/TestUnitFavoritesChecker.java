package org.kosta.semiproject.test.favorites.v1;

import java.sql.SQLException;

import org.kosta.semiproject.model.FavoritesDAO;
import org.kosta.semiproject.model.FavoritesVO;

public class TestUnitFavoritesChecker {

	public static void main(String[] args) {
		int storeNumber = 3;
		String userid = "test3";
		try {
			FavoritesVO fvo = FavoritesDAO.getInstance().favoritesChecker(storeNumber,userid);
			System.out.println(fvo.toString());
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
