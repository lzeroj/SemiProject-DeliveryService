
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
		}//인증 확인
		String id = request.getParameter("userId");
		String password = request.getParameter("userPassword");

		int checkUser = MemberDAO.getInstance().checkUser(id, password);
		if (checkUser == 0) {
			return "redirect:../index.jsp";
		}
		int result = MemberDAO.getInstance().deleteMember(id, password);
		if (result == 1) {
		    // 회원 삭제 성공
		    // 이후 필요한 처리를 수행
		} else if (result == 0) {
		    // 비밀번호 불일치
		    // 이후 필요한 처리를 수행
		} else {
		    // 회원 아이디가 존재하지 않음
		    // 이후 필요한 처리를 수행
		}
		// memberDAO delete member 메소드를 호출하고 회원 아이디와 패스워드를 전달해서
		// 그 회원의 상태값을 n으로 업데이트
		// 리턴
		
		return "redirect:member/delete-result.jsp";
	}
}
