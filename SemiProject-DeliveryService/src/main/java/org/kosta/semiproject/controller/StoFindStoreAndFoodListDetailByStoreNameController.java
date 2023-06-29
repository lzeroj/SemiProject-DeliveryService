package org.kosta.semiproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
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
		int storenumber = 0;
		String distance = request.getParameter("distance");
		
		//storenumber가 없으면
		if(request.getParameter("storenumber") != null) {
			storenumber = Integer.parseInt(request.getParameter("storenumber"));
			System.out.println("findStoreByName를 사용하지 않고 나온 "+storenumber);
		}else if(request.getParameter("storename") != null){
			storenumber = StoreDAO.getInstance().findStoreByName(request.getParameter("storename"));
			System.out.println("findStoreByName를 실행하여 나온 "+storenumber);
		}
		
		HttpSession session = request.getSession(false);
		String address = (String) session.getAttribute("address");
		System.out.println("StoFindStoreAndFoodListDetailByStoreNameController: "+address);
		
		// 즐겨찾기 처리
		boolean heartchk = false;
		
		// session에 값이있을때 : 로그인 했을때
		if(session.getAttribute("member")!=null) {
			MemberVO mvo = (MemberVO) session.getAttribute("member");
			FavoritesVO fvo = FavoritesDAO.getInstance().favoritesChecker(storenumber, mvo.getUserId());
			
			if(fvo==null) { // fvo가 null 이면
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
		}else { // session에 값이없을때 : 비로그인 상태일때
			heartchk = false;
		}
		
		request.setAttribute("heartchk", heartchk);

		StoreVO svo = StoreDAO.getInstance().findStoreDetailByStoreNumber(storenumber);
		ArrayList<FoodVO> list = FoodDAO.getInstance().findFoodInfoByStoreNumber(storenumber);
		request.setAttribute("storeInfo", svo);
		request.setAttribute("foodInfo", list);
		
		if(distance!=null) {
			double distance2 = Double.parseDouble(distance);
			double distance4 = Math.round((distance2/1000)*10)/10.0;
			session.setAttribute("distance", distance4);
			
			String storenumber1 = String.valueOf(storenumber);
			JSONObject json = new JSONObject();
			json.put(storenumber1, distance4);
			session.setAttribute("json", json);
		}
		
		return "shop-detail.jsp";
	}
}
