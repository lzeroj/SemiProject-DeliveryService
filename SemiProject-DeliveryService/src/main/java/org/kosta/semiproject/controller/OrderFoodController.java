package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.MemberVO;
import org.kosta.semiproject.model.OrderDAO;
import org.kosta.semiproject.model.OrderVO;

public class OrderFoodController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String address = (String) session.getAttribute("address");
		
		int totalSum = Integer.parseInt(request.getParameter("totalSum"));
		
		OrderVO ovo = new OrderVO();
		ovo.setTotalPrice(totalSum);
		
		MemberVO mvo = new MemberVO();
		mvo.setUserId(memberVO.getUserId());
		ovo.setMemberVO(mvo);
		
		OrderDAO.getInstance().order(ovo, address);
		
		return "redirect:orderComplete.jsp";
	}
}
