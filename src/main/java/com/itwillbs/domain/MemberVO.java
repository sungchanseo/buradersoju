package com.itwillbs.domain;

import java.sql.Timestamp;

public class MemberVO {
	private String userid;
	private String userpw;
	private String username;
	private String useremail;
	private Timestamp regdate;
	private Timestamp updatedate;
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}
	MemberVO(String userid, String userpw, String username, String useremail, Timestamp regdate,
			Timestamp updatedate) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.useremail = useremail;
		this.regdate = regdate;
		this.updatedate = updatedate;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Timestamp updatedate) {
		this.updatedate = updatedate;
	}
	
	
	
}
