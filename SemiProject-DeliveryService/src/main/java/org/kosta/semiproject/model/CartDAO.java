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
	public ArrayList<CartVO> findByIdByFoodName() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CartVO> list = new ArrayList<>();
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT c.user_id,s.store_name,sf.food_picture_path,c.food_name,sf.food_price,c.quantity ");
			sql.append("FROM cart c ");
			sql.append("INNER JOIN store_food sf ON c.food_name=sf.food_name ");
			sql.append("INNER JOIN member m ON c.user_id = m.user_id ");
			sql.append("INNER JOIN store s ON sf.store_number = s.store_number");
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CartVO cartVO = new CartVO();			
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

	public void updateCartMenuPlus(String user_id, String food_name) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "UPDATE cart SET quantity=quantity+1 WHERE user_id=? AND food_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, food_name);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}

	public void updateCartMenuMinus(String user_id, String food_name) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "UPDATE cart SET quantity=quantity-1 WHERE user_id=? AND food_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, food_name);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}	
	}

	public void deleteCartMenu(String user_id, String food_name) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "DELETE FROM cart WHERE user_id=? AND food_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, food_name);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}		
	}
}
