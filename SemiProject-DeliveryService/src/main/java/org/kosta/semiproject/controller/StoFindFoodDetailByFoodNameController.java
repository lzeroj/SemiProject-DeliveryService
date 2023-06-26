package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.FoodDAO;
import org.kosta.semiproject.model.FoodVO;

public class StoFindFoodDetailByFoodNameController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session.getAttribute("member")==null) {
			return "login-chk-fail.jsp";
		}
		
		String foodname = request.getParameter("foodname");
		FoodVO fvo = FoodDAO.getInstance().findFoodDetailByFoodName(foodname);
		request.setAttribute("foodinfo", fvo);
		return "single-product.jsp";
	}
}
