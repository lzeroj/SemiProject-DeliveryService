package org.kosta.semiproject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.MemberDAO;
import org.kosta.semiproject.model.MemberVO;

public class LoginController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equals("POST") == false)
			throw new ServletException("POST METHOD 방식만 로그인 가능");
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		String user_state = request.getParameter("user_state");
		String userBirthday = request.getParameter("userbirth");
		MemberVO vo = MemberDAO.getInstance().login(user_id, password, user_state);	
		String path = null;
		System.out.println(vo);
		if (vo == null) {
			path = "redirect:login-fail.jsp";
		} else {
			path = "redirect:index.jsp";
			HttpSession session = request.getSession();
			session.setAttribute("member", userBirthday);
			session.setAttribute("member", vo);
		}
		return path;
	}

}
