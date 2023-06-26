package org.kosta.semiproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.FavoritesDAO;
import org.kosta.semiproject.model.FavoritesVO;
import org.kosta.semiproject.model.FoodDAO;
import org.kosta.semiproject.model.FoodVO;
import org.kosta.semiproject.model.MemberVO;
import org.kosta.semiproject.model.StoreDAO;
import org.kosta.semiproject.model.StoreVO;

public class StoFindStoreAndFoodListDetailByStoreNameController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int storenumber = Integer.parseInt(request.getParameter("storenumber"));
		String distance = request.getParameter("distance");
		
		// 즐겨찾기 처리
		HttpSession session = request.getSession(false);
		boolean heartchk = false;
		// session에 값이있을때 : 로그인 했을때
		if(session.getAttribute("member")!=null) {
			MemberVO mvo = (MemberVO) session.getAttribute("member");
			System.out.println(mvo);
			System.out.println(storenumber);
			FavoritesVO fvo = FavoritesDAO.getInstance().favoritesChecker(storenumber, mvo.getUserId());
			// fvo가 null 이면
			if(fvo==null) {
				heartchk = false;
			}else {
				if(fvo.getFavorites().equals("Y")) {
					System.out.println("fvo.getFavorites(): "+fvo.getFavorites());
					heartchk = true;
				}else if(fvo.getFavorites().equals("N")){
					System.out.println("fvo.getFavorites(): "+fvo.getFavorites());
					heartchk = false;
				}
			}
		// session에 값이없을때 : 비로그인 상태일때
		}else {
			heartchk = false;
		}
		System.out.println("heartchk:"+heartchk);
		request.setAttribute("heartchk", heartchk);

		StoreVO svo = StoreDAO.getInstance().findStoreDetailByStoreNumber(storenumber);
		ArrayList<FoodVO> list = FoodDAO.getInstance().findFoodInfoByStoreNumber(storenumber);
		request.setAttribute("storeInfo", svo);
		request.setAttribute("foodInfo", list);
		
		if(distance!=null) {
			double distance2 = Double.parseDouble(distance);
			double distance4 = Math.round((distance2/1000)*10)/10.0;
			session = request.getSession();
			session.setAttribute("distance", distance4);
		}
		return "shop-detail.jsp";
	}
}
