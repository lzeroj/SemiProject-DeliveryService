package org.kosta.semiproject.test.member.v1;

import java.sql.SQLException;

import org.kosta.semiproject.model.MemberDAO;

public class TestFindbyId {
	public static void main(String[] args) {
		String userId = "test1";
		try {
			boolean result = MemberDAO.getInstance().findByid(userId) == null; // userId 와 kim12 같지 않다면
			if (result) {
				System.out.println(result);
				System.out.println("사용 가능한 아이디입니다.");

			} else {
				System.out.println(result);
				System.out.println("중복된 아이디입니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
