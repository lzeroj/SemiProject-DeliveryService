package org.kosta.semiproject.model;

public class FoodVO {
	private String foodName;
	private int foodPrice;
	private String foodPicturePath;
	private StoreVO storeVO;
	public FoodVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FoodVO(String foodName, int foodPrice, String foodPicturePath, StoreVO storeVO) {
		super();
		this.foodName = foodName;
		this.foodPrice = foodPrice;
		this.foodPicturePath = foodPicturePath;
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
	public String getFoodPicturePath() {
		return foodPicturePath;
	}
	public void setFoodPicturePath(String foodPicturePath) {
		this.foodPicturePath = foodPicturePath;
	}
	public StoreVO getStoreVO() {
		return storeVO;
	}
	public void setStoreVO(StoreVO storeVO) {
		this.storeVO = storeVO;
	}
	@Override
	public String toString() {
		return "FoodVO [foodName=" + foodName + ", foodPrice=" + foodPrice + ", foodPicturePath=" + foodPicturePath
				+ ", storeVO=" + storeVO + "]";
	}
	
}
