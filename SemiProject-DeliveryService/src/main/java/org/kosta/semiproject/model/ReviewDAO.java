package org.kosta.semiproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ReviewDAO {
	private static ReviewDAO instance = new ReviewDAO();
	private DataSource dataSource;

	private ReviewDAO() {
		this.dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static ReviewDAO getInstance() {
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
	
	public ArrayList<ReviewVO> findStoreReviewList(String storeName, Pagination pagination) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReviewVO> list = new ArrayList<>();
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT r.review_content, r.review_insertdate, r.user_id ");
			sql.append("FROM ( SELECT ");
			sql.append("ROW_NUMBER() OVER(ORDER BY review_insertdate DESC) ");
			sql.append("AS rnum, review_content, review_insertdate, store_number, user_id FROM review ) r ");
			sql.append("INNER JOIN store s ON r.store_number = s.store_number ");
			sql.append("WHERE s.store_name = ? ");
			sql.append("AND rnum BETWEEN ? AND ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, storeName);
			pstmt.setLong(2, pagination.getStartRowNumber());
			pstmt.setLong(3, pagination.getEndRowNumber());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewVO reviewVO = new ReviewVO();
				reviewVO.setReviewContent(rs.getString("review_content"));
				reviewVO.setReviewInsertDate(rs.getString("review_insertdate"));
				MemberVO memberVO = new MemberVO();
				memberVO.setUserId(rs.getString("user_id"));
				reviewVO.setMemberVO(memberVO);
				list.add(reviewVO);
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	public long findTotalPostCount(String storeName) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		long totalPostCount=0;
		try {
			con = dataSource.getConnection(); // dbcp 로부터 컨넥션을 빌려온다
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT count(*) "); 
			sql.append("FROM review r "); 
			sql.append("INNER JOIN store s ON r.store_number = s.store_number "); 
			sql.append("WHERE s.store_name=?"); 
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, storeName);
			rs = pstmt.executeQuery();
			if(rs.next())
				totalPostCount = rs.getLong(1);
		}finally {
			closeAll(rs, pstmt, con); // dbcp에 컨넥션을 반납한다.
		}
		return totalPostCount;
	}
	
	/*
	 * INSERT INTO
	 * review(review_no,review_content,review_insertdate,store_number,user_id)
	 * VALUES(review_no_seq.nextval,?,sysdate,?,?);
	 */
	
}
