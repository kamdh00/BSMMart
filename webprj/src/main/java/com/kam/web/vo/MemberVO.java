package com.kam.web.vo;

import com.kam.web.entity.Member;

public class MemberVO {
	private int mNo;
	private String mId;
	private String mPwd;	
	private String mAddress;
	private String mName;
	private String mPhone;
	private String mSsn;
	private String mGender;
	private String mEmail;
	private static int point;
	
	public MemberVO() {
		
	}


	public int getmNo() {
		return mNo;
	}


	public void setmNo(int mNo) {
		this.mNo = mNo;
	}


	public String getmId() {
		return mId;
	}


	public void setmId(String mId) {
		this.mId = mId;
	}


	public String getmPwd() {
		return mPwd;
	}


	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}


	public String getmAddress() {
		return mAddress;
	}


	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}


	public String getmName() {
		return mName;
	}


	public void setmName(String mName) {
		this.mName = mName;
	}


	public String getmPhone() {
		return mPhone;
	}


	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}


	public String getmSsn() {
		return mSsn;
	}


	public void setmSsn(String mSsn) {
		this.mSsn = mSsn;
	}


	public String getmGender() {
		return mGender;
	}


	public void setmGender(String mGender) {
		this.mGender = mGender;
	}


	public String getmEmail() {
		return mEmail;
	}


	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}


	public static int getPoint() {
		return point;
	}


	public static void setPoint(int point) {
		MemberVO.point = point;
	}
}
