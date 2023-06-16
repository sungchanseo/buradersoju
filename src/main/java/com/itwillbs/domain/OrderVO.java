 package com.itwillbs.domain;

import java.sql.Date;

public class OrderVO {
 
	//발주변수
	private String order_id;
	private String ma_id;  
	private String order_maName;
	private int order_qty;
	private int order_unitCost;
	private int order_sum;
	private int order_vat;
	private Date order_date;
	private Date due_date;
	private Date in_date;
	private String whs_num;
	private int order_emp;
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getMa_id() {
		return ma_id;
	}
	public void setMa_id(String ma_id) {
		this.ma_id = ma_id;
	}
	public String getOrder_maName() {
		return order_maName;
	}
	public void setOrder_maName(String order_maName) {
		this.order_maName = order_maName;
	}
	public int getOrder_qty() {
		return order_qty;
	}
	public void setOrder_qty(int order_qty) {
		this.order_qty = order_qty;
	}
	public int getOrder_unitCost() {
		return order_unitCost;
	}
	public void setOrder_unitCost(int order_unitCost) {
		this.order_unitCost = order_unitCost;
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
	public Date getIn_date() {
		return in_date;
	}
	public void setIn_date(Date in_date) {
		this.in_date = in_date;
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
	
	@Override
	public String toString() {
		return "OrderVO [order_id=" + order_id + ", ma_id=" + ma_id + ", order_maName=" + order_maName + ", order_qty="
				+ order_qty + ", order_unitCost=" + order_unitCost + ", order_sum=" + order_sum + ", order_vat="
				+ order_vat + ", order_date=" + order_date + ", due_date=" + due_date + ", in_date=" + in_date
				+ ", whs_num=" + whs_num + ", order_emp=" + order_emp + "]";
	}
	
}
