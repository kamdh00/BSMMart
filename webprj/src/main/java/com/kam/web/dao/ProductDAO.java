package com.kam.web.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.kam.web.vo.ProductImgVO;
import com.kam.web.vo.ProductVO;

public interface ProductDAO {
	
	void insertProduct(ProductVO product) throws SQLException, ClassNotFoundException;
	ArrayList<ProductVO> getProductList(int categoryNo) throws SQLException, ClassNotFoundException;
	ArrayList<ProductVO> getProductcNoList(int cNo) throws SQLException, ClassNotFoundException;
	void modifyProduct(ProductVO product) throws SQLException, ClassNotFoundException;
	void removeProduct(int pNo) throws SQLException, ClassNotFoundException;
	void modifyProductQuantity(int pNo, int pQuantity) throws SQLException, ClassNotFoundException;
	ProductVO getProduct(int productNo) throws SQLException, ClassNotFoundException;
	ArrayList<ProductImgVO> getProductImg(int pNo) throws SQLException, ClassNotFoundException;
	ArrayList<ProductVO> getProductListSearch(String search);
}
