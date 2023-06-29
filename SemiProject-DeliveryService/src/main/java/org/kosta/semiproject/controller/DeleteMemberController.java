
package org.kosta.semiproject.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.MemberDAO;

@WebServlet("/DeleteMemberController")
public class DeleteMemberController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("member") == null) {
			return "redirect:index.jsp";
		} // 인증 확인
		String id = request.getParameter("userId");
		String password = request.getParameter("userPassword");
		String path = null;
		System.out.println(id);
		int result = MemberDAO.getInstance().deleteMember(id, password);
		if (result == 1) {
			System.out.println(result);
			path = "member/delete-success.jsp";
			// 회원 삭제 성공
		} else if (result == 0) {
			// 비밀번호 불일치
			path = "member/delete-fail.jsp";
		}
		return path;
	}
}
