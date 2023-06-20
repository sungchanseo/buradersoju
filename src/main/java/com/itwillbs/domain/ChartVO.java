package com.itwillbs.domain;

public class ChartVO {
	private String emp_name;
	private int cont_qty;
	
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getCont_qty() {
		return cont_qty;
	}
	public void setCont_qty(int cont_qty) {
		this.cont_qty = cont_qty;
	}
	
	@Override
	public String toString() {
		return "ChartVO [emp_name=" + emp_name + ", cont_qty=" + cont_qty + "]";
	}
	
	
	
}
