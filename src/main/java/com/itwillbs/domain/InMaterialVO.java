package com.itwillbs.domain;
import java.sql.Timestamp;



public class InMaterialVO {
	
	private String in_id;
	private String order_id;
	private String in_maName;
	private int in_qty;
	private String in_progress;
	private Timestamp in_date;
	private int in_emp;
	
	
	public String getIn_id() {
		return in_id;
	}
	public void setIn_id(String in_id) {
		this.in_id = in_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getIn_maName() {
		return in_maName;
	}
	public void setIn_maName(String in_maName) {
		this.in_maName = in_maName;
	}
	public int getIn_qty() {
		return in_qty;
	}
	public void setIn_qty(int in_qty) {
		this.in_qty = in_qty;
	}
	public String getIn_progress() {
		return in_progress;
	}
	public void setIn_progress(String in_progress) {
		this.in_progress = in_progress;
	}
	public Timestamp getIn_date() {
		return in_date;
	}
	public void setIn_date(Timestamp in_date) {
		this.in_date = in_date;
	}
	public int getIn_emp() {
		return in_emp;
	}
	public void setIn_emp(int in_emp) {
		this.in_emp = in_emp;
	}
	
	
	@Override
	public String toString() {
		return "InMaterialVO [in_id=" + in_id + ", order_id=" + order_id + ", in_maName=" + in_maName + ", in_qty="
				+ in_qty + ", in_progress=" + in_progress + ", in_date=" + in_date + ", in_emp=" + in_emp + "]";
	}
	
}
