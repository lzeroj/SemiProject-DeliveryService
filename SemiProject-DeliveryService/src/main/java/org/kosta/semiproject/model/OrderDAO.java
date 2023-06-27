package org.kosta.semiproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			// TODO: handle finally clause
			closeAll(pstmt, con);
		}
		return result;
	}
}