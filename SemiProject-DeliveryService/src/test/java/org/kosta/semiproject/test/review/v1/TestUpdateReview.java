package org.kosta.semiproject.test.review.v1;

import org.kosta.semiproject.model.ReviewDAO;
import org.kosta.semiproject.model.ReviewVO;

public class TestUpdateReview {
	public static void main(String[] args) {
		try {
			ReviewVO review = new ReviewVO();
			review.setReviewContent("3시간남았다");
			review.setReviewNo(205);
			ReviewDAO.getInstance().updateReviewpost(review);
			System.out.println("review 업데이트완료 :" + review);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
