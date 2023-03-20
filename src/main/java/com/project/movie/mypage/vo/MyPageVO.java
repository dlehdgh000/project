package com.project.movie.mypage.vo;

public class MyPageVO {

	private String member_id;
	private String beginDate;
	private String endDate;

	public MyPageVO(String member_id, String beginDate, String endDate) {
		super();
		this.member_id = member_id;
		this.beginDate = beginDate;
		this.endDate = endDate;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}