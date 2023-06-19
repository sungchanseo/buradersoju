package com.itwillbs.domain;

import java.sql.Date;

public class OutProductVO {
    private String op_id;
    private String product_id;
    private String product_name;
    private Date op_date;
    private String op_progress;
    private int op_qty;
    private String customer_name;
    private int op_empNum;
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
	public String getOp_progress() {
		return op_progress;
	}
	public void setOp_progress(String op_progress) {
		this.op_progress = op_progress;
	}
	public int getOp_qty() {
		return op_qty;
	}
	public void setOp_qty(int op_qty) {
		this.op_qty = op_qty;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public int getOp_empNum() {
		return op_empNum;
	}
	public void setOp_empNum(int op_empNum) {
		this.op_empNum = op_empNum;
	}
	
	@Override
	public String toString() {
		return "OutProduct [op_id=" + op_id + ", product_id=" + product_id + ", product_name=" + product_name
				+ ", op_date=" + op_date + ", op_progress=" + op_progress + ", op_qty=" + op_qty + ", customer_name="
				+ customer_name + ", op_empNum=" + op_empNum + "]";
	}
    
    
}
