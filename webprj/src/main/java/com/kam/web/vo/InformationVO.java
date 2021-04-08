package com.kam.web.vo;

public class InformationVO {
	private int iNo;
	private String iTitle;
	private String iContent;	
	private String iPwd;
	private String iWriteday;
	private String iWriter;
		
	public InformationVO() {
		
	}

	public int getiNo() {
		return iNo;
	}

	public void setiNo(int iNo) {
		this.iNo = iNo;
	}

	public String getiTitle() {
		return iTitle;
	}

	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}

	public String getiContent() {
		return iContent;
	}

	public void setiContent(String iContent) {
		this.iContent = iContent;
	}

	public String getiPwd() {
		return iPwd;
	}

	public void setiPwd(String iPwd) {
		this.iPwd = iPwd;
	}

	public String getiWriteday() {
		return iWriteday;
	}

	public void setiWriteday(String iWriteday) {
		this.iWriteday = iWriteday;
	}

	public String getiWriter() {
		return iWriter;
	}

	public void setiWriter(String iWriter) {
		this.iWriter = iWriter;
	}
	
}
