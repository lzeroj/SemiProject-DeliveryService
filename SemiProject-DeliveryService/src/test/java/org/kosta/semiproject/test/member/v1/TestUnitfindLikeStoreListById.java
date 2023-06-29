package org.kosta.semiproject.test.member.v1;

import java.sql.SQLException;
import java.util.ArrayList;

import org.kosta.semiproject.model.MemberDAO;
import org.kosta.semiproject.model.StoreVO;

public class TestUnitfindLikeStoreListById {

	public static void main(String[] args) {
		try {
			String userid = "test1";
			ArrayList<StoreVO> list = MemberDAO.getInstance().findLikeStoreListById(userid);
			for(StoreVO svo : list) {
				System.out.println(svo.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
