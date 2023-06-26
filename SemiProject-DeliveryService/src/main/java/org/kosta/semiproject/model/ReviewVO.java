package org.kosta.semiproject.model;

public class ReviewVO {	
	private int reviewNo;
	private String reviewContent;
	private String reviewInsertDate;
	private StoreVO storeVO;
	private MemberVO memberVO;
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewVO(int reviewNo, String reviewContent, String reviewInsertDate, StoreVO storeVO, MemberVO memberVO) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewInsertDate = reviewInsertDate;
		this.storeVO = storeVO;
		this.memberVO = memberVO;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewInsertDate() {
		return reviewInsertDate;
	}
	public void setReviewInsertDate(String reviewInsertDate) {
		this.reviewInsertDate = reviewInsertDate;
	}
	public StoreVO getStoreVO() {
		return storeVO;
	}
	public void setStoreVO(StoreVO storeVO) {
		this.storeVO = storeVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewInsertDate="
				+ reviewInsertDate + ", storeVO=" + storeVO + ", memberVO=" + memberVO + "]";
	}
}
