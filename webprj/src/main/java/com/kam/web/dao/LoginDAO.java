package com.kam.web.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import com.kam.web.entity.Member;

public interface LoginDAO {
	void insertMember(Member member) throws SQLException, ClassNotFoundException;	
	void updateMember(Member member) throws SQLException, ClassNotFoundException;
	void removeMember(int mNo) throws ClassNotFoundException, SQLException;
	Member getMember(int mNo) throws ClassNotFoundException, SQLException;
	Member ssnCheck(String ssn) throws ClassNotFoundException, SQLException, NamingException;
	Member memberCheck(String id) throws ClassNotFoundException, SQLException;
	ArrayList<Member> getMemberList() throws ClassNotFoundException, SQLException;
	Member login(String mId, String mPwd) throws ClassNotFoundException, SQLException;
}
