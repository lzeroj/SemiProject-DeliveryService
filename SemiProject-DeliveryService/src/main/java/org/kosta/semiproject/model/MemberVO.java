package org.kosta.semiproject.model;

public class MemberVO {
	private String user_id;
	private String password;
	private String user_name;
	private String email;
	private String address;
	private String add_detail;
	private int user_phone;
	private String user_birth;
	private int user_type;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String user_id, String password, String user_name, String email, String address, String add_detail,
			int user_phone, String user_birth, int user_type) {
		super();
		this.user_id = user_id;
		this.password = password;
		this.user_name = user_name;
		this.email = email;
		this.address = address;
		this.add_detail = add_detail;
		this.user_phone = user_phone;
		this.user_birth = user_birth;
		this.user_type = user_type;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAdd_detail() {
		return add_detail;
	}
	public void setAdd_detail(String add_detail) {
		this.add_detail = add_detail;
	}
	public int getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(int user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	@Override
	public String toString() {
		return "MemberVO [user_id=" + user_id + ", password=" + password + ", user_name=" + user_name + ", email="
				+ email + ", address=" + address + ", add_detail=" + add_detail + ", user_phone=" + user_phone
				+ ", user_birth=" + user_birth + ", user_type=" + user_type + "]";
	}

}
