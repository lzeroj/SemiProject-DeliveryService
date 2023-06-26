package org.kosta.semiproject.test.member.v1;

import java.sql.SQLException;

import org.kosta.semiproject.model.MemberDAO;
import org.kosta.semiproject.model.MemberVO;

public class TestLoginMember {

	public static void main(String[] args) {
		String id = "test1";
		String password = "a";
		try {
			MemberVO vo = MemberDAO.getInstance().login(id, password);
			if (vo == null) {
				System.out.println("로그인실패");
			} else {
				System.out.println("로그인성공: " + vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
