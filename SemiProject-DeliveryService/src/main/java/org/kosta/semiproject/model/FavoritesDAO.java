package org.kosta.semiproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class FavoritesDAO {
	private static FavoritesDAO instance = new FavoritesDAO();
	private DataSource dataSource;
	private FavoritesDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static FavoritesDAO getInstance() {
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
	
	public FavoritesVO favoritesChecker(int storeNumber, String userid) throws SQLException {
		FavoritesVO fvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM favorites WHERE store_number = ? AND user_id = ?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, storeNumber);
			pstmt.setString(2, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				StoreVO svo = new StoreVO();
				svo.setStoreNumber(storeNumber);
				MemberVO mvo = new MemberVO();
				mvo.setUserId(userid);
				
				fvo = new FavoritesVO(svo,mvo,rs.getString(3));
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return fvo;
	}

	public void favoritesInsertYN(int storeNumber, String userid) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		FavoritesVO fvo = favoritesChecker(storeNumber,userid);
		
		try {
			if(fvo == null) {
				String sql = "INSERT INTO favorites VALUES (?,?,'Y')";
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, storeNumber);
				pstmt.setString(2, userid);
				pstmt.executeUpdate();
			}else if(String.valueOf(fvo.getFavorites()).equals("Y")) {
				String sql = "UPDATE favorites SET favorites = 'N' WHERE store_number = ? AND user_id = ?";
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, storeNumber);
				pstmt.setString(2, userid);
				pstmt.executeUpdate();
			}else if(String.valueOf(fvo.getFavorites()).equals("N")) {
				String sql = "UPDATE favorites SET favorites = 'Y' WHERE store_number = ? AND user_id = ?";
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, storeNumber);
				pstmt.setString(2, userid);
				pstmt.executeUpdate();
			}
		}finally {
			closeAll(pstmt, con);
		}
	}
	
	


}
