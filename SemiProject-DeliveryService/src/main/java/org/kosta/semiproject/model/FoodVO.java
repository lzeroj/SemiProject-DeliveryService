package org.kosta.semiproject.model;

public class FoodVO {
	private String foodName;
	private int foodPrice;
	private StoreVO storeVO;
	public FoodVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FoodVO(String foodName, int foodPrice, StoreVO storeVO) {
		super();
		this.foodName = foodName;
		this.foodPrice = foodPrice;
		this.storeVO = storeVO;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}
	public StoreVO getStoreVO() {
		return storeVO;
	}
	public void setStoreVO(StoreVO storeVO) {
		this.storeVO = storeVO;
	}
	@Override
	public String toString() {
		return "FoodVO [foodName=" + foodName + ", foodPrice=" + foodPrice + ", storeVO=" + storeVO + "]";
	}
	
}
