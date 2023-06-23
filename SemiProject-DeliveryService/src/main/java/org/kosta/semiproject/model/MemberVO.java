package org.kosta.semiproject.model;

public class MemberVO {
	private String userId;
	private String userPassword;
	private String userName;
	private String userEmail;
	private String userAddress;
	private String userAddDetail;
	private int userPhone;
	private String userBirth;
	private int userType;

	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String userId, String userPassword, String userName, String userEmail, String userAddress,
			String userAddDetail, int userPhone, String userBirth, int userType) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
		this.userAddDetail = userAddDetail;
		this.userPhone = userPhone;
		this.userBirth = userBirth;
		this.userType = userType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserAddDetail() {
		return userAddDetail;
	}

	public void setUserAddDetail(String userAddDetail) {
		this.userAddDetail = userAddDetail;
	}

	public int getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(int userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPassword=" + userPassword + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", userAddress=" + userAddress + ", userAddDetail=" + userAddDetail
				+ ", userPhone=" + userPhone + ", userBirth=" + userBirth + ", userType=" + userType + "]";
	}
}