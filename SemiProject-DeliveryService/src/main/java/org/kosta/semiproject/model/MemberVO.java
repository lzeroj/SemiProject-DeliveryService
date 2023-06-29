package org.kosta.semiproject.model;

import java.io.Serializable;

public class MemberVO implements Serializable  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5273973056262601241L;
	private String userId;
	private String userPassword;
	private String userName;
	private String userEmail;
	private String userAddress;
	private String userAddDetail;
	private String userPhone;
	private String userBirth;
	private int userType;
	private String userState;

	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String userId, String userPassword, String userName, String userEmail, String userAddress,
			String userAddDetail, String userPhone, String userBirth, int userType, String userState) {
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
		this.userState = userState;
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

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
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

	public String getUserState() {
		return userState;
	}

	public void setUserState(String userState) {
		this.userState = userState;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPassword=" + userPassword + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", userAddress=" + userAddress + ", userAddDetail=" + userAddDetail
				+ ", userPhone=" + userPhone + ", userBirth=" + userBirth + ", userType=" + userType + ", userState="
				+ userState + "]";
	}

}
