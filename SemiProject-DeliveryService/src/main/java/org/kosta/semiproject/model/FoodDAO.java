package org.kosta.semiproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class FoodDAO {
	private static FoodDAO instance = new FoodDAO();
	private DataSource dataSource;
	private FoodDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static FoodDAO getInstance() {
		return instance;
	}
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException {
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close(); 
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException {
		if(rs!=null)
			rs.close();
		closeAll(pstmt, con);
	}
	
	public ArrayList<FoodVO> findFoodInfoByStoreNumber(int storeNumber) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FoodVO fvo = null;
		ArrayList<FoodVO> list = new ArrayList<>();
		try {
			String sql = "SELECT * FROM STORE_FOOD WHERE STORE_NUMBER = ?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, storeNumber);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				fvo = new FoodVO(rs.getString("FOOD_NAME"),rs.getInt("FOOD_PRICE"),rs.getString("FOOD_PICTURE_PATH"),rs.getString("FOOD_INFO"));
				list.add(fvo);
			}
		}finally {
			closeAll(rs,pstmt,con);
		}
		return list;
	}
	
	public FoodVO findFoodDetailByFoodName(String foodname) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FoodVO fvo = null;
		try {
			String sql = "SELECT * FROM STORE_FOOD WHERE FOOD_NAME = ?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, foodname);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				StoreVO svo = new StoreVO();
				svo.setStoreNumber(rs.getInt("STORE_NUMBER"));
				fvo = new FoodVO(rs.getString("FOOD_NAME"),rs.getInt("FOOD_PRICE"),rs.getString("FOOD_PICTURE_PATH"),rs.getString("FOOD_INFO"),svo);
			}
		}finally {
			closeAll(rs,pstmt,con);
		}
		return fvo;
	}

}
