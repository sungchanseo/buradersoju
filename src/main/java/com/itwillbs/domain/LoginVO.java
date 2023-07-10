package com.itwillbs.domain;

import java.sql.Timestamp;

public class LoginVO {
	private String emp_id;
	private String emp_pw;
	private String emp_name;
	private String emp_email;
	private String emp_department;
	private Timestamp regdate;
	private Timestamp updatedate;
	private String emp_image;

	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_pw() {
		return emp_pw;
	}
	public void setEmp_pw(String emp_pw) {
		this.emp_pw = emp_pw;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
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
	public String getEmp_department() {
		return emp_department;
	}
	public void setEmp_department(String emp_department) {
		this.emp_department = emp_department;
	}
	
	public String getEmp_image() {
		return emp_image;
	}
	public void setEmp_image(String emp_image) {
		this.emp_image = emp_image;
	}
	@Override
	public String toString() {
		return "LoginVO [emp_id=" + emp_id + ", emp_pw=" + emp_pw + ", emp_name=" + emp_name + ", emp_email="
				+ emp_email + ", emp_department=" + emp_department + ", regdate=" + regdate + ", updatedate="
				+ updatedate + ", emp_image=" + emp_image + "]";
	}
	
		
	
	
}
