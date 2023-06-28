package org.kosta.semiproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	private DataSource dataSource;

	private MemberDAO() {
		this.dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
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

	public MemberVO login(String user_id, String password, String user_state) throws SQLException {
		MemberVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "SELECT user_id, user_name FROM member WHERE user_id=? AND password=? AND user_state='Y' ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new MemberVO(rs.getString(1), null, rs.getString(2), null, null, null, null, null, 0, "Y");
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
		// 회원정보 (비밀번호, 번호, 이메일, 주소 수정)
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

	public int deleteMember(String id, String password) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPass = ""; // db에서 꺼낸 password 담을 변수
		int result = -1; // 초기화
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement("SELECT password FROM member WHERE user_id=? ");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbPass = rs.getString("password");
				if (dbPass.equals(password)) {// db password와 일치여부
					pstmt.close(); // 첫 번째 pstmt 닫기
					String sql = "UPDATE member SET user_state='N' WHERE user_id = ? ";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					result = 1; // 회원탈퇴 성공
				} else {
					result = 0;
				}
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return result;
	}

	public int checkUser(String id, String password) throws SQLException {
		int check = -1; // 아이디가 없을때 반환
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql = "SELECT * FROM member WHERE user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("password").equals(password)) {
					check = 1; // 아이디와 비밀번호 일치
				} else {
					check = 0; // 비밀번호 불일치
				}
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return check;
	}

	public ArrayList<StoreVO> findLikeStoreListById(String userid) throws SQLException {
//		SELECT S.STORE_NUMBER , S.STORE_NAME , S.STORE_LOCATION , S.STORE_CATEGORY , S.STORE_PHONENUMBER S.STORE_PICTURE_PATH F.FAVORITES
//		FROM STORE S, FAVORITES F
//		WHERE S.STORE_NUMBER = F.STORE_NUMBER 
//		AND F.USER_ID = 'test1'
//		AND FAVORITES = 'Y'
		ArrayList<StoreVO> list = new ArrayList<StoreVO>();
		StoreVO svo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			StringBuilder sb = new StringBuilder();
			sb.append(
					"SELECT S.STORE_NUMBER , S.STORE_NAME , S.STORE_LOCATION , S.STORE_CATEGORY , S.STORE_PHONENUMBER, S.STORE_PICTURE_PATH ");
			sb.append("FROM STORE S, FAVORITES F ");
			sb.append("WHERE S.STORE_NUMBER = F.STORE_NUMBER ");
			sb.append("AND F.USER_ID = ? ");
			sb.append("AND FAVORITES = 'Y'");
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				svo = new StoreVO();
				svo.setStoreNumber(rs.getInt("STORE_NUMBER"));
				svo.setStoreName(rs.getString("STORE_NAME"));
				svo.setStoreLocation(rs.getString("STORE_LOCATION"));
				svo.setStoreCategory(rs.getString("STORE_CATEGORY"));
				svo.setStorePhoneNumber(rs.getString("STORE_PHONENUMBER"));
				svo.setStorePicturePath(rs.getString("STORE_PICTURE_PATH"));
				list.add(svo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
}