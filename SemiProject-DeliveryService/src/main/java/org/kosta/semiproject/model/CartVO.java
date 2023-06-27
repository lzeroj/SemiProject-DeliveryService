package org.kosta.semiproject.model;

public class CartVO {
	private int cartNo;
	private MemberVO memberVO;
	private FoodVO foodVO;
	private int quantity;
	private int isCartOrdered;
	
	public CartVO() {
		super();
	}

	public CartVO(int cartNo, MemberVO memberVO, FoodVO foodVO, int quantity, int isCartOrdered) {
		super();
		this.cartNo = cartNo;
		this.memberVO = memberVO;
		this.foodVO = foodVO;
		this.quantity = quantity;
		this.isCartOrdered = isCartOrdered;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
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

	public int getIsCartOrdered() {
		return isCartOrdered;
	}

	public void setIsCartOrdered(int isCartOrdered) {
		this.isCartOrdered = isCartOrdered;
	}

	@Override
	public String toString() {
		return "CartVO [cartNo=" + cartNo + ", memberVO=" + memberVO + ", foodVO=" + foodVO + ", quantity=" + quantity
				+ ", isCartOrdered=" + isCartOrdered + "]";
	}
	
	
}
