package org.kosta.semiproject.test.store.v1;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Set;

import org.kosta.semiproject.model.StoreDAO;
import org.kosta.semiproject.model.StoreVO;

public class TestUnitFindStoreAddressByStoreNumber {

	public static void main(String[] args) {
		try {
//			HashMap<Integer, Object> map = new HashMap<Integer, Object>();
			ArrayList<StoreVO> list = StoreDAO.getInstance().findStoreListAll();
			HashMap<Integer, Object> address = null;
			for(int i=0; i<list.size();i++) {
				address = StoreDAO.getInstance().findStoreAddressByStoreNumber(i);
			}
			// Map의 keySet() 메서드를 사용하여 key 값을 추출
			Set<Integer> keys = address.keySet();
			Collection<Object> values = address.values();
			System.out.println(keys); // [key1, key2, key3]

			// 반복문을 통해 key 값을 출력
			for (Integer key : keys) {
			    System.out.println(key);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
