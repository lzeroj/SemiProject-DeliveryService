package org.kosta.semiproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.StoreDAO;
import org.kosta.semiproject.model.StoreVO;

public class StoFindStoreListAllController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String category = request.getParameter("category");
		String address = request.getParameter("address");
		ArrayList<StoreVO> list = StoreDAO.getInstance().findStoreListAll();
		HttpSession session = request.getSession();
		session.setAttribute("address", address);
		System.out.println(session.getAttribute("address"));
		request.setAttribute("stolist", list);
		request.setAttribute("category", category);
		return "shop.jsp";
	}

}
