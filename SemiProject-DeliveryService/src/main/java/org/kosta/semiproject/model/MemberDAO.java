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

	public void register(MemberVO memberVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "insert into member(userId, password, name, address) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			MemberVO mvo = new MemberVO();
			pstmt.setString(1, mvo.getUserId());
			pstmt.setString(2, mvo.getUserPassword());
			pstmt.setString(3, mvo.getUserName());
			pstmt.setString(4, mvo.getUserEmail());
			pstmt.setString(5, mvo.getUserAddress());
			pstmt.setString(6, mvo.getUserAddDetail());
			pstmt.setInt(7, mvo.getUserPhone());
			pstmt.setString(8, mvo.getUserBirth());
			pstmt.setInt(9, mvo.getUserType());
			int result = pstmt.executeUpdate();
			System.out.println("register member insert row count: " + result);
		} finally {
			closeAll(pstmt, con);
		}
	}

	public MemberVO login(String id, String password) throws SQLException {
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "SELECT name, address from MEMBER where id=? and password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				MemberVO mvo = new MemberVO();
				mvo.setUserId(rs.getString("user_id"));
				mvo.setUserPassword(rs.getString("password"));
				mvo.setUserName(rs.getString("user_name"));
				mvo.setUserId(rs.getString("email"));
				mvo.setUserAddress(rs.getString("address"));
				mvo.setUserAddDetail(rs.getString("add_detail"));
				mvo.setUserPhone(rs.getInt("user_phone"));
				mvo.setUserBirth(rs.getString("user_birth"));
				mvo.setUserType(rs.getInt("user_type"));
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return memberVO;
	}

	public void updateMember(MemberVO memberVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "UPDATE member SET password=?, name=?, address=? WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberVO.getUserPassword());
			pstmt.setString(2, memberVO.getUserName());
			pstmt.setString(3, memberVO.getUserAddress());
			pstmt.setString(4, memberVO.getUserId());
			int result = pstmt.executeUpdate();
			System.out.println("register member update row count:" + result);
		} finally {
			closeAll(pstmt, con);
		}
	}

	public int checkId(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			con = dataSource.getConnection();
			String sql = "select count(*) from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt(1);
		} finally {
			closeAll(rs, pstmt, con);
		}
		return result;
	}

	public int getTotalMemberCount() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "select count(*) from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public MemberVO findMemberId(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		try {
			con = dataSource.getConnection();
			String sql = "SELECT name, userPhone from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				MemberVO mvo = new MemberVO();
				mvo.setUserId(rs.getString("user_id"));
				mvo.setUserPassword(rs.getString("password"));
				mvo.setUserName(rs.getString("user_name"));
				mvo.setUserId(rs.getString("email"));
				mvo.setUserAddress(rs.getString("address"));
				mvo.setUserAddDetail(rs.getString("add_detail"));
				mvo.setUserPhone(rs.getInt("user_phone"));
				mvo.setUserBirth(rs.getString("user_birth"));
				mvo.setUserType(rs.getInt("user_type"));
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return vo;
	}

	public MemberVO findMemberPassword(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		try {
			con = dataSource.getConnection();
			String sql = "SELECT userId, name, userPhone from member where password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				MemberVO mvo = new MemberVO();
				mvo.setUserId(rs.getString("user_id"));
				mvo.setUserPassword(rs.getString("password"));
				mvo.setUserName(rs.getString("user_name"));
				mvo.setUserId(rs.getString("email"));
				mvo.setUserAddress(rs.getString("address"));
				mvo.setUserAddDetail(rs.getString("add_detail"));
				mvo.setUserPhone(rs.getInt("user_phone"));
				mvo.setUserBirth(rs.getString("user_birth"));
				mvo.setUserType(rs.getInt("user_type"));
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return vo;
	}
}
