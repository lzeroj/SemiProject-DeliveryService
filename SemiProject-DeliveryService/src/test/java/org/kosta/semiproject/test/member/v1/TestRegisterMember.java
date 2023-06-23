package org.kosta.semiproject.test.member.v1;

import org.kosta.semiproject.model.MemberDAO;
import org.kosta.semiproject.model.MemberVO;

public class TestRegisterMember {
	public static void main(String[] args) {
		try {
			MemberVO mvo = new MemberVO();
			mvo.setUserId("s35");
			mvo.setUserPassword("a");
			mvo.setUserName("김서울");
			mvo.setUserEmail("aaaa@naver.com");
			mvo.setUserAddress("경기도 성남시 분당구 구미동");
			mvo.setUserAddDetail("201호");
			mvo.setUserPhone("01012345678");
			mvo.setUserBirth("19931003");
			mvo.setUserType(1);       
			MemberDAO.getInstance().register(mvo);
			System.out.println("완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
