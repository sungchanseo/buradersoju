package com.itwillbs.domain;

import java.sql.Date;

public class OrderVO {
 
	//발주변수
	private String order_id;
	private String mn_id;
	private String order_mnName;
	private int order_qty;
	private int orderr_unitCost;
	private int order_sum;
	private int order_vat;
	private Date order_date;
	private Date due_date;
	private String whs_num;
	private int order_emp;
	
	// getset 메서드
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getMn_id() {
		return mn_id;
	}
	public void setMn_id(String mn_id) {
		this.mn_id = mn_id;
	}
	public String getOrder_mnName() {
		return order_mnName;
	}
	public void setOrder_mnName(String order_mnName) {
		this.order_mnName = order_mnName;
	}
	public int getOrder_qty() {
		return order_qty;
	}
	public void setOrder_qty(int order_qty) {
		this.order_qty = order_qty;
	}
	public int getOrderr_unitCost() {
		return orderr_unitCost;
	}
	public void setOrderr_unitCost(int orderr_unitCost) {
		this.orderr_unitCost = orderr_unitCost;
	}
	public int getOrder_sum() {
		return order_sum;
	}
	public void setOrder_sum(int order_sum) {
		this.order_sum = order_sum;
	}
	public int getOrder_vat() {
		return order_vat;
	}
	public void setOrder_vat(int order_vat) {
		this.order_vat = order_vat;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public Date getDue_date() {
		return due_date;
	}
	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}
	public String getWhs_num() {
		return whs_num;
	}
	public void setWhs_num(String whs_num) {
		this.whs_num = whs_num;
	}
	public int getOrder_emp() {
		return order_emp;
	}
	public void setOrder_emp(int order_emp) {
		this.order_emp = order_emp;
	}
	
	
	// toString 메서드
	@Override
	public String toString() {
		return "OrderVO [order_id=" + order_id + ", mn_id=" + mn_id + ", order_mnName=" + order_mnName + ", order_qty="
				+ order_qty + ", orderr_unitCost=" + orderr_unitCost + ", order_sum=" + order_sum + ", order_vat="
				+ order_vat + ", order_date=" + order_date + ", due_date=" + due_date + ", whs_num=" + whs_num
				+ ", order_emp=" + order_emp + "]";
	}
	
	
	
}
