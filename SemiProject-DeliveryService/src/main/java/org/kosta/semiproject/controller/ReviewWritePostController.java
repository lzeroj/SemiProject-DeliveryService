package org.kosta.semiproject.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.MemberVO;
import org.kosta.semiproject.model.ReviewDAO;
import org.kosta.semiproject.model.ReviewVO;
import org.kosta.semiproject.model.StoreDAO;
import org.kosta.semiproject.model.StoreVO;

public class ReviewWritePostController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("POST")==false)
			throw new ServletException("POST 방식만 서비스 됩니다");
		
		HttpSession session = request.getSession(false);
		if(session==null||session.getAttribute("member")==null) {
			System.out.println("**비인증 상태이므로 서비스 할 수 없습니다.**");
			return "redirect:index.jsp";
		}
		
		System.out.println(session.getAttribute("storeName"));
		String reviewContent = request.getParameter("content");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		ReviewVO reviewVO = new ReviewVO();
		/* StoreVO storeVO = StoreDAO.getInstance(). */
/*		reviewVO.setReviewContent(reviewContent);
		reviewVO.setMemberVO(memberVO);
		ReviewDAO.getInstance().writeReview(reviewContent);*/
		return "redirect:ReviewListByStoreName.do";
	}

}
