package org.kosta.semiproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.kosta.semiproject.model.StoreDAO;
import org.kosta.semiproject.model.StoreVO;

public class StoFindStoreListByCategoryAjaxController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String category = request.getParameter("filter");
		ArrayList<StoreVO> list = StoreDAO.getInstance().findStoreListByCategory(category);
		JSONArray json = new JSONArray(list);
		System.out.println(json.toString());
		request.setAttribute("responsebody", json);
		return "AjaxView";
	}

}
