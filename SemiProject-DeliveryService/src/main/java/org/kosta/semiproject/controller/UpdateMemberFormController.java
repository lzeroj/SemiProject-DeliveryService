package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateMemberFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("member") == null) {
			System.out.println("**로그인이 필요합니다**");
			return "redirect:index.jsp";
		} else {
			return "redirect:member/update-form.jsp";
		}
	}
}
