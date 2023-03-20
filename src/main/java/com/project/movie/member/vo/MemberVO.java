package com.project.movie.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

//�������̽� ������
@Component("memberVO")
public class MemberVO {

	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_hp1;
	private String member_hp2;
	private String member_hp3;
	private Date joinDate;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_hp1() {
		return member_hp1;
	}

	public void setMember_hp1(String member_hp1) {
		this.member_hp1 = member_hp1;
	}

	public String getMember_hp2() {
		return member_hp2;
	}

	public void setMember_hp2(String member_hp2) {
		this.member_hp2 = member_hp2;
	}

	public String getMember_hp3() {
		return member_hp3;
	}

	public void setMember_hp3(String member_hp3) {
		this.member_hp3 = member_hp3;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_pw=" + member_pw + ", member_name=" + member_name
				+ ", member_hp1=" + member_hp1 + ", member_hp2=" + member_hp2 + ", member_hp3=" + member_hp3
				+ ", joinDate=" + joinDate + "]";
	}

}
