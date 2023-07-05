package com.itwillbs.domain;

import java.sql.Timestamp;

public class ProductionVO {
	
	// Contract
	private String cont_id;
	private Integer cont_qty;
	
	// employee
	private String emp_name;
	
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
	private String workOrder_status;
//	private String product_id;
	
	// product
	private String product_id;
	private String product_name;
	private int product_qty;

	
	// pr_complete
  private String production_status;
	private String stage1_defCode;
	private int stage1_defQty;
	private Timestamp stage1_date;
	private String stage2_defCode;
	private int stage2_defQty;
	private Timestamp stage2_date;
	private String stage3_defCode;
	private int stage3_defQty;
	private Timestamp stage3_date;
//	private int production_qty;	

	// qc
	private String qc_num;
	private int qc_emp;
	private Timestamp qc_date;
	private int qc_qty;
	private String qc_status;
	
	// defective
	private String def_code;
	private int def_qty;
	
	// empty_bottle
	private String bt_date;
	private int bt_qty;
	private int bt_defQty;
	
	
	// getter / setter

	public String getCont_id() {
		return cont_id;
	}
	


	public void setCont_id(String cont_id) {
		this.cont_id = cont_id;
	}


	public Integer getCont_qty() {
		return cont_qty;
	}

	public void setDef_code(String def_code) {
		this.def_code = def_code;
	}

}

