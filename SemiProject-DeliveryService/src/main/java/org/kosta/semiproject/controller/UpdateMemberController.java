
package org.kosta.semiproject.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.MemberDAO;
import org.kosta.semiproject.model.MemberVO;

@WebServlet("/UpdateMemberController")
public class UpdateMemberController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("member") == null) {
			return "redirect:member/update-form.jsp";
		}
		String id = request.getParameter("userId");
		String password = request.getParameter("userPassword");
		String name = request.getParameter("userName");
		String email = request.getParameter("userEmail");
		String address = request.getParameter("userAddress");
		String addDetail = request.getParameter("userAddDetail");
		String phone = request.getParameter("userPhone");
		String birth = request.getParameter("userBirth");
		
		MemberVO mvo = new MemberVO();
		mvo.setUserId(id);
		mvo.setUserPassword(password);
		mvo.setUserName(name);
		mvo.setUserEmail(email);
		mvo.setUserAddress(address);
		mvo.setUserAddDetail(addDetail);
		mvo.setUserPhone(phone);
		mvo.setUserBirth(birth);
		MemberDAO.getInstance().updateMember(mvo);
		session.setAttribute("member", mvo);
		return "redirect:member/update-result.jsp";
	}
}
