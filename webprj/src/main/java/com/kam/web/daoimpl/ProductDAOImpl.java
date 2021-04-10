package com.kam.web.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kam.web.conn.DBConn;
import com.kam.web.dao.ProductDAO;
import com.kam.web.vo.ProductImgVO;
import com.kam.web.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	private DataSource dataSource;
	
	// 제품 등록
	public void insertProduct(ProductVO product){
		Connection conn=null;
		PreparedStatement pstmt=null;		
		try{
			conn=DBConn.getConnection();
			StringBuffer sql=new StringBuffer();
			sql.append("INSERT INTO PRODUCT(P_NO, C_NO, P_NAME, ");
			sql.append("P_PRICE, P_COMPANY, P_QUANTITY) VALUES(");
			sql.append("?, ?, ?, ?, ?, ?)");
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setInt(1, product.getpNo());
			pstmt.setInt(2, product.getcNo());
			pstmt.setString(3, product.getpName());
			pstmt.setInt(4, product.getpPrice());
			pstmt.setString(5, product.getpCompany());
			pstmt.setInt(6, product.getpQuantity());
			pstmt.executeUpdate();
			pstmt.close();
		
			sql.delete(0, sql.length());
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			catch(SQLException se){
				se.printStackTrace();
			}
		}
	}
	
	// 제품 리스트 출력
	@Override
	public ArrayList<ProductVO> getProductList(int categoryNo){
		// 제품의 이름,가격을 조회하여 제품리스트(products)객체에 추가한다.
		ArrayList<ProductVO> products=new ArrayList<ProductVO>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			conn = dataSource.getConnection();
			String sql = "SELECT P_NO, P_NAME, P_PRICE, P_IMG_NAME, P_IMG_URL FROM PRODUCT";
			if(categoryNo != 0) {
				sql += " WHERE C_NO = "+categoryNo;
			}
			
			pstmt = conn.prepareStatement(sql);			
//			sql.append("SELECT P_NO, P_NAME, P_PRICE ");
//			sql.append("FROM PRODUCT ");			
			
			rs=pstmt.executeQuery(sql.toString());
			while(rs.next()){
				ProductVO product=new ProductVO();
				product.setpNo(rs.getInt(1));
				product.setpName(rs.getString(2));
				product.setpPrice(rs.getInt(3));
				product.setpImgName(rs.getString(4));
				if(rs.getString(5).startsWith("//")) {
					product.setpImgUrl(rs.getString(5).replace("//", "https://"));
				}else {
					product.setpImgUrl(rs.getString(5));
				}				
				
				products.add(product);			
			}		 
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			catch(SQLException se){
				se.printStackTrace();
			}
		}
		return products;
	}
	
	// 제품 검색 리스트 출력
		@Override
		public ArrayList<ProductVO> getProductListSearch(String search){
			// 제품의 이름,가격을 조회하여 제품리스트(products)객체에 추가한다.
			ArrayList<ProductVO> products=new ArrayList<ProductVO>();
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try{
				conn = dataSource.getConnection();
				String sql = "SELECT P_NO, P_NAME, P_PRICE, P_IMG_NAME, P_IMG_URL FROM PRODUCT";
				if(!search.equals("")) {
					sql += " WHERE P_NAME like '%"+search+"%'";
				}
				
				pstmt = conn.prepareStatement(sql);			
//				sql.append("SELECT P_NO, P_NAME, P_PRICE ");
//				sql.append("FROM PRODUCT ");			
				
				rs=pstmt.executeQuery(sql.toString());
				while(rs.next()){
					ProductVO product=new ProductVO();
					product.setpNo(rs.getInt(1));
					String name = rs.getString(2);
					int index = 0; 
				    int cnt = 0;
					do{
				      //짧은 문자열의 위치 
				      index = name.indexOf(search, index+search.length()); 
				      //더이상 찾는 문자가 없으면 종료 
				      if(index == -1) break; 
				      //찾은 문자의 위치 출력 
				      //비교횟수 증가 
				      cnt++;
				   }while(true);
					System.out.println(cnt+":"+name);
					if(name.contains(search)) {
						name = name.replaceAll(search, "<span style=color:red>"+search+"</span>");
					}
					product.setpName(name);
					product.setpPrice(rs.getInt(3));
					product.setpImgName(rs.getString(4));
					if(rs.getString(5).startsWith("//")) {
						product.setpImgUrl(rs.getString(5).replace("//", "https://"));
					}else {
						product.setpImgUrl(rs.getString(5));
					}
					product.setpRank(cnt);
					products.add(product);			
				}		 
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				try{
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
				catch(SQLException se){
					se.printStackTrace();
				}
			}
			Collections.sort(products);
			for(ProductVO pv:products) {
				System.out.println(pv.getpRank()+":"+pv.getpName());
			}
			return products;
		}
	
	// 제품 카테고리별 리스트 출력
	public ArrayList<ProductVO> getProductcNoList(int cNo){
		// 제품의 이름,가격을 조회하여 제품리스트(products)객체에 추가한다.
		ArrayList<ProductVO> products=new ArrayList<ProductVO>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			conn=DBConn.getConnection();
			StringBuffer sql=new StringBuffer();			
			sql.append("SELECT P_NO, P_NAME, P_PRICE ");
			sql.append("FROM PRODUCT ");			
			sql.append("WHERE C_NO=?");		
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, cNo);
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				ProductVO product=new ProductVO();
				product.setpNo(rs.getInt(1));
				product.setpName(rs.getString(2));
				product.setpPrice(rs.getInt(3));
				
				//제품번호 지역변수선언
				int no=product.getpNo();
				
				//이미지파일을 제품(product)객체에 추가
				PreparedStatement pstmt2 = null;
				ResultSet rsf=null;
				try{
					//버퍼를 초기화한다.
					sql.delete(0, sql.length());
					//새로운 버퍼내용입력
					sql.append("SELECT PI_NAME ");
					sql.append("FROM PRODUCT_IMG ");
					sql.append("WHERE P_NO=? ");					
//					pstmt2=conn.prepareStatement(sql.toString());
					pstmt2.setInt(1, no);
					
					rsf=pstmt2.executeQuery();
					while(rsf.next()){
						ProductImgVO imgFile=new ProductImgVO();
						imgFile.setpIName(rsf.getString(1));												
//						product.addImgFile(imgFile);//��[�߿�] 
					}
				}
				catch(Exception e){
					e.printStackTrace();
				}
				finally{
					try{
						if(rsf != null) rsf.close();					
					}
					catch(SQLException se){
						se.printStackTrace();
					}
				}
				products.add(product);			
			}		 
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			catch(SQLException se){
				se.printStackTrace();
			}
		}
		return products;
	}
	
	
	
	// 제품 정보 수정
	public void modifyProduct(ProductVO product){
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try{
			conn=DBConn.getConnection();
			StringBuffer sql=new StringBuffer();
			sql.append("UPDATE PRODUCT SET C_NO=?, P_NAME=?, P_PRICE=?, ");
			sql.append("P_COMPANY=?, P_QUANTITY=? ");
			sql.append("WHERE P_NO=?");
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setInt(1, product.getcNo());
			pstmt.setString(2, product.getpName());
			pstmt.setInt(3, product.getpPrice());
			pstmt.setString(4, product.getpCompany());
			pstmt.setInt(5, product.getpQuantity());
			pstmt.setInt(6, product.getpNo());
			pstmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			catch(SQLException se){
				se.printStackTrace();
			}
		}
	}
	
	// 제품 정보 삭제
	public void removeProduct(int pNo){
		Connection conn=null;
		PreparedStatement pstmt=null;		
		try{
			conn=DBConn.getConnection();
			StringBuffer sql=new StringBuffer();
			sql.append("DELETE FROM PRODUCT ");			
			sql.append("WHERE P_NO=?");
			pstmt=conn.prepareStatement(sql.toString());		
			pstmt.setInt(1, pNo);
			pstmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			catch(SQLException se){
				se.printStackTrace();
			}
		}
	}
	
	// 제품 수량 수정
	public void modifyProductQuantity(int pNo, int pQuantity){
		Connection conn=null;
		PreparedStatement pstmt=null;		
		try{
			conn=DBConn.getConnection();
			StringBuffer sql=new StringBuffer();
			sql.append("UPDATE PRODUCT SET P_QUANTITY=? ");			
			sql.append("WHERE P_NO=?");
			pstmt=conn.prepareStatement(sql.toString());			
			pstmt.setInt(1, pQuantity);			
			pstmt.setInt(2, pNo);
			pstmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			catch(SQLException se){
				se.printStackTrace();
			}
		}
	}
	
	// 제품 상세 조회
	public ProductVO getProduct(int productNo){
		ProductVO product=new ProductVO();	
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		Statement stmt=null;
		ResultSet rs=null;
		try{
			conn = dataSource.getConnection();
			String sql = "SELECT P_NO, P_NAME, P_PRICE, P_COMPANY, P_IMG_NAME, P_IMG_URL, P_QUANTITY, C_NO, P_DETAIL, P_IMG_DETAIL";
			sql += " FROM PRODUCT  WHERE P_NO="+productNo;
			
			pstmt = conn.prepareStatement(sql);	
			
			rs=pstmt.executeQuery(sql.toString());
			if(rs.next()){							
				product.setpNo(rs.getInt(1));
				product.setpName(rs.getString(2));
				product.setpPrice(rs.getInt(3));
				product.setpCompany(rs.getString(4));
				product.setpImgName(rs.getString(5));
				product.setpImgUrl(rs.getString(6));
				product.setpQuantity(rs.getInt(7));
				product.setcNo(rs.getInt(8));
				product.setpDetail(rs.getString(9));
				product.setpImgDetail(rs.getString(10));
			}
			rs.close();
			pstmt.close();
			
//			//Buffer Clear
//			sql.delete(0, sql.length());
//			
//			sql.append("SELECT PI_NAME ");
//			sql.append("FROM PRODUCT_IMG ");
//			sql.append("WHERE P_NO=? ");
//			
//			pstmt=conn.prepareStatement(sql.toString());
//			pstmt.setInt(1, productNo);
//			
//			rs=pstmt.executeQuery();
//			while(rs.next()){
//				ProductImgVO imgFile=new ProductImgVO();
//				imgFile.setpIName(rs.getString(1));
//				product.addImgFile(imgFile);//��[�߿�]
//			}
		}
		catch(Exception e){
			e.printStackTrace();			
		}
		finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}
			catch(SQLException se){
				se.printStackTrace();
			}
		}
		return product;
	}
	
	// 제품 전체 번호에 대한  이미지 전체 가져오기
	public ArrayList<ProductImgVO> getProductImg(int pNo){
		ArrayList<ProductImgVO> images=new ArrayList<ProductImgVO>();
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try{
			conn=DBConn.getConnection();
			stmt=conn.createStatement();
			StringBuffer sql=new StringBuffer();
			sql.append("SELECT PI_NAME, PI_TEMPNAME ");			
			sql.append("FROM PRODUCT_IMG ");
			sql.append("WHERE P_NO="+pNo);
					
			rs=stmt.executeQuery(sql.toString());
			while(rs.next()){
				ProductImgVO img=new ProductImgVO();
				img.setpIName(rs.getString(1));
				img.setpITempName(rs.getString(2));
				images.add(img);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}
			catch(SQLException se){
				se.printStackTrace();
			}
		}
		return images;
	}
}
