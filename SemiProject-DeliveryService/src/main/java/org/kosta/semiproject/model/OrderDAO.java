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

	public int order(OrderVO ovo, String location) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			con = dataSource.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO ORDER_FOOD ");
			sb.append("VALUES(order_no_seq.NEXTVAL, ?, ?, SYSDATE, ?, ?)");
			pstmt =con.prepareStatement(sb.toString());
			pstmt.setInt(1, ovo.getTotalPrice());
			pstmt.setString(2, "Y");
			pstmt.setString(3, location);
			pstmt.setString(4, ovo.getMemberVO().getUserId());
			result = pstmt.executeUpdate();
			System.out.println("result: "+result);
		} finally {
			closeAll(pstmt, con);
		}
		return result;
	}
	
	public ArrayList<OrderVO> myOrderList(String userId) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();
		OrderVO ovo = null;
		try {
//			SELECT S.STORE_NAME , O.ORDER_LOCATION , O.TOTAL_PRICE , TO_CHAR(O.ORDER_DATE, 'YYYY-MM-DD HH24:MI:SS') AS ORDER_DATE, O.ORDER_SUCCESS 
//			FROM ORDER_FOOD O, STORE S, CART C, STORE_FOOD SF
//			WHERE O.USER_ID = C.USER_ID 
//			AND C.FOOD_NAME = SF.FOOD_NAME 
//			AND SF.STORE_NUMBER  = S.STORE_NUMBER  
//			AND O.USER_ID = 'test1'
//			GROUP BY S.STORE_NAME , O.ORDER_LOCATION , O.TOTAL_PRICE , TO_CHAR(O.ORDER_DATE, 'YYYY-MM-DD HH24:MI:SS') , O.ORDER_SUCCESS
//			ORDER BY ORDER_DATE DESC;
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT S.STORE_NAME , O.ORDER_LOCATION , O.TOTAL_PRICE , TO_CHAR(O.ORDER_DATE, 'YYYY-MM-DD HH24:MI:SS') AS ORDER_DATE, O.ORDER_SUCCESS ");
			sb.append("FROM ORDER_FOOD O, STORE S, CART C, STORE_FOOD SF ");
			sb.append("WHERE O.USER_ID = C.USER_ID ");
			sb.append("AND C.FOOD_NAME = SF.FOOD_NAME ");
			sb.append("AND SF.STORE_NUMBER  = S.STORE_NUMBER ");
			sb.append("AND O.USER_ID = ? ");
			sb.append("GROUP BY S.STORE_NAME , O.ORDER_LOCATION , O.TOTAL_PRICE , TO_CHAR(O.ORDER_DATE, 'YYYY-MM-DD HH24:MI:SS') , O.ORDER_SUCCESS ");
			sb.append("ORDER BY ORDER_DATE DESC");
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ovo = new OrderVO();
				
				StoreVO svo = new StoreVO();
				svo.setStoreName(rs.getString("STORE_NAME"));
				
				ovo.setStoreVO(svo);
				ovo.setOrderLocation(rs.getString("ORDER_LOCATION"));
				ovo.setTotalPrice(rs.getInt("TOTAL_PRICE"));
				ovo.setOrderDate(rs.getString("ORDER_DATE"));
				ovo.setOrderSuccess(rs.getString("ORDER_SUCCESS"));
				
				list.add(ovo);
			}
			
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
}