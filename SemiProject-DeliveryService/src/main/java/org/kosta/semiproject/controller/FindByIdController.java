package org.kosta.semiproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.semiproject.model.MemberDAO;

public class FindByIdController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = request.getParameter("user_id");
		boolean result = MemberDAO.getInstance().findByid(userId) == null; // 중복되지 않으면 true 값을 result에 담음 , 중복되면 false 값
		request.setAttribute("responsebody", result);
		return "AjaxView";
	}

}
