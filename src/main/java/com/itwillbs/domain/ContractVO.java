package com.itwillbs.domain;

import java.sql.Date;

public class ContractVO {

	private String cont_id;
	private String product_name;
	private String product_id;
	private String cust_name;
	private String cust_id;
	private Date cont_date;
	private Integer cont_qty;
	private String production_id;
	private Date due_date;
	private String cont_emp;
	private Integer cont_status;
	private String emp_tel;
	
	private PagingVO pagingVO;
	
	
	public String getCont_id() {
		return cont_id;
	}
	public void setCont_id(String cont_id) {
		this.cont_id = cont_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public Date getCont_date() {
		return cont_date;
	}
	public void setCont_date(Date cont_date) {
		this.cont_date = cont_date;
	}
	public Integer getCont_qty() {
		return cont_qty;
	}
	public void setCont_qty(Integer cont_qty) {
		this.cont_qty = cont_qty;
	}
	public Date getDue_date() {
		return due_date;
	}
	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}
	public String getCont_emp() {
		return cont_emp;
	}
	public void setCont_emp(String cont_emp) {
		this.cont_emp = cont_emp;
	}
	public Integer getCont_status() {
		return cont_status;
	}
	public void setCont_status(Integer cont_status) {
		this.cont_status = cont_status;
	}
	public String getProduction_id() {
		return production_id;
	}
	public void setProduction_id(String production_id) {
		this.production_id = production_id;
	}
	public PagingVO getPagingVO() {
		return pagingVO;
	}
	public void setPagingVO(PagingVO pagingVO) {
		this.pagingVO = pagingVO;
	}
	public String getEmp_tel() {
		return emp_tel;
	}
	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}
	@Override
	public String toString() {
		return "ContractVO [cont_id=" + cont_id + ", product_name=" + product_name + ", product_id=" + product_id
				+ ", cust_name=" + cust_name + ", cust_id=" + cust_id + ", cont_date=" + cont_date + ", cont_qty="
				+ cont_qty + ", production_id=" + production_id + ", due_date=" + due_date + ", cont_emp=" + cont_emp
				+ ", cont_status=" + cont_status + ", emp_tel=" + emp_tel + ", pagingVO=" + pagingVO + "]";
	}
	 
	
	
}
