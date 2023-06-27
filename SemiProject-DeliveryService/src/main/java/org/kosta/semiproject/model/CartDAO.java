package org.kosta.semiproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class CartDAO {
	private static CartDAO instance = new CartDAO();
	private DataSource dataSource;

	private CartDAO() {
		this.dataSource = DataSourceManager.getInstance().getDataSource();
	}
	public static CartDAO getInstance() {
		return instance;
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

	/*
	 * SELECT
	 * c.user_id,s.store_name,sf.food_picture_path,c.food_name,sf.food_price,c.
	 * quantity FROM cart c INNER JOIN store_food sf ON c.food_name=sf.food_name
	 * INNER JOIN member m ON c.user_id = m.user_id INNER JOIN store s ON
	 * sf.store_number = s.store_number;
	 */
	public ArrayList<CartVO> findByIdByFoodName(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CartVO> list = new ArrayList<>();
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT c.cart_no,c.user_id,s.store_name,sf.food_picture_path,c.food_name,sf.food_price,c.quantity ");
			sql.append("FROM cart c ");
			sql.append("INNER JOIN store_food sf ON c.food_name=sf.food_name ");
			sql.append("INNER JOIN member m ON c.user_id = m.user_id ");
			sql.append("INNER JOIN store s ON sf.store_number = s.store_number ");
			sql.append("WHERE c.user_id=? ");
			sql.append("AND c.IS_CART_ORDERED = 1");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CartVO cartVO = new CartVO();		
				cartVO.setCartNo(rs.getInt("cart_no"));
				 MemberVO memberVO = new MemberVO(); 
				memberVO.setUserId(rs.getString("user_id"));
				 cartVO.setMemberVO(memberVO);				 						 
				 FoodVO foodVO = new FoodVO(); 
				 foodVO.setFoodName(rs.getString("food_name"));
				 foodVO.setFoodPrice(rs.getInt("food_price"));
				 foodVO.setFoodPicturePath(rs.getString("food_picture_path"));
				 StoreVO storeVO = new StoreVO();
				 storeVO.setStoreName(rs.getString("store_name"));
				 foodVO.setStoreVO(storeVO);
				 cartVO.setFoodVO(foodVO);		 
				 cartVO.setQuantity(rs.getInt("quantity"));
				list.add(cartVO);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	public int updateCartMenuPlus(int cartNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		int quantity = 0;
		try {
			con = dataSource.getConnection();
			String sql = "UPDATE cart SET quantity=quantity+1 WHERE cart_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cartNo);
			pstmt.executeUpdate();
			
			String sql2 = "SELECT quantity FROM cart WHERE cart_no=?";
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setInt(1, cartNo);
			rs = pstmt2.executeQuery();
			if(rs.next()) {
				quantity = rs.getInt(1);
			}
		}finally {
			closeAll(pstmt, con);
		}
		return quantity;
	}

	public int updateCartMenuMinus(int cartNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		int quantity = 0;
		try {
			con = dataSource.getConnection();
			String sql = "UPDATE cart SET quantity=quantity-1 WHERE cart_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cartNo);
			pstmt.executeUpdate();
			
			String sql2 = "SELECT quantity FROM cart WHERE cart_no=?";
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setInt(1, cartNo);
			rs = pstmt2.executeQuery();
			if(rs.next()) {
				quantity = rs.getInt(1);
			}
		}finally {
			closeAll(pstmt, con);
		}
		return quantity;	
	}

	public void deleteCartMenu(int cartNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "DELETE FROM cart WHERE cart_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cartNo);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}		
	}

	public void insertCart(String userId, String foodName) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "INSERT INTO cart(cart_no,user_id,food_name,quantity,IS_CART_ORDERED) VALUES(cart_no_seq.nextval,?,?,1,1)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, foodName);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}		
	}

	/*
	 * SELECT count(*) FROM cart c INNER JOIN store_food sf ON c.food_name =
	 * sf.food_name INNER JOIN member m ON c.user_id = m.user_id INNER JOIN store s
	 * ON sf.store_number = s.store_number WHERE c.user_id ='test1' AND sf.food_name
	 * = '비빔밥' AND s.store_name ='소담하다' // s.store_name 보류 가져오는 방법 알아놔야함.
	 */
	public int checkCartMenu(String userId, String foodName) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int checkId = 0;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT count(*) ");
			sql.append("FROM cart c ");
			sql.append("INNER JOIN store_food sf ON c.food_name = sf.food_name ");
			sql.append("INNER JOIN member m ON c.user_id = m.user_id ");
			sql.append("INNER JOIN store s ON sf.store_number = s.store_number ");
			sql.append("WHERE c.user_id=? AND sf.food_name=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, userId);
			pstmt.setString(2, foodName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				checkId = rs.getInt(1);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return checkId;
	}
	
	public void orderCartMenu(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE CART SET IS_CART_ORDERED = 0 ");
			sb.append("WHERE IS_CART_ORDERED = 1 ");
			sb.append("AND USER_ID = ? ");
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}

}
