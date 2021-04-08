package com.kam.web.controller.information;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kam.web.dao.InformationDAO;
import com.kam.web.vo.InformationVO;

@Controller
@RequestMapping("/information/")
public class InformationController {
	@Autowired
	private InformationDAO informationDAO;
	
	@RequestMapping("list_information")	// 전체 상품
	public ArrayList<InformationVO> list_product(Model model) throws ClassNotFoundException, SQLException {
		ArrayList<InformationVO> informationList = informationDAO.getInformationList();
		model.addAttribute("informationList", informationList);
		return informationList;
	}
	
	@RequestMapping("detail_information")	// 전체 상품
	public InformationVO detail_information(int no, Model model) throws ClassNotFoundException, SQLException {
		InformationVO informationDetail = informationDAO.getInformationDetail(no);
		model.addAttribute("informationDetail", informationDetail);
		return informationDetail;
	}
	
}
