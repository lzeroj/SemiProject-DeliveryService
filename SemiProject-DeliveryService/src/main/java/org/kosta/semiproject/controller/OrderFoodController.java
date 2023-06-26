package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.FoodVO;
import org.kosta.semiproject.model.MemberVO;
import org.kosta.semiproject.model.OrderDAO;
import org.kosta.semiproject.model.OrderVO;

public class OrderFoodController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String address = (String) session.getAttribute("address");
		
		int foodprice = 5000;
		String foodname = "순대국";
		
		OrderVO ovo = new OrderVO();
//		ovo.setFoodPrice(foodprice);
		
		MemberVO mvo = new MemberVO();
		mvo.setUserId(memberVO.getUserId());
		ovo.setMemberVO(mvo);
		
		FoodVO fvo = new FoodVO();
		fvo.setFoodName(foodname);
//		ovo.setFoodVO(fvo);
		
		OrderDAO.getInstance().order(ovo, address);

		
		return "";
	}
}
