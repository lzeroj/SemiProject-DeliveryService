package org.kosta.semiproject.controller;

import java.util.ArrayList;

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
		String address = (String) session.getAttribute("address");
		System.out.println("주소 : "+address);
		
		if (session == null || session.getAttribute("member") == null) {
			System.out.println("**비인증 상태이므로 서비스 할 수 없습니다.**");
			String nullSession = "nullSession";
			request.setAttribute("responsebody", nullSession);
		}else {
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			String userId = memberVO.getUserId();
			String foodName = request.getParameter("foodname");
			String quantity1 = request.getParameter("quantity");
			System.out.println("foodName: "+foodName);
			System.out.println("quantity1: "+quantity1);
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			System.out.println("quantity:"+quantity);
			int insertresult = CartDAO.getInstance().insertCart(userId,foodName,quantity);
			String result = "ok";			
			request.setAttribute("responsebody", result);
		}	
		return "AjaxView";
	}

}
