package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.semiproject.model.MemberDAO;
import org.kosta.semiproject.model.MemberVO;

public class RegisterMemberController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		String user_name = request.getParameter("user_name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String add_detail = request.getParameter("add_detail");
		String user_phone = request.getParameter("user_phone");
		String user_birth = request.getParameter("user_birth");
		String userTypeId = request.getParameter("user_type");
		int user_type = Integer.parseInt(userTypeId);
		MemberVO memberVO = new MemberVO(user_id, password, user_name, email, address, add_detail, user_phone,
				user_birth, user_type);
        MemberDAO memberDAO = MemberDAO.getInstance();
        memberDAO.register(memberVO);
		request.setAttribute("member", memberVO);
		return "register-result.jsp";
	}

}
