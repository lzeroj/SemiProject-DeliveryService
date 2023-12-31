package org.kosta.semiproject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.ReviewDAO;

public class ReviewUpdatePostFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equals("POST") == false)
			throw new ServletException("POST 방식만 서비스 됩니다");

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("member") == null) {
			System.out.println("**비인증 상태이므로 서비스 할 수 없습니다**");
			return "redirect:login.jsp";
		}
		int review_No = Integer.parseInt(request.getParameter("reviewNo"));
		String storeName = request.getParameter("storeName");
		request.setAttribute("review", ReviewDAO.getInstance().findReviewPostByNo(review_No));
		request.setAttribute("storeName", storeName);
		System.out.println(storeName);
		request.setAttribute("updateUrl", "updateWrite.jsp");
		return "updateWrite-layout.jsp";
	}

}
