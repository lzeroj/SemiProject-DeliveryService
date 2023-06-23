package org.kosta.semiproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.semiproject.model.CartDAO;
import org.kosta.semiproject.model.CartVO;

public class FindCartListByIdAndFoodNameController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ArrayList<CartVO> list = new ArrayList<>();
			list = CartDAO.getInstance().findByIdByFoodName();
			request.setAttribute("cartList", list);
		return "cart.jsp";
	}
	
}
