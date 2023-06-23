package org.kosta.semiproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.semiproject.model.StoreDAO;
import org.kosta.semiproject.model.StoreVO;

public class StoFindStoreListAllController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String category = request.getParameter("category");
		ArrayList<StoreVO> list = StoreDAO.getInstance().findStoreListAll();
		request.setAttribute("stolist", list);
		request.setAttribute("category", category);
		return "shop.jsp";
	}

}
