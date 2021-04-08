package com.kam.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class HomeController {

	@RequestMapping(value="index")	
	public String index() {
		
		return "product/list_product";
	}
	
	@RequestMapping(value="ready")	
	public String ready() {
		
		return "temp/layout2";
	}
//	public String index() {
//		return "root.index";
//	}
	
	
//	@Override
//	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		// TODO Auto-generated method stub
//		
//		ModelAndView mv = new ModelAndView("root.index");
//		mv.addObject("data","Hello mvc");
////		mv.setViewName("root.index");
//		return mv;
//	}
	
}
