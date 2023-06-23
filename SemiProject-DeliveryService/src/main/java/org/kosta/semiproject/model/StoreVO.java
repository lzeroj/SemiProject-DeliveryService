package org.kosta.semiproject.model;

public class StoreVO {
	private int storeNumber;
	private String storeName;
	private String storeLocation;
	private String storeCategory;
	private String storePhoneNumber;
	private String storeMinimumOrderAmount;
	private String storeInfo;
	private String storePicturePath;
	public StoreVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoreVO(String storeName, String storeLocation, String storeCategory, String storePhoneNumber,
			String storeMinimumOrderAmount, String storeInfo, String storePicturePath) {
		super();
		this.storeName = storeName;
		this.storeLocation = storeLocation;
		this.storeCategory = storeCategory;
		this.storePhoneNumber = storePhoneNumber;
		this.storeMinimumOrderAmount = storeMinimumOrderAmount;
		this.storeInfo = storeInfo;
		this.storePicturePath = storePicturePath;
	}
	public StoreVO(int storeNumber, String storeName, String storeLocation, String storeCategory,
			String storePhoneNumber, String storeMinimumOrderAmount, String storeInfo, String storePicturePath) {
		super();
		this.storeNumber = storeNumber;
		this.storeName = storeName;
		this.storeLocation = storeLocation;
		this.storeCategory = storeCategory;
		this.storePhoneNumber = storePhoneNumber;
		this.storeMinimumOrderAmount = storeMinimumOrderAmount;
		this.storeInfo = storeInfo;
		this.storePicturePath = storePicturePath;
	}

	public int getStoreNumber() {
		return storeNumber;
	}
	public void setStoreNumber(int storeNumber) {
		this.storeNumber = storeNumber;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getStoreCategory() {
		return storeCategory;
	}
	public void setStoreCategory(String storeCategory) {
		this.storeCategory = storeCategory;
	}
	public String getStorePhoneNumber() {
		return storePhoneNumber;
	}
	public void setStorePhoneNumber(String storePhoneNumber) {
		this.storePhoneNumber = storePhoneNumber;
	}
	public String getStoreMinimumOrderAmount() {
		return storeMinimumOrderAmount;
	}
	public void setStoreMinimumOrderAmount(String storeMinimumOrderAmount) {
		this.storeMinimumOrderAmount = storeMinimumOrderAmount;
	}
	public String getStoreInfo() {
		return storeInfo;
	}
	public void setStoreInfo(String storeInfo) {
		this.storeInfo = storeInfo;
	}
	public String getStorePicturePath() {
		return storePicturePath;
	}
	public void setStorePicturePath(String storePicturePath) {
		this.storePicturePath = storePicturePath;
	}
	@Override
	public String toString() {
		return "StoreVO [storeNumber=" + storeNumber + ", storeName=" + storeName + ", storeLocation=" + storeLocation
				+ ", storeCategory=" + storeCategory + ", storePhoneNumber=" + storePhoneNumber
				+ ", storeMinimumOrderAmount=" + storeMinimumOrderAmount + ", storeInfo=" + storeInfo
				+ ", storePicturePath=" + storePicturePath + "]";
	}
	
}
