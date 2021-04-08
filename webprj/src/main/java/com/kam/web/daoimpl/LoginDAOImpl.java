package com.kam.web.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kam.web.conn.DBConn;
import com.kam.web.dao.LoginDAO;
import com.kam.web.entity.Member;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private DataSource dataSource;

	// 회원을 등록한다.
	@Override
	public void insertMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConn.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO MEMBER(M_NO, M_ID, M_PWD,  M_ADDRESS, ");
			sql.append("M_NAME, M_PHONE, M_SSN, M_GENDER, M_EMAIL) VALUES(");
			sql.append("MEMBER_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, member.getmId());
			pstmt.setString(2, member.getmPwd());
			pstmt.setString(3, member.getmAddress());
			pstmt.setString(4, member.getmName());
			pstmt.setString(5, member.getmPhone());
			pstmt.setString(6, member.getmSsn());
			pstmt.setString(7, member.getmGender());
			pstmt.setString(8, member.getmEmail());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
	}

	// 회원정보를 조회한다.
	@Override
	public ArrayList<Member> getMemberList() {
		ArrayList<Member> members = new ArrayList<Member>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			stmt = conn.createStatement();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT M_NO, M_ID, M_PWD,  M_ADDRESS, ");
			sql.append("M_NAME, M_PHONE, M_SSN, M_GENDER, M_EMAIL ");
			sql.append("FROM MEMBER");
			rs = stmt.executeQuery(sql.toString());
			while (rs.next()) {
				Member member = new Member();
				member.setmNo(rs.getInt(1));
				member.setmId(rs.getString(2));
				member.setmPwd(rs.getString(3));
				member.setmAddress(rs.getString(4));
				member.setmName(rs.getString(5));
				member.setmPhone(rs.getString(6));
				member.setmSsn(rs.getString(7));
				member.setmGender(rs.getString(8));
				member.setmEmail(rs.getString(9));
				members.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return members;
	}

	// 회원 정보 수정
	@Override
	public void updateMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConn.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE PRODUCT SET M_ID=?, M_PWD=?, M_ADDRESS=?, ");
			sql.append("M_PHONE=?, M_GENDER=?, M_EMAIL ");
			sql.append("WHERE M_NO=?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, member.getmId());
			pstmt.setString(2, member.getmPwd());
			pstmt.setString(3, member.getmAddress());
			pstmt.setString(4, member.getmPhone());
			pstmt.setString(5, member.getmGender());
			pstmt.setString(6, member.getmEmail());
			pstmt.setInt(7, member.getmNo());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
	}

	// 회원 삭제
	@Override
	public void removeMember(int mNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConn.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM orders ");
			sql.append("WHERE M_NO=?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, mNo);
			pstmt.executeUpdate();

			pstmt.close();
			sql.delete(0, sql.length());

			sql.append("DELETE FROM MEMBER ");
			sql.append("WHERE M_NO=?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, mNo);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
	}

	// 회원 상세 조회
	@Override
	public Member getMember(int mNo) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM MEMBER WHERE M_NO=" + mNo;
//				sql.append("SELECT M_NO, M_ID, M_PWD,  M_ADDRESS, ");
//				sql.append("M_NAME, M_PHONE, M_SSN, M_GENDER, M_EMAIL ");
//				sql.append("FROM MEMBER WHERE M_NO=" + mNo);

//				String sql = "SELECT * FROM NOTICE WHERE ID between "+start+" and "+end;
			con = dataSource.getConnection();
			stmt = con.prepareStatement(sql);

			rs = stmt.executeQuery(sql.toString());
			if (rs.next()) {
				Member member = new Member();
				member.setmNo(rs.getInt(1));
				member.setmId(rs.getString(2));
				member.setmPwd(rs.getString(3));
				member.setmAddress(rs.getString(4));
				member.setmName(rs.getString(5));
				member.setmPhone(rs.getString(6));
				member.setmSsn(rs.getString(7));
				member.setmGender(rs.getString(8));
				member.setmEmail(rs.getString(9));
				return member;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return null;
	}

	// 회원 여부를 확인
	@Override
	public Member ssnCheck(String ssn) throws NamingException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append("SELECT M_NO, M_PWD FROM MEMBER ");
			sql.append("WHERE M_SSN=?");

			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, ssn);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				Member member = new Member();
				member.setmNo(rs.getInt(1));
				member.setmPwd(rs.getString(2));
				return member;
			}
		} catch (SQLException sqe) {
			sqe.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException sqe) {
				sqe.printStackTrace();
			}
		}
		return null;
	}

	// 회원 여부를 확인
	@Override
	public Member memberCheck(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT M_SSN, M_PWD, M_NO, M_ID FROM MEMBER where M_ID='" + id + "'";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Member member = new Member();
				member.setmSsn(rs.getString(1));
				member.setmPwd(rs.getString(2));
				member.setmNo(rs.getInt(3));
				member.setmId(rs.getString(4));
				return member;
			}
		} catch (SQLException sqe) {
			sqe.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException sqe) {
				sqe.printStackTrace();
			}
		}
		return null;
	}	

	// 로그인
	@Override
	public Member login(String mId, String mPwd) throws ClassNotFoundException, SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();		
			System.out.println(mId+","+mPwd);
			String sql = "SELECT M_ID, M_NAME FROM MEMBER WHERE M_ID='" + mId+"' AND M_PWD='"+mPwd+"'";
			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Member member = new Member();
				member.setmId(rs.getString(1));				
				member.setmName(rs.getString(2));
				return member;
			}
//			
//			stmt = con.prepareStatement(sql);
//			rs = stmt.executeQuery();
//			if (rs.next()) {
//				Member member = new Member();				
//				member.setmId(rs.getString(1));				
//				System.out.println("login>>>>"+member.getmId());
//				return member.getmId();
//			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return null;
	}

}
