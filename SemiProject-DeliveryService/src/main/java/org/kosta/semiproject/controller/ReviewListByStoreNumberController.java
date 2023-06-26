package org.kosta.semiproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.semiproject.model.Pagination;
import org.kosta.semiproject.model.ReviewDAO;
import org.kosta.semiproject.model.ReviewVO;

public class ReviewListByStoreNumberController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String storeName = request.getParameter("storeName");
		String pageNo = request.getParameter("pageNo");
		System.out.println(pageNo);
		Pagination pagination = null;
		long totalPostCount = ReviewDAO.getInstance().findTotalPostCount(storeName);
		if(pageNo==null) {
			pagination = new Pagination(totalPostCount);
		}else {
			pagination = new Pagination(totalPostCount,Long.parseLong(pageNo));
		}
		request.setAttribute("pagination", pagination);
		request.setAttribute("storeName", storeName);
		ArrayList<ReviewVO> list = ReviewDAO.getInstance().findStoreReviewList(storeName,pagination);
		System.out.println(list);
		request.setAttribute("reviewList", list);			
		return "review.jsp";
	}

}
