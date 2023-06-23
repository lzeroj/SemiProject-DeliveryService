package org.kosta.semiproject.model;

public class CartVO {
	private MemberVO memberVO;
	private FoodVO foodVO;
	private int quantity;
	
	public CartVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartVO(MemberVO memberVO, FoodVO foodVO, int quantity) {
		super();
		this.memberVO = memberVO;
		this.foodVO = foodVO;
		this.quantity = quantity;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public FoodVO getFoodVO() {
		return foodVO;
	}

	public void setFoodVO(FoodVO foodVO) {
		this.foodVO = foodVO;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "CartVO [memberVO=" + memberVO + ", quantity=" + quantity + "]";
	}
}
