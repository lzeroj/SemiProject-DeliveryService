package org.kosta.semiproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class OrderDAO {
	private static OrderDAO instance = new OrderDAO();
	private DataSource dataSource;

	public static OrderDAO getInstance() {
		return instance;
	}

	private OrderDAO() {
		this.dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close(); // connection을 dbcp에 반환한다
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		closeAll(pstmt, con);
	}

	public ArrayList<OrderVO> OrderList(String user_id) throws SQLException {
		ArrayList<OrderVO> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(
					"SELECT ORDER_FOOD.order_no, ORDER_FOOD.total_price, ORDER_FOOD.order_date, ORDER_FOOD.order_location, cart.food_name, cart.user_id ");
			sql.append("FROM ORDER_FOOD ");
			sql.append(
					"INNER JOIN cart ON ORDER_FOOD.user_id = cart.user_id AND ORDER_FOOD.food_name = cart.food_name ");
			sql.append("WHERE cart.user_id = ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderVO orderVO = new OrderVO();
				orderVO.setOrderNo(rs.getLong("ORDER_NO"));
				orderVO.setFoodPrice(rs.getInt("TOTAL_PRICE"));
				orderVO.setOrderDate(rs.getString("ORDER_DATE"));
				MemberVO mvo = new MemberVO();
				mvo.setUserId(rs.getString("USER_ID")); // ResultSet에서 얻은 값을 사용
				FoodVO food = new FoodVO();
				food.setFoodName(rs.getString("FOOD_NAME")); // ResultSet에서 얻은 값을 사용
				orderVO.setFoodVO(food);
				orderVO.setMemberVO(mvo);
				list.add(orderVO);
			}

		} finally {
			// TODO: finally 절 처리
			closeAll(rs, pstmt, con);
		}
		return list;
	}
}