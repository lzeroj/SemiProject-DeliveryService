package org.kosta.semiproject.model;

public class FoodVO {
	private String foodName;
	private int foodPrice;
	private String foodPicturePath;
	private String foodInfo;
	private StoreVO storeVO;
	public FoodVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FoodVO(String foodName, int foodPrice, String foodPicturePath, String foodInfo) {
		super();
		this.foodName = foodName;
		this.foodPrice = foodPrice;
		this.foodPicturePath = foodPicturePath;
		this.foodInfo = foodInfo;
	}

	public FoodVO(String foodName, int foodPrice, String foodPicturePath, String foodInfo, StoreVO storeVO) {
		super();
		this.foodName = foodName;
		this.foodPrice = foodPrice;
		this.foodPicturePath = foodPicturePath;
		this.foodInfo = foodInfo;
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

	public String getFoodInfo() {
		return foodInfo;
	}

	public void setFoodInfo(String foodInfo) {
		this.foodInfo = foodInfo;
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
				+ ", foodInfo=" + foodInfo + ", storeVO=" + storeVO + "]";
	}
	
}
