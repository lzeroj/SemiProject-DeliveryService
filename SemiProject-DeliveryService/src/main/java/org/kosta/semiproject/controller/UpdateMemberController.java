/*
 * package org.kosta.semiproject.controller;
 * 
 * import javax.servlet.annotation.WebServlet; import
 * javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * import org.kosta.semiproject.model.MemberDAO; import
 * org.kosta.semiproject.model.MemberVO;
 * 
 * @WebServlet("/UpdateMemberController") public class UpdateMemberController
 * implements Controller {
 * 
 * @Override public String handleRequest(HttpServletRequest request,
 * HttpServletResponse reponse) throws Exception { HttpSession
 * session=request.getSession(false);
 * if(session==null||session.getAttribute("mvo")==null) {
 * System.out.println("**로그인 후 이용하시기 바랍니다**"); return "redirect:index.jsp"; }
 * String id=request.getParameter("userId"); String
 * password=request.getParameter("userPassword"); String
 * email=request.getParameter("userEmail"); String
 * phone=request.getParameter("userPhone"); String
 * name=request.getParameter("userName"); String
 * address=request.getParameter("userAddress"); String
 * addDetail=request.getParameter("userAddDetail"); //db에 회원정보를 수정 MemberVO
 * mvo=new MemberVO(id, password, email, phone, name, address, addDetail);
 * MemberDAO.getInstance().updateMember(mvo); //session에 회원정보를 수정
 * session.setAttribute("mvo",mvo);//mvo의 value를 업데이트 return
 * "redirect:member/update-result.jsp"; } }
 */