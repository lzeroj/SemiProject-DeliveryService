package org.kosta.semiproject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.semiproject.model.CartDAO;

public class CartAjaxFoodMenuUpdateMinusController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("POST")==false)
			throw new ServletException("POST 방식만 서비스 됩니다");
			
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));		
		int quantity = CartDAO.getInstance().updateCartMenuMinus(cartNo);
		request.setAttribute("responsebody", quantity);
		return "AjaxView";
	}
}
