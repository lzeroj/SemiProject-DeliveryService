package org.kosta.semiproject.test.member.v1;

import java.sql.SQLException;

import org.kosta.semiproject.model.MemberDAO;

public class TestDeleteMember {
	public static void main(String[] args) throws SQLException {
		MemberDAO.getInstance().deleteMember("test1", "a");
}
}
