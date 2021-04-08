package com.kam.web.vo;

public class ProductImgVO {
	private int pINo;
	private int pNo;
	private int cNo;
	private String pIName;
	private String pITempName;
	private long pIFileSize;
	
	public ProductImgVO() {
	}

	public int getpINo() {
		return pINo;
	}

	public void setpINo(int pINo) {
		this.pINo = pINo;
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

	public String getpIName() {
		return pIName;
	}

	public void setpIName(String pIName) {
		this.pIName = pIName;
	}

	public String getpITempName() {
		return pITempName;
	}

	public void setpITempName(String pITempName) {
		this.pITempName = pITempName;
	}

	public long getpIFileSize() {
		return pIFileSize;
	}

	public void setpIFileSize(long pIFileSize) {
		this.pIFileSize = pIFileSize;
	}
}
