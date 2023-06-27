/*
 * package org.kosta.semiproject.controller; import java.lang.reflect.Parameter;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession; import
 * javax.swing.text.html.HTMLDocument.HTMLReader.ParagraphAction;
 * 
 * import org.kosta.semiproject.controller.Controller; import
 * org.kosta.semiproject.model.MemberDAO;
 * 
 * public class DeleteController implements Controller {
 * 
 * @Override public String handleRequest(HttpServletRequest request,
 * HttpServletResponse response) throws Exception { HttpSession
 * session=request.getSession();
 * if(session==null||session.getAttribute("memberDAO")==null) { return
 * "redirect:index.jsp"; } String userId=request.getParameter("userId"); String
 * userPassword=request.getParameter("userPassword"); int
 * checkUser=MemberDAO.getInstance().checkUser(userPassword); if(checkUser==0) {
 * return "redirect:member/delete.jsp"; } return null; }
 * 
 * }
 */