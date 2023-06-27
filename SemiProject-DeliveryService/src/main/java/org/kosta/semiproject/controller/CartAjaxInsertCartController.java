package org.kosta.semiproject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.CartDAO;
import org.kosta.semiproject.model.MemberVO;

public class CartAjaxInsertCartController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("POST")==false)
			throw new ServletException("POST 방식만 서비스 됩니다");
		
		HttpSession session = request.getSession(false);		
		if (session == null || session.getAttribute("member") == null) {
			System.out.println("**비인증 상태이므로 서비스 할 수 없습니다.**");
			String nullSession = "nullSession";
			request.setAttribute("responsebody", nullSession);
		}else {
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			String userId = memberVO.getUserId();
			String foodName = request.getParameter("foodname");
			//int checkId = CartDAO.getInstance().checkCartMenu(userId,foodName);
			//if(checkId==1) {				
			//}else {
				CartDAO.getInstance().insertCart(userId,foodName);
				String result = "ok";			
			//}	
			request.setAttribute("responsebody", result);
		}	
		return "AjaxView";
	}

}
