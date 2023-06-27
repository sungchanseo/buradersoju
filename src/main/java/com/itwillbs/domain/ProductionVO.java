package com.itwillbs.domain;

import java.sql.Timestamp;

public class ProductionVO {
	
	// Contract
	private String cont_id;
	private Integer cont_qty;
	
	// pr_material
//	private String product_id;
	private String ma_name;
	private float use_qty;
	
	// material
//	private String ma_name;
	private String ma_id;
	private float ma_qty;
	private String unit;
	
	// production
	private String production_id;
//	private String cont_id;
	private int production_emp;
	private Timestamp production_date;
	private String op_id;
	private String production_line;
	private int plan_qty;
	private int production_qty;	
	private String workOrder_status;
	private String production_status;
//	private String product_id;
	
	// product
	private String product_id;
	private String product_name;
	
	// complete
	private Timestamp complete_date;
	private int complete_defQty;
//	private String def_code;
	
	// qc
	private String qc_num;
	private int qc_emp;
	private Timestamp qc_date;
	private int qc_qty;
	private String qc_state;
	
	// defective
	private String def_code;
	private int def_qty;
	
	// empty_bottle
	private Timestamp bt_date;
	private int bt_qty;
	private int bt_defQty;
	
	
	// getter / setter
	

	public String getCont_id() {
		return cont_id;
	}


	public Integer getCont_qty() {
		return cont_qty;
	}


	public String getMa_name() {
		return ma_name;
	}


	public float getUse_qty() {
		return use_qty;
	}


	public String getMa_id() {
		return ma_id;
	}


	public float getMa_qty() {
		return ma_qty;
	}


	public String getUnit() {
		return unit;
	}


	public String getProduction_id() {
		return production_id;
	}


	public int getProduction_emp() {
		return production_emp;
	}


	public Timestamp getProduction_date() {
		return production_date;
	}


	public String getOp_id() {
		return op_id;
	}


	public String getProduction_line() {
		return production_line;
	}


	public int getPlan_qty() {
		return plan_qty;
	}


	public int getProduction_qty() {
		return production_qty;
	}


	public String getWorkOrder_status() {
		return workOrder_status;
	}


	public String getProduction_status() {
		return production_status;
	}


	public String getProduct_id() {
		return product_id;
	}


	public String getProduct_name() {
		return product_name;
	}


	public Timestamp getComplete_date() {
		return complete_date;
	}


	public int getComplete_defQty() {
		return complete_defQty;
	}


	public String getQc_num() {
		return qc_num;
	}


	public int getQc_emp() {
		return qc_emp;
	}


	public Timestamp getQc_date() {
		return qc_date;
	}


	public int getQc_qty() {
		return qc_qty;
	}


	public String getQc_state() {
		return qc_state;
	}


	public String getDef_code() {
		return def_code;
	}


	public int getDef_qty() {
		return def_qty;
	}


	public Timestamp getBt_date() {
		return bt_date;
	}


	public int getBt_qty() {
		return bt_qty;
	}


	public int getBt_defQty() {
		return bt_defQty;
	}


	public void setCont_id(String cont_id) {
		this.cont_id = cont_id;
	}


	public void setCont_qty(Integer cont_qty) {
		this.cont_qty = cont_qty;
	}


	public void setMa_name(String ma_name) {
		this.ma_name = ma_name;
	}


	public void setUse_qty(float use_qty) {
		this.use_qty = use_qty;
	}


	public void setMa_id(String ma_id) {
		this.ma_id = ma_id;
	}


	public void setMa_qty(float ma_qty) {
		this.ma_qty = ma_qty;
	}


	public void setUnit(String unit) {
		this.unit = unit;
	}


	public void setProduction_id(String production_id) {
		this.production_id = production_id;
	}


	public void setProduction_emp(int production_emp) {
		this.production_emp = production_emp;
	}


	public void setProduction_date(Timestamp production_date) {
		this.production_date = production_date;
	}


	public void setOp_id(String op_id) {
		this.op_id = op_id;
	}


	public void setProduction_line(String production_line) {
		this.production_line = production_line;
	}


	public void setPlan_qty(int plan_qty) {
		this.plan_qty = plan_qty;
	}


	public void setProduction_qty(int production_qty) {
		this.production_qty = production_qty;
	}


	public void setWorkOrder_status(String workOrder_status) {
		this.workOrder_status = workOrder_status;
	}


	public void setProduction_status(String production_status) {
		this.production_status = production_status;
	}


	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public void setComplete_date(Timestamp complete_date) {
		this.complete_date = complete_date;
	}


	public void setComplete_defQty(int complete_defQty) {
		this.complete_defQty = complete_defQty;
	}


	public void setQc_num(String qc_num) {
		this.qc_num = qc_num;
	}


	public void setQc_emp(int qc_emp) {
		this.qc_emp = qc_emp;
	}


	public void setQc_date(Timestamp qc_date) {
		this.qc_date = qc_date;
	}


	public void setQc_qty(int qc_qty) {
		this.qc_qty = qc_qty;
	}


	public void setQc_state(String qc_state) {
		this.qc_state = qc_state;
	}


	public void setDef_code(String def_code) {
		this.def_code = def_code;
	}


	public void setDef_qty(int def_qty) {
		this.def_qty = def_qty;
	}


	public void setBt_date(Timestamp bt_date) {
		this.bt_date = bt_date;
	}


	public void setBt_qty(int bt_qty) {
		this.bt_qty = bt_qty;
	}


	public void setBt_defQty(int bt_defQty) {
		this.bt_defQty = bt_defQty;
	}

	
	// toString()
	@Override
	public String toString() {
		return "ProductionVO [cont_id=" + cont_id + ", cont_qty=" + cont_qty + ", ma_name=" + ma_name + ", use_qty="
				+ use_qty + ", ma_id=" + ma_id + ", ma_qty=" + ma_qty + ", unit=" + unit + ", production_id="
				+ production_id + ", production_emp=" + production_emp + ", production_date=" + production_date
				+ ", op_id=" + op_id + ", production_line=" + production_line + ", plan_qty=" + plan_qty
				+ ", production_qty=" + production_qty + ", workOrder_status=" + workOrder_status
				+ ", production_status=" + production_status + ", product_id=" + product_id + ", product_name="
				+ product_name + ", complete_date=" + complete_date + ", complete_defQty=" + complete_defQty
				+ ", qc_num=" + qc_num + ", qc_emp=" + qc_emp + ", qc_date=" + qc_date + ", qc_qty=" + qc_qty
				+ ", qc_state=" + qc_state + ", def_code=" + def_code + ", def_qty=" + def_qty + ", bt_date=" + bt_date
				+ ", bt_qty=" + bt_qty + ", bt_defQty=" + bt_defQty + "]";
	}
	

}

