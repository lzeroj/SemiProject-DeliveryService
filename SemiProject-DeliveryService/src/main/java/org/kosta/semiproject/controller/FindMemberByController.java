package org.kosta.semiproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.MemberDAO;
import org.kosta.semiproject.model.MemberVO;
import org.kosta.semiproject.model.OrderDAO;
import org.kosta.semiproject.model.OrderVO;

public class FindMemberByController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id = request.getParameter("user_id");
		MemberVO vo = MemberDAO.getInstance().findMember(user_id);
		System.out.println("user_id:"+user_id);
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("member") == null) {
			return "redirect:login-chk-fail.jsp";
		}
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		System.out.println("user_id:"+mvo.getUserId());
		
		String userid = mvo.getUserId();
		ArrayList<OrderVO> list = OrderDAO.getInstance().myOrderList(userid);
		request.setAttribute("list", list);
		request.setAttribute("user_id", vo);
		return "mypage2.jsp";
	}
}
