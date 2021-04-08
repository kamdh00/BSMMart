package com.kam.web.controller.product;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kam.web.dao.ProductDAO;
import com.kam.web.vo.ProductVO;

@Controller
@RequestMapping("/product/")
public class ProductController {
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping("list_product")	// 전체 상품
	public ArrayList<ProductVO> list_product(Model model) throws ClassNotFoundException, SQLException {
		ArrayList<ProductVO> productList = productDAO.getProductList(0);
		model.addAttribute("productList", productList);
		return productList;
	}
	
	@RequestMapping("list_product_clothes")	// 의류
	public ArrayList<ProductVO> list_product_clothes(int cNo, Model model) throws ClassNotFoundException, SQLException {
		ArrayList<ProductVO> productList = productDAO.getProductList(cNo);
		model.addAttribute("productList", productList);
		return productList;
	}
	
	@RequestMapping("list_product_food")	// 식품
	public ArrayList<ProductVO> list_product_food(int cNo, Model model) throws ClassNotFoundException, SQLException {
		ArrayList<ProductVO> productList = productDAO.getProductList(cNo);
		model.addAttribute("productList", productList);
		return productList;
	}
	
	@RequestMapping("list_product_necessity")	// 생활용품	
	public ArrayList<ProductVO> list_product_necessity(int cNo, Model model) throws ClassNotFoundException, SQLException {
		ArrayList<ProductVO> productList = productDAO.getProductList(cNo);
		model.addAttribute("productList", productList);
		return productList;
	}
		
	@RequestMapping("detail_product")	
	public ProductVO detail(Model model,int pNo) throws ClassNotFoundException, SQLException {
		ProductVO product = productDAO.getProduct(pNo);
		model.addAttribute("product", product);
		return product;
	}
		
	@RequestMapping("list_product_json_test")	
	public ArrayList<ProductVO> listTest(Model model) throws ClassNotFoundException, SQLException, JsonProcessingException, IOException {
		ArrayList<ProductVO> productList = productDAO.getProductList(0);
		model.addAttribute("mName",productList.get(0).getpName());
		return productList;
	}
	
	@RequestMapping("list_product_json_test2")
	@ResponseBody
	public ArrayList<ProductVO> listTest2(Model model) throws ClassNotFoundException, SQLException, JsonProcessingException, IOException {
		ArrayList<ProductVO> productList = productDAO.getProductList(0);
		model.addAttribute("jsonObject", productList);
		return productList;
	}
}
