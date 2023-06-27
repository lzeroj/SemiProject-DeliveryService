package org.kosta.semiproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.MemberVO;
import org.kosta.semiproject.model.OrderDAO;
import org.kosta.semiproject.model.OrderVO;

public class MyOrderListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:login-chk-fail.jsp";
		}
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		ArrayList<OrderVO> list = OrderDAO.getInstance().myOrderList(mvo.getUserId());
		request.setAttribute("list", list);
		
		return "mypage2.jsp";
	}

}
