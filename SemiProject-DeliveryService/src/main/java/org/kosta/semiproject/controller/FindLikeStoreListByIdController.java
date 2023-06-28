package org.kosta.semiproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.MemberDAO;
import org.kosta.semiproject.model.MemberVO;
import org.kosta.semiproject.model.StoreVO;

public class FindLikeStoreListByIdController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session.getAttribute("member") == null || session == null) {
			return "redirect:login-chk-fail.jsp";
		}
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		ArrayList<StoreVO> list = MemberDAO.getInstance().findLikeStoreListById(mvo.getUserId());
		request.setAttribute("list", list);
		
		return "likelist.jsp";
	}

}
