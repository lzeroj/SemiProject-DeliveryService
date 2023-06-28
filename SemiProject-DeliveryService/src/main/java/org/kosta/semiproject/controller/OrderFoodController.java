package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.CartDAO;
import org.kosta.semiproject.model.MemberVO;
import org.kosta.semiproject.model.OrderDAO;
import org.kosta.semiproject.model.OrderVO;

public class OrderFoodController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = null;
		
		//로그인 여부확인 
		HttpSession session = request.getSession(false);
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO==null) {
			path = "redirect:login.jsp";
		}

		String address = (String) session.getAttribute("address");
		System.out.println("address:"+address);
		int totalSum = Integer.parseInt(request.getParameter("totalSum"));
		System.out.println("totalSum:"+totalSum);
		
		OrderVO ovo = new OrderVO();
		ovo.setTotalPrice(totalSum);
		
		MemberVO mvo = new MemberVO();
		mvo.setUserId(memberVO.getUserId());
		ovo.setMemberVO(mvo);
		
		//주문금액이 0원이거나 , 주소가 기입되지 않았으면
		if(totalSum==0 || address==null) {
			System.out.println("totalSum: "+totalSum);
			System.out.println("address: "+address);
			path = "redirect:order-fail.jsp";
		}else {
			int result = OrderDAO.getInstance().order(ovo, address);
			System.out.println("result: "+result);
			if(result == 1) {
				CartDAO.getInstance().orderCartMenu(memberVO.getUserId());
				path = "redirect:order-complete.jsp";
			}else {
				path = "redirect:order-fail.jsp";
			}
		}
		return path;
	}
}
