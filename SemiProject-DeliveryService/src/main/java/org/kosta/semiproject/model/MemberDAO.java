package org.kosta.semiproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	private DataSource dataSource;

	private MemberDAO() {
		this.dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static MemberDAO getInstance() {
		return instance;
	}

	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		closeAll(pstmt, con);
	}

	public void register(MemberVO vo) throws SQLException { // 회원가입
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "INSERT INTO member(user_id,password,user_name,email,address,add_detail,user_phone,user_birth,user_type) VALUES (?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getUserPassword());
			pstmt.setString(3, vo.getUserName());
			pstmt.setString(4, vo.getUserEmail());
			pstmt.setString(5, vo.getUserAddress());
			pstmt.setString(6, vo.getUserAddDetail());
			pstmt.setString(7, vo.getUserPhone());
			pstmt.setString(8, vo.getUserBirth());
			pstmt.setInt(9, vo.getUserType());
			pstmt.executeUpdate();

		} finally {
			// TODO: handle finally clause
			closeAll(pstmt, con);
		}
	}

	public MemberVO login(String user_id, String password) throws SQLException {
		MemberVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "SELECT user_id,user_name FROM member WHERE user_id=? AND password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new MemberVO(rs.getString(1), null, rs.getString(2), null, null, null, null, null, 0, null);
			}
		} finally {
			// TODO: handle finally clause
			closeAll(rs, pstmt, con);
		}
		return vo;
	}

	public MemberVO findMember(String user_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		try {
			con = dataSource.getConnection();	
			String sql = "SELECT USER_NAME FROM MEMBER WHERE USER_ID= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new MemberVO(null, null, rs.getString(1), null, null, null, null, null, 0, null);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return vo;
	}

	public int updateMember(MemberVO mvo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = -1;
		String sql = "UPDATE member SET password = ?, user_phone = ?, email = ?, address = ?, add_detail=? WHERE user_id = ?";
		// 회원정보 (비밀번호, 이메일, 번호, 주소 수정)
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo.getUserPassword());
			pstmt.setString(2, mvo.getUserPhone());
			pstmt.setString(3, mvo.getUserEmail());
			pstmt.setString(4, mvo.getUserAddress());
			pstmt.setString(5, mvo.getUserAddDetail());
			pstmt.setString(6, mvo.getUserId());
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean deleteMember(String id) throws SQLException {
		boolean flag = false;

		String sql = "DELETE FROM member WHERE user_id=?";

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			int i = pstmt.executeUpdate();

			if (i == 1) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(pstmt, con);
		}
		return flag;
	}
}