package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.semiproject.model.CartDAO;

public class CartDeleteFoodMenuByIdAndByFoodNameController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id = request.getParameter("user_id");
		String food_name = request.getParameter("food_name");
		CartDAO.getInstance().deleteCartMenu(user_id,food_name);
		return "redirect:CartFindListByIdAndFoodName.do";
	}

}
