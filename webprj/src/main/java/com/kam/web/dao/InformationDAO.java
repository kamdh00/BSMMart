package com.kam.web.dao;

import java.util.ArrayList;

import com.kam.web.vo.InformationVO;

public interface InformationDAO {
	
	ArrayList<InformationVO> getInformationList();
	InformationVO getInformationDetail(int no);
}
