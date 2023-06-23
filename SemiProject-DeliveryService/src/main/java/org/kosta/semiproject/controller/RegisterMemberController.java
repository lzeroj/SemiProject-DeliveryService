package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.semiproject.model.MemberDAO;
import org.kosta.semiproject.model.MemberVO;

public class RegisterMemberController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId=request.getParameter("userId");
		String userPassword=request.getParameter("userPassword");
		String userName=request.getParameter("userName");
		String userEmail=request.getParameter("userEmail");
		String userAddress=request.getParameter("userAddress");
		String userAddDetail=request.getParameter("userAddDetail");
		String userPhone=request.getParameter("userPhone");
		String userBirth=request.getParameter("userBirth");
		int userType=Integer.parseInt(request.getParameter("userType"));
		MemberVO mvo=new MemberVO(userId,userPassword,userName,userEmail,userAddress,userAddDetail,userPhone,userBirth,userType);
		MemberDAO.getInstance().register(mvo);
		return "redirect:register-result.jsp";
		}
}

