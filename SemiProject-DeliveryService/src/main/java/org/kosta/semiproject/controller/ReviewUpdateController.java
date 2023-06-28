package org.kosta.semiproject.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.ReviewDAO;
import org.kosta.semiproject.model.ReviewVO;

public class ReviewUpdateController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("member") == null) {
			System.out.println("**비인증 상태이므로 서비스 할 수 없습니다**");
			return "redirect:login.jsp";
		}
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		String reviewContent = request.getParameter("content");
		ReviewVO review = new ReviewVO();
		review.setReviewNo(reviewNo);
		review.setReviewContent(reviewContent);
		int storeNumber = Integer.parseInt(request.getParameter("storeNumber"));
		String storeName = URLEncoder.encode(request.getParameter("storeName"), "utf-8");
		ReviewDAO.getInstance().updateReviewpost(review);
		return "redirect:ReviewListByStoreNumber.do?storeName=" + storeName + "&storeNumber=" + storeNumber;
	}
}
