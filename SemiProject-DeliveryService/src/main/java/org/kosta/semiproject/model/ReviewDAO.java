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
	/*
	SELECT r.review_no,r.review_content, r.review_insertdate,r.user_id
	FROM ( 
	SELECT 
	ROW_NUMBER() OVER(PARTITION BY store_number ORDER BY review_insertdate DESC) 
	AS rnumdate, review_no,review_content, review_insertdate, store_number, user_id FROM review
	) r
	INNER JOIN store s ON r.store_number = s.store_number
	WHERE r.store_number = 3
	AND rnumdate BETWEEN 1 AND 8
	*/
	public ArrayList<ReviewVO> findStoreReviewList(int storeNumber, Pagination pagination) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReviewVO> list = new ArrayList<>();
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT r.review_no,r.review_content, r.review_insertdate, r.user_id ");
			sql.append("FROM ( SELECT ");
			sql.append("ROW_NUMBER() OVER(PARTITION BY store_number ORDER BY review_insertdate DESC) ");
			sql.append("AS rnumdate, review_no,review_content, review_insertdate, store_number, user_id FROM review ) r ");
			sql.append("INNER JOIN store s ON r.store_number = s.store_number ");
			sql.append("WHERE r.store_number = ? ");
			sql.append("AND rnumdate BETWEEN ? AND ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, storeNumber);
			pstmt.setLong(2, pagination.getStartRowNumber());
			pstmt.setLong(3, pagination.getEndRowNumber());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewVO reviewVO = new ReviewVO();
				reviewVO.setReviewNo(rs.getInt("review_no"));
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

	public long findTotalPostCount(int storeNumber) throws SQLException {
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
			sql.append("WHERE s.store_number=?"); 
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, storeNumber);
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

	public void insertReview(ReviewVO reviewVO, int storeNumber) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO review(review_no,review_content,review_insertdate,store_number,user_id) ");
			sql.append("VALUES(review_no_seq.nextval,?,sysdate,?,?)");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, reviewVO.getReviewContent());
			pstmt.setInt(2, storeNumber);
			pstmt.setString(3,reviewVO.getMemberVO().getUserId());
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}

	public void deleteReview(int reviewNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "DELETE FROM review WHERE review_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}

	public void updateReviewpost(ReviewVO review) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "UPDATE review SET review_content=? WHERE review_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, review.getReviewContent());
			pstmt.setInt(2, review.getReviewNo());
			pstmt.executeUpdate();
		} finally {
			// TODO: handle finally clause
			closeAll(pstmt, con);
		}
	}

	public ReviewVO findReviewPostByNo(int review_no) throws SQLException {
		ReviewVO review = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT r.review_no, r.review_content, r.review_insertdate,r.store_number,m.user_id ");
			sql.append("FROM review r ");
			sql.append("INNER JOIN member m ON r.user_id = m.user_id ");
			sql.append("where r.review_no = ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, review_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				review = new ReviewVO();
				review.setReviewNo(rs.getInt("review_no"));
				review.setReviewContent(rs.getString("review_content"));
				review.setReviewInsertDate(rs.getString("review_insertdate"));
				StoreVO store = new StoreVO();
				store.setStoreNumber(rs.getInt("store_number"));
				review.setStoreVO(store);
				MemberVO member = new MemberVO();
				member.setUserId(rs.getString("user_id"));
				review.setMemberVO(member);
			}
		} finally {
			// TODO: handle finally clause
			closeAll(rs, pstmt, con);
		}
		return review;
	}
}
