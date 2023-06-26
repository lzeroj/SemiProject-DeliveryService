package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.semiproject.model.MemberDAO;
import org.kosta.semiproject.model.MemberVO;

public class FindMemberByController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id = request.getParameter("user_id");
		MemberVO vo = MemberDAO.getInstance().findMember(user_id);
		request.setAttribute("user_id", vo);
		return "mypage/mypage.jsp";
	}

}
