package org.kosta.semiproject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.CartDAO;

public class CartAjaxInsertFoodController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("POST")==false)
			throw new ServletException("POST 방식만 서비스 됩니다");
		
		HttpSession session = request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null) {
			System.out.println("**비인증 상태이므로 서비스 할 수 없습니다.**");
			return "redirect:FindPostList.do";
		}
		String user_id = (String) session.getAttribute("id");
		String food_name = request.getParameter("foodname");
		CartDAO.getInstance().insertCart(user_id,food_name);
		return "AjaxView";
	}

}
