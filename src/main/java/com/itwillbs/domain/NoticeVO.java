package com.itwillbs.domain;

import java.sql.Timestamp;

public class NoticeVO {
	private Integer notice_id; 
	private String notice_title;
	private String notice_writer;
	private Timestamp notice_regdate;
	private int notice_count;
	private String notice_content;
	private String notice_file;
	
	
	public Integer getNotice_id() {
		return notice_id;
	}


	public void setNotice_id(Integer notice_id) {
		this.notice_id = notice_id;
	}


	public String getNotice_title() {
		return notice_title;
	}


	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}


	public String getNotice_writer() {
		return notice_writer;
	}


	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}


	public Timestamp getNotice_regdate() {
		return notice_regdate;
	}


	public void setNotice_regdate(Timestamp notice_regdate) {
		this.notice_regdate = notice_regdate;
	}


	public int getNotice_count() {
		return notice_count;
	}


	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}


	public String getNotice_content() {
		return notice_content;
	}


	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}


	public String getNotice_file() {
		return notice_file;
	}


	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}


	@Override
	public String toString() {
		return "NoticeVO [notice_id=" + notice_id + ", notice_title=" + notice_title + ", notice_writer="
				+ notice_writer + ", notice_regdate=" + notice_regdate + ", notice_count=" + notice_count
				+ ", notice_content=" + notice_content + ", notice_file=" + notice_file + "]";
	}
	
}
