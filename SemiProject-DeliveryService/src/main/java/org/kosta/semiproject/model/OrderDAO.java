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

	public int order(OrderVO ovo, String address) throws SQLException {
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
			pstmt.setString(3, address);
			pstmt.setString(4, ovo.getMemberVO().getUserId());
			result = pstmt.executeUpdate();
			System.out.println("result: "+result);
		} finally {
			closeAll(pstmt, con);
		}
		return result;
	}
	
	public void orderDetail(int orderno ,int cartno) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("INSERT INTO CART_ORDER_MAPPING ");
			sb.append("VALUES(? , ?)");
			pstmt =con.prepareStatement(sb.toString());
			pstmt.setInt(1, orderno);
			pstmt.setInt(2, cartno);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}
	
	public int maxOrderNo() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int max = 0;
		try {
			String sql = "SELECT max(ORDER_NO) FROM  ORDER_FOOD";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				max = rs.getInt(1);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return max;
	}
	
	public ArrayList<OrderVO> OrderList(String userId) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();
		OrderVO ovo = null;
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT O.ORDER_LOCATION , O.TOTAL_PRICE , TO_CHAR(O.ORDER_DATE, 'YYYY-MM-DD HH24:MI:SS') AS ORDER_DATE, O.ORDER_SUCCESS ");
			sb.append("FROM ORDER_FOOD O ");
			sb.append("WHERE O.USER_ID = ? ");
			sb.append("ORDER BY ORDER_DATE DESC");
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ovo = new OrderVO();
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
	
//	public ArrayList<OrderVO> myOrderList(String userId) throws SQLException{
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		ArrayList<OrderVO> list = new ArrayList<OrderVO>();
//		OrderVO ovo = null;
//		try {
//			StringBuilder sb = new StringBuilder();
//			sb.append("SELECT S.STORE_NAME , O.ORDER_LOCATION , O.TOTAL_PRICE , TO_CHAR(O.ORDER_DATE, 'YYYY-MM-DD HH24:MI:SS') AS ORDER_DATE, O.ORDER_SUCCESS ");
//			sb.append("FROM ORDER_FOOD O, STORE S, CART C, STORE_FOOD SF ");
//			sb.append("WHERE O.USER_ID = C.USER_ID ");
//			sb.append("AND C.FOOD_NAME = SF.FOOD_NAME ");
//			sb.append("AND SF.STORE_NUMBER  = S.STORE_NUMBER ");
//			sb.append("AND O.USER_ID = ? ");
//			sb.append("GROUP BY S.STORE_NAME , O.ORDER_LOCATION , O.TOTAL_PRICE , TO_CHAR(O.ORDER_DATE, 'YYYY-MM-DD HH24:MI:SS') , O.ORDER_SUCCESS ");
//			sb.append("ORDER BY ORDER_DATE DESC");
//			con = dataSource.getConnection();
//			pstmt = con.prepareStatement(sb.toString());
//			pstmt.setString(1, userId);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				ovo = new OrderVO();
//				StoreVO svo = new StoreVO();
//				svo.setStoreName(rs.getString("STORE_NAME"));
//				ovo.setStoreVO(svo);
//				ovo.setOrderLocation(rs.getString("ORDER_LOCATION"));
//				ovo.setTotalPrice(rs.getInt("TOTAL_PRICE"));
//				ovo.setOrderDate(rs.getString("ORDER_DATE"));
//				ovo.setOrderSuccess(rs.getString("ORDER_SUCCESS"));
//				list.add(ovo);
//			}
//		} finally {
//			closeAll(rs, pstmt, con);
//		}
//		return list;
//	}
	public ArrayList<OrderVO> myOrderList(String userId) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();
		OrderVO ovo = null;
		try {
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT S.STORE_NAME , O.ORDER_LOCATION , O.TOTAL_PRICE , TO_CHAR(O.ORDER_DATE, 'YYYY-MM-DD HH24:MI:SS') AS ORDER_DATE, O.ORDER_SUCCESS ");
			sb.append("FROM ORDER_FOOD O ");
			sb.append("INNER JOIN CART_ORDER_MAPPING CO ON O.ORDER_NO = CO.ORDER_NO ");
			sb.append("INNER JOIN CART C ON CO.CART_NO = C. CART_NO ");
			sb.append("INNER JOIN STORE_FOOD SF ON C.FOOD_NAME = SF.FOOD_NAME ");
			sb.append("INNER JOIN STORE S ON SF.STORE_NUMBER = S.STORE_NUMBER ");
			sb.append("WHERE O.USER_ID = ? ");
			sb.append("ORDER BY O.ORDER_DATE DESC");
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