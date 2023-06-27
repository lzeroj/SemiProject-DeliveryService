package org.kosta.semiproject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.ReviewDAO;

public class ReviewDeleteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("POST")==false)
			throw new ServletException("POST 방식만 서비스 됩니다");
		
		HttpSession session = request.getSession(false);
		if(session==null||session.getAttribute("member")==null) {
			System.out.println("**비인증 상태이므로 서비스 할 수 없습니다.**");
			return "redirect:index.jsp";
		}
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		ReviewDAO.getInstance().deleteReview(reviewNo);
		
		request.getParameter("storeNumber");		
		request.getParameter("storeName");
		// 필요 없음 삭제 예정
		//request.setAttribute("storeNamed", storeName);
		//request.setAttribute("storeNumber", storeNumber);	 
		
		return "ReviewListByStoreNumber.do";
	}

}
