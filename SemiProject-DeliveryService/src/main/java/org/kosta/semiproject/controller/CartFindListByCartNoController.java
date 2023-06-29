package org.kosta.semiproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.CartDAO;
import org.kosta.semiproject.model.CartVO;
import org.kosta.semiproject.model.MemberVO;

public class CartFindListByCartNoController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("member") == null) {
			System.out.println("**비인증 상태이므로 서비스 할 수 없습니다.**");
			return "redirect:login-chk-fail.jsp";
		}
		
		String address = (String) session.getAttribute("address");
		System.out.println("sessionaddress: "+address);
//		if(session.getAttribute("address")==null) {
//			String address = request.getParameter("address");
//			System.out.println("address: "+address);
//			session.setAttribute("address", address);
//		}
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String userId = memberVO.getUserId();
		//System.out.println(userId);
		ArrayList<CartVO> list = new ArrayList<>();
		list = CartDAO.getInstance().findByIdByFoodName(userId);
		request.setAttribute("cartList", list);
		return "cart.jsp";
	}

}
