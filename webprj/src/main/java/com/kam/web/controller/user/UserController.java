package com.kam.web.controller.user;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kam.web.dao.LoginDAO;
import com.kam.web.entity.Member;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Autowired
	private LoginDAO loginDAO;
	
	@RequestMapping("login")
	public String login() {
		
		return "user/login";
	}
	
	@RequestMapping("loginSelect")
	@ResponseBody
	public Map login(String mId, String mPwd, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		System.out.println("loginSelect 들어옴");
		Member m = loginDAO.login(mId, mPwd);
		Map map = new HashMap();
		map.put("id", m.getmId());
		map.put("name", m.getmName());
		
//		request.getSession().setAttribute("loginId", m.getmId());
		HttpSession session = request.getSession();
		session.setAttribute("loginId", m.getmId());
		session.setAttribute("loginName", m.getmName());
		return map;
	}
	
	@RequestMapping("memberCheck")
	@ResponseBody
	public Member memberCheck(String mId, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		System.out.println("memberCheck 들어옴");
		Member m = loginDAO.memberCheck(mId);
		return m;
	}
	
	@RequestMapping("logout")
	@ResponseBody
	public void logout(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		System.out.println("logout 들어옴");		
		HttpSession session = request.getSession();
		session.invalidate();		
	}
	
	@RequestMapping("getMember")
	@ResponseBody
	public Member check(String id) throws ClassNotFoundException, SQLException {
		Member mb = loginDAO.memberCheck(id);
		return mb;
	}
}
