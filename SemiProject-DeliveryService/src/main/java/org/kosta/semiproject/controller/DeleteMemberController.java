/*
 * package org.kosta.semiproject.controller;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * import org.kosta.semiproject.model.MemberDAO;
 * 
 * public class DeleteMemberController implements Controller {
 * 
 * @Override public String handleRequest(HttpServletRequest request,
 * HttpServletResponse response) throws Exception { HttpSession session =
 * request.getSession(); if (session == null || session.getAttribute("member")
 * == null) { return "redirect:index.jsp"; } String id =
 * request.getParameter("userId"); String password =
 * request.getParameter("userPassword");
 * 
 * int checkUser = MemberDAO.getInstance().deleteMember(password); if (checkUser
 * == 0) { return "redirect:index.jsp"; } return
 * "redirect:member/delete-form.jsp"; } }
 */