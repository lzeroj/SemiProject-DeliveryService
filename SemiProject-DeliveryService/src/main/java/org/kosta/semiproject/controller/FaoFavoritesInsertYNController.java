package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.semiproject.model.FavoritesDAO;
import org.kosta.semiproject.model.FavoritesVO;

public class FaoFavoritesInsertYNController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int storeNumber = Integer.parseInt(request.getParameter("storeNumber"));
		String userid = request.getParameter("userid");
		FavoritesDAO.getInstance().favoritesInsertYN(storeNumber, userid);
		FavoritesVO fvo = FavoritesDAO.getInstance().favoritesChecker(storeNumber, userid);
		boolean heartchk = false;
		if(fvo.getFavorites().equals("Y")) {
			System.out.println("fvo.getFavorites(): "+fvo.getFavorites());
			heartchk = true;
		}
		request.setAttribute("responsebody", heartchk);
		return "AjaxView";
	}

}
