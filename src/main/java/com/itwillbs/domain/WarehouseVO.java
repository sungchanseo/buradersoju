package com.itwillbs.domain;

public class WarehouseVO {

	private String whs_id;
	private String whs_type;
	private String whs_tel;
	private String shelt_position;
	private String whs_emp;
	private Boolean whs_status;
	private int whs_sts;
	public String getWhs_id() {
		return whs_id;
	}
	public void setWhs_id(String whs_id) {
		this.whs_id = whs_id;
	}
	public String getWhs_type() {
		return whs_type;
	}
	public void setWhs_type(String whs_type) {
		this.whs_type = whs_type;
	}
	public String getWhs_tel() {
		return whs_tel;
	}
	public void setWhs_tel(String whs_tel) {
		this.whs_tel = whs_tel;
	}
	public String getShelt_position() {
		return shelt_position;
	}
	public void setShelt_position(String shelt_position) {
		this.shelt_position = shelt_position;
	}
	public String getWhs_emp() {
		return whs_emp;
	}
	public void setWhs_emp(String whs_emp) {
		this.whs_emp = whs_emp;
	}
	public Boolean getWhs_status() {
		return whs_status;
	}
	public void setWhs_status(Boolean whs_status) {
		this.whs_status = whs_status;
	}
	public int getWhs_sts() {
		return whs_sts;
	}
	public void setWhs_sts(int whs_sts) {
		this.whs_sts = whs_sts;
	}
	@Override
	public String toString() {
		return "WarehouseVO [whs_id=" + whs_id + ", whs_type=" + whs_type + ", whs_tel=" + whs_tel + ", shelt_position="
				+ shelt_position + ", whs_emp=" + whs_emp + ", whs_status=" + whs_status + ", whs_sts=" + whs_sts + "]";
	}
	
	
}
