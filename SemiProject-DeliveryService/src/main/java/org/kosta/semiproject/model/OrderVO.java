package org.kosta.semiproject.model;

public class OrderVO {
	private long orderNo;
	private int totalPrice;
	private String orderSuccess;
	private String orderDate;
	private String orderLocation;
	private MemberVO memberVO;
	private StoreVO storeVO;

	public OrderVO() {
		super();
	}

	public OrderVO(long orderNo, int totalPrice, String orderSuccess, String orderDate, String orderLocation,
			MemberVO memberVO, StoreVO storeVO) {
		super();
		this.orderNo = orderNo;
		this.totalPrice = totalPrice;
		this.orderSuccess = orderSuccess;
		this.orderDate = orderDate;
		this.orderLocation = orderLocation;
		this.memberVO = memberVO;
		this.storeVO = storeVO;
	}

	public OrderVO(long orderNo, int totalPrice, String orderSuccess, String orderDate, String orderLocation,
			MemberVO memberVO) {
		super();
		this.orderNo = orderNo;
		this.totalPrice = totalPrice;
		this.orderSuccess = orderSuccess;
		this.orderDate = orderDate;
		this.orderLocation = orderLocation;
		this.memberVO = memberVO;
	}

	public long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
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

	public String getOrderLocation() {
		return orderLocation;
	}

	public void setOrderLocation(String orderLocation) {
		this.orderLocation = orderLocation;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public StoreVO getStoreVO() {
		return storeVO;
	}

	public void setStoreVO(StoreVO storeVO) {
		this.storeVO = storeVO;
	}

	@Override
	public String toString() {
		return "OrderVO [orderNo=" + orderNo + ", totalPrice=" + totalPrice + ", orderSuccess=" + orderSuccess
				+ ", orderDate=" + orderDate + ", orderLocation=" + orderLocation + ", memberVO=" + memberVO
				+ ", storeVO=" + storeVO + "]";
	}


}
