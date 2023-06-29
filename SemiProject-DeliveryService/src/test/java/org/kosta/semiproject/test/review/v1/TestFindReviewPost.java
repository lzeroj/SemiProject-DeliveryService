package org.kosta.semiproject.test.review.v1;

import org.kosta.semiproject.model.ReviewDAO;

public class TestFindReviewPost {
	public static void main(String[] args) {
		try {
			int review_no = 212;
			System.out.println(ReviewDAO.getInstance().findReviewPostByNo(review_no));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
