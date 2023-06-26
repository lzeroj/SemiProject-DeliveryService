package org.kosta.semiproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.semiproject.model.FoodDAO;
import org.kosta.semiproject.model.FoodVO;
import org.kosta.semiproject.model.StoreDAO;
import org.kosta.semiproject.model.StoreVO;

public class StoFindStoreAndFoodListDetailByStoreNameController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int storenumber = Integer.parseInt(request.getParameter("storenumber"));
		String distance = request.getParameter("distance");
		double distance2 = Double.parseDouble(distance);
		double distance4 = Math.round((distance2/1000)*10)/10.0;

//		double distance3 = distance2/1000;
//		System.out.println(distance4);
//		System.out.println("storenumber:"+storenumber);

		StoreVO svo = StoreDAO.getInstance().findStoreDetailByStoreNumber(storenumber);
		ArrayList<FoodVO> list = FoodDAO.getInstance().findFoodInfoByStoreNumber(storenumber);
		request.setAttribute("storeInfo", svo);
		request.setAttribute("foodInfo", list);
		
		if(distance!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("distance", distance4);
		}
		return "shop-detail.jsp";
	}
}
