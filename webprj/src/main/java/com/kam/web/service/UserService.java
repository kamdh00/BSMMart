package com.kam.web.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kam.web.entity.Member;

public interface UserService {

	List<Member> getList(int page, String field, String query) throws ClassNotFoundException, SQLException;
	
	void insertMember(Member member) throws SQLException, ClassNotFoundException;	
	void updateMember(Member member) throws SQLException, ClassNotFoundException;
	void modifyMember(Member member) throws SQLException, ClassNotFoundException;
	void removeMember(int mNo) throws ClassNotFoundException, SQLException;
	Member getMember(int mNo) throws ClassNotFoundException, SQLException;
	Member ssnCheck(String ssn) throws ClassNotFoundException, SQLException;
	Member memberCheck(String id) throws ClassNotFoundException, SQLException;
	ArrayList<Member> getMemberList() throws ClassNotFoundException, SQLException;
}
