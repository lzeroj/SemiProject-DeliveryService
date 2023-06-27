package org.kosta.semiproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

public class StoreDAO {
	private static StoreDAO instance = new StoreDAO();
	private DataSource dataSource;
	private StoreDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static StoreDAO getInstance() {
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
	
	public ArrayList<StoreVO> findStoreListAll() throws SQLException{
		ArrayList<StoreVO> list = new ArrayList<StoreVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql = "SELECT * FROM STORE";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				StoreVO svo = new StoreVO();
				svo.setStoreNumber(rs.getInt("STORE_NUMBER"));
				svo.setStoreName(rs.getString("STORE_NAME"));
				svo.setStoreLocation(rs.getString("STORE_LOCATION"));
				svo.setStoreCategory(rs.getString("STORE_CATEGORY"));
				svo.setStorePhoneNumber(rs.getString("STORE_PHONENUMBER"));
				svo.setStoreMinimumOrderAmount(rs.getString("STORE_MINIMUMORDERAMOUNT"));
				svo.setStoreInfo(rs.getString("STORE_INFO"));
				svo.setStorePicturePath(rs.getString("STORE_PICTURE_PATH"));
				list.add(svo);
			}
		}finally {
			closeAll(rs,pstmt,con);
		}
		return list;
	}

	public ArrayList<StoreVO> findStoreListByCategory(String category) throws SQLException{
		ArrayList<StoreVO> list = new ArrayList<StoreVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql = "SELECT * FROM STORE WHERE STORE_CATEGORY = ?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				StoreVO svo = new StoreVO();
				svo.setStoreNumber(rs.getInt("STORE_NUMBER"));
				svo.setStoreName(rs.getString("STORE_NAME"));
				svo.setStoreLocation(rs.getString("STORE_LOCATION"));
				svo.setStoreCategory(rs.getString("STORE_CATEGORY"));
				svo.setStorePhoneNumber(rs.getString("STORE_PHONENUMBER"));
				svo.setStoreMinimumOrderAmount(rs.getString("STORE_MINIMUMORDERAMOUNT"));
				svo.setStoreInfo(rs.getString("STORE_INFO"));
				svo.setStorePicturePath(rs.getString("STORE_PICTURE_PATH"));
				list.add(svo);
			}
		}finally {
			closeAll(rs,pstmt,con);
		}
		return list;
	}
	
	public StoreVO findStoreDetailByStoreNumber(int storenumber) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoreVO svo = null;
		try {
//			SELECT * 
//			FROM STORE S, STORE_FOOD SF
//			WHERE S.STORE_NUMBER = SF.STORE_NUMBER 
//			AND STORE_NAME = '소담하다'
			String sql = "SELECT * FROM STORE WHERE STORE_NUMBER = ?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, storenumber);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				svo = new StoreVO();
				svo.setStoreNumber(rs.getInt("STORE_NUMBER"));
				svo.setStoreName(rs.getString("STORE_NAME"));
				svo.setStoreLocation(rs.getString("STORE_LOCATION"));
				svo.setStoreCategory(rs.getString("STORE_CATEGORY"));
				svo.setStorePhoneNumber(rs.getString("STORE_PHONENUMBER"));
				svo.setStoreMinimumOrderAmount(rs.getString("STORE_MINIMUMORDERAMOUNT"));
				svo.setStoreInfo(rs.getString("STORE_INFO"));
				svo.setStorePicturePath(rs.getString("STORE_PICTURE_PATH"));
				
			}
		}finally {
			closeAll(rs,pstmt,con);
		}
		return svo;
	}
	
	public HashMap<Integer, Object> findStoreAddressByStoreNumber(int storenumber) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HashMap<Integer, Object> map = new HashMap<Integer, Object>();
		try {
			String sql = "SELECT STORE_NUMBER, STORE_LOCATION FROM STORE WHERE STORE_NUMBER = ?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, storenumber);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				map.put(rs.getInt("STORE_NUMBER"), rs.getString("STORE_LOCATION"));
			}
		}finally {
			closeAll(rs,pstmt,con);
		}
		return map;
	}
	
	public void insertDistanceCalculator(Map<Integer, Object> map) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			
			
		}finally {
			closeAll(pstmt,con);
		}
	}
}
