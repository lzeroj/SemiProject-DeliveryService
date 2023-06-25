package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.semiproject.model.FoodDAO;
import org.kosta.semiproject.model.FoodVO;

public class StoFindFoodDetailByFoodNameController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String foodname = request.getParameter("foodname");
		FoodVO fvo = FoodDAO.getInstance().findFoodDetailByFoodName(foodname);
		request.setAttribute("foodinfo", fvo);

		return "single-product.jsp";
	}
}
