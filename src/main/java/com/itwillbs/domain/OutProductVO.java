package com.itwillbs.domain;
import java.sql.Date;



public class OutProductVO {
	
	// out_product
    private String op_id;
    private String product_id;
    private String cont_id;
    private String op_process;
    private Date op_date;
    private int op_emp;
    
    // production
    private String production_id;
    private String production_date;
    
    // product
    private String product_name;
    private String product_qty;
    
    // contract
    private Date due_date;
    private int cont_qty;
    private String cust_name;
    
    
    // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ getter & setter ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
    
    // out_product
	public String getCont_id() {
		return cont_id;
	}
	public void setCont_id(String cont_id) {
		this.cont_id = cont_id;
	}
    public String getOp_id() {
		return op_id;
	}
	public void setOp_id(String op_id) {
		this.op_id = op_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Date getOp_date() {
		return op_date;
	}
	public void setOp_date(Date op_date) {
		this.op_date = op_date;
	}
	public String getOp_process() {
		return op_process;
	}
	public void setOp_process(String op_process) {
		this.op_process = op_process;
	}
	public int getOp_emp() {
		return op_emp;
	}
	public void setOp_emp(int op_emp) {
		this.op_emp = op_emp;
	}
	

	// production
	public String getProduction_id() {
		return production_id;
	}
	public void setProduction_id(String production_id) {
		this.production_id = production_id;
	}
	public String getProduction_date() {
		return production_date;
	}
	public void setProduction_date(String production_date) {
		this.production_date = production_date;
	}
	

	// product
	public String getProduct_qty() {
		return product_qty;
	}
	public void setProduct_qty(String product_qty) {
		this.product_qty = product_qty;
	}
	

	// contract
	public Date getDue_date() {
		return due_date;
	}
	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}
	public int getCont_qty() {
		return cont_qty;
	}
	public void setCont_qty(int cont_qty) {
		this.cont_qty = cont_qty;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	
	
	// toString
	@Override
	public String toString() {
		return "OutProductVO [op_id=" + op_id + ", product_id=" + product_id + ", cont_id=" + cont_id + ", op_process="
				+ op_process + ", op_date=" + op_date + ", op_emp=" + op_emp + ", production_id=" + production_id
				+ ", production_date=" + production_date + ", product_name=" + product_name + ", product_qty="
				+ product_qty + ", due_date=" + due_date + ", cont_qty=" + cont_qty + ", cust_name=" + cust_name + "]";
	}

}
