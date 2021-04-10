package com.kam.web.vo;

public class ProductVO implements Comparable<ProductVO>{
	private int pNo;//상품 번호
	private int cNo;//상품 분류 번호
	private String pName;//상품명
	private String pImgName;//상품 이미지명
	private int pPrice;//상품 가격
	private String pCompany;//제조사명
	private String pImgUrl;//상품 이미지 경로
	private int pQuantity;//상품 재고 수량
	private String pDetail;//상품 상세 설명
	private String pImgDetail;//상품 상세 이미지
	private int pRank;	// 상품 검색 순위

	public String getpImgName() {
		return pImgName;
	}

	public void setpImgName(String string) {
		this.pImgName = string;
	}

	public String getpImgUrl() {
		return pImgUrl;
	}

	public void setpImgUrl(String pImgUrl) {
		this.pImgUrl = pImgUrl;
	}
	
	public ProductVO(){
		
	}
	
	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getpCompany() {
		return pCompany;
	}

	public void setpCompany(String pCompany) {
		this.pCompany = pCompany;
	}

	public int getpQuantity() {
		return pQuantity;
	}

	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}

	public String getpDetail() {
		return pDetail;
	}

	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}

	public String getpImgDetail() {
		return pImgDetail;
	}

	public void setpImgDetail(String pImgDetail) {
		this.pImgDetail = pImgDetail;
	}

	public int getpRank() {
		return pRank;
	}

	public void setpRank(int pRank) {
		this.pRank = pRank;
	}

	@Override
	public int compareTo(ProductVO o) {		
		return this.getpRank() > o.getpRank()? -1 : 0;
	}
	
	
}
