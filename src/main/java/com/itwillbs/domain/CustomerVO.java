package com.itwillbs.domain;

public class CustomerVO {
	private String cust_id;
	private String cust_name;
	private Integer reg_num;
	private String cust_type;
	private String cust_class;
	private String owner_name;
	private String main_phone;
	private String cust_address;
	private String cust_business;
	private String cust_event;
	private String cust_fax;
	private String cust_homepage;
	private String emp_email;
	private String emp_id;
	private String cust_etc;
	private Integer cust_status;
	
	
	public Integer getReg_num() {
		return reg_num;
	}
	public void setReg_num(Integer reg_num) {
		this.reg_num = reg_num;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getCust_type() {
		return cust_type;
	}
	public void setCust_type(String cust_type) {
		this.cust_type = cust_type;
	}
	public String getCust_class() {
		return cust_class;
	}
	public void setCust_class(String cust_class) {
		this.cust_class = cust_class;
	}
	public String getOwner_name() {
		return owner_name;
	}
	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}
	public String getMain_phone() {
		return main_phone;
	}
	public void setMain_phone(String main_phone) {
		this.main_phone = main_phone;
	}
	public String getCust_address() {
		return cust_address;
	}
	public void setCust_address(String cust_address) {
		this.cust_address = cust_address;
	}
	public String getCust_business() {
		return cust_business;
	}
	public void setCust_business(String cust_business) {
		this.cust_business = cust_business;
	}
	public String getCust_event() {
		return cust_event;
	}
	public void setCust_event(String cust_event) {
		this.cust_event = cust_event;
	}
	public String getCust_fax() {
		return cust_fax;
	}
	public void setCust_fax(String cust_fax) {
		this.cust_fax = cust_fax;
	}
	public String getCust_homepage() {
		return cust_homepage;
	}
	public void setCust_homepage(String cust_homepage) {
		this.cust_homepage = cust_homepage;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getCust_etc() {
		return cust_etc;
	}
	public void setCust_etc(String cust_etc) {
		this.cust_etc = cust_etc;
	}
	public Integer getCust_status() {
		return cust_status;
	}
	public void setCust_status(Integer cust_status) {
		this.cust_status = cust_status;
	}
	@Override
	public String toString() {
		return "CustomerVO [cust_id=" + cust_id + ", cust_name=" + cust_name + ", reg_num=" + reg_num + ", cust_type="
				+ cust_type + ", cust_class=" + cust_class + ", owner_name=" + owner_name + ", main_phone=" + main_phone
				+ ", cust_address=" + cust_address + ", cust_business=" + cust_business + ", cust_event=" + cust_event
				+ ", cust_fax=" + cust_fax + ", cust_homepage=" + cust_homepage + ", emp_email=" + emp_email
				+ ", emp_id=" + emp_id + ", cust_etc=" + cust_etc + ", cust_status=" + cust_status + "]";
	}
	
	
}