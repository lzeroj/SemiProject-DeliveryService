package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.MemberDAO;
import org.kosta.semiproject.model.MemberVO;

public class LoginController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		MemberVO vo = MemberDAO.getInstance().login(user_id, password);	
		String path = null;
		if (vo == null) {
			path = "redirect:login-fail.jsp";
		} else {
			path = "redirect:index.jsp";
			HttpSession session = request.getSession();
			session.setAttribute("member", vo);
		}
		return path;
	}

}
