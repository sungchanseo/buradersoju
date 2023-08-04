package com.itwillbs.domain;

public class AuthVO {
	
	private String emp_id;
	private String auth;
	
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	@Override
	public String toString() {
		return "AuthVO [emp_id=" + emp_id + ", auth=" + auth + "]";
	}
	
	
}
