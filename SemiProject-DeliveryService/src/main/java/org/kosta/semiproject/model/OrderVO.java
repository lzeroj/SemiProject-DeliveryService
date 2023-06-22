package org.kosta.semiproject.model;

public class OrderVO {
	private long orderNo;
	private int foodPrice;
	private String orderSuccess;
	private String orderDate;
	private FoodVO foodVO;
	private MemberVO memberVO;

	public OrderVO() {
		super();
	}

	public OrderVO(long orderNo, int foodPrice, String orderSuccess, String orderDate, FoodVO foodVO,
			MemberVO memberVO) {
		super();
		this.orderNo = orderNo;
		this.foodPrice = foodPrice;
		this.orderSuccess = orderSuccess;
		this.orderDate = orderDate;
		this.foodVO = foodVO;
		this.memberVO = memberVO;
	}

	public long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}

	public int getFoodPrice() {
		return foodPrice;
	}

	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}

	public String getOrderSuccess() {
		return orderSuccess;
	}

	public void setOrderSuccess(String orderSuccess) {
		this.orderSuccess = orderSuccess;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public FoodVO getFoodVO() {
		return foodVO;
	}

	public void setFoodVO(FoodVO foodVO) {
		this.foodVO = foodVO;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	@Override
	public String toString() {
		return "OrderVO [orderNo=" + orderNo + ", foodPrice=" + foodPrice + ", orderSuccess=" + orderSuccess
				+ ", orderDate=" + orderDate + ", foodVO=" + foodVO + ", memberVO=" + memberVO + "]";
	}

}
