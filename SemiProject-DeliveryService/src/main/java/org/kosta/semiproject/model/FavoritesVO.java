package org.kosta.semiproject.model;

public class FavoritesVO {
	private StoreVO storeVO;
	private MemberVO memberVO;
	private String favorites;
	public FavoritesVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FavoritesVO(StoreVO storeVO, MemberVO memberVO, String favorites) {
		super();
		this.storeVO = storeVO;
		this.memberVO = memberVO;
		this.favorites = favorites;
	}
	public StoreVO getStoreVO() {
		return storeVO;
	}
	public void setStoreVO(StoreVO storeVO) {
		this.storeVO = storeVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getFavorites() {
		return favorites;
	}
	public void setFavorites(String favorites) {
		this.favorites = favorites;
	}
	@Override
	public String toString() {
		return "FavoritesVO [storeVO=" + storeVO + ", memberVO=" + memberVO + ", favorites=" + favorites + "]";
	}
	
}
