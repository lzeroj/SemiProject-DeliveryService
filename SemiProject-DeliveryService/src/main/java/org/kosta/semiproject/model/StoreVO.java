package org.kosta.semiproject.model;

public class StoreVO {
	private int storeNumber;
	private String storeName;
	private String storeLocation;
	private String storeCategory;
	private String storePhoneNumber;
	public StoreVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoreVO(int storeNumber, String storeName, String storeLocation, String storeCategory,
			String storePhoneNumber) {
		super();
		this.storeNumber = storeNumber;
		this.storeName = storeName;
		this.storeLocation = storeLocation;
		this.storeCategory = storeCategory;
		this.storePhoneNumber = storePhoneNumber;
	}
	public long getStoreNumber() {
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
	@Override
	public String toString() {
		return "StoreVO [storeNumber=" + storeNumber + ", storeName=" + storeName + ", storeLocation=" + storeLocation
				+ ", storeCategory=" + storeCategory + ", storePhoneNumber=" + storePhoneNumber + "]";
	}
}
