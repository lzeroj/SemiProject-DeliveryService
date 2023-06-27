package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReviewWritePostFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session=request.getSession(false);
		if (session == null || session.getAttribute("member") == null) {
			System.out.println("**비인증 상태이므로 서비스 할 수 없습니다**");
			return "redirect:login.jsp";
		}
		
		String storeName = request.getParameter("storeName");
		int storeNumber = Integer.parseInt(request.getParameter("storeNumber"));
		request.setAttribute("storeName", storeName);
		request.setAttribute("storeNumber", storeNumber);
		request.setAttribute("url", "review-Write.jsp");
		return "review-layout.jsp";
	}

}
