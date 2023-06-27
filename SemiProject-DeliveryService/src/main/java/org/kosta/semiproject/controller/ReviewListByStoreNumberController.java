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
		int storeNumber =  Integer.parseInt(request.getParameter("storeNumber")); 
		String storeName = request.getParameter("storeName"); 
		String pageNo = request.getParameter("pageNo");
		Pagination pagination = null;
		long totalPostCount = ReviewDAO.getInstance().findTotalPostCount(storeNumber);
		if(pageNo==null) {
			pagination = new Pagination(totalPostCount);
		}else {
			pagination = new Pagination(totalPostCount,Long.parseLong(pageNo));
		}
		request.setAttribute("pagination", pagination);
		request.setAttribute("storeNumber", storeNumber);
		request.setAttribute("storeName", storeName);
		ArrayList<ReviewVO> list = ReviewDAO.getInstance().findStoreReviewList(storeNumber,pagination);
		request.setAttribute("reviewList", list);			
		return "review.jsp";
	}

}
