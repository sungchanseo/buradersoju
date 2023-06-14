package com.itwillbs.domain;

import java.sql.Date;

public class EmployeeVO {
	private int emp_id;
	private String emp_pw;
	private String emp_name;
	private String emp_email;
	private String emp_birth;
	private String emp_gender;
	private String emp_phone;
	private String emp_tel;
	private String emp_address;
	private String emp_image;
	private String emp_department;
	private String emp_position;
	private String emp_status;
	private Date join_date;
	private Date absence_date;
	private Date rehabi_date;
	private Date resign_date;

	public EmployeeVO() {

	}

	public int getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_pw() {
		return emp_pw;
	}

	public void setEmp_pw(String emp_pw) {
		this.emp_pw = emp_pw;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_email() {
		return emp_email;
	}

	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}

	public String getEmp_birth() {
		return emp_birth;
	}

	public void setEmp_birth(String emp_birth) {
		this.emp_birth = emp_birth;
	}

	public String getEmp_gender() {
		return emp_gender;
	}

	public void setEmp_gender(String emp_gender) {
		this.emp_gender = emp_gender;
	}

	public String getEmp_phone() {
		return emp_phone;
	}

	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}

	public String getEmp_tel() {
		return emp_tel;
	}

	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}

	public String getEmp_address() {
		return emp_address;
	}

	public void setEmp_address(String emp_address) {
		this.emp_address = emp_address;
	}

	public String getEmp_image() {
		return emp_image;
	}

	public void setEmp_image(String emp_image) {
		this.emp_image = emp_image;
	}

	public String getEmp_department() {
		return emp_department;
	}

	public void setEmp_department(String emp_department) {
		this.emp_department = emp_department;
	}

	public String getEmp_position() {
		return emp_position;
	}

	public void setEmp_position(String emp_position) {
		this.emp_position = emp_position;
	}

	public String getEmp_status() {
		return emp_status;
	}

	public void setEmp_status(String emp_status) {
		this.emp_status = emp_status;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public Date getAbsence_date() {
		return absence_date;
	}

	public void setAbsence_date(Date absence_date) {
		this.absence_date = absence_date;
	}

	public Date getRehabi_date() {
		return rehabi_date;
	}

	public void setRehabi_date(Date rehabi_date) {
		this.rehabi_date = rehabi_date;
	}

	public Date getResign_date() {
		return resign_date;
	}

	public void setResign_date(Date resign_date) {
		this.resign_date = resign_date;
	}

	public EmployeeVO(int emp_id, String emp_pw, String emp_name, String emp_email, String emp_birth, String emp_gender,
			String emp_phone, String emp_tel, String emp_address, String emp_image, String emp_department,
			String emp_position, String emp_status, Date join_date, Date absence_date, Date rehabi_date,
			Date resign_date) {
		super();
		this.emp_id = emp_id;
		this.emp_pw = emp_pw;
		this.emp_name = emp_name;
		this.emp_email = emp_email;
		this.emp_birth = emp_birth;
		this.emp_gender = emp_gender;
		this.emp_phone = emp_phone;
		this.emp_tel = emp_tel;
		this.emp_address = emp_address;
		this.emp_image = emp_image;
		this.emp_department = emp_department;
		this.emp_position = emp_position;
		this.emp_status = emp_status;
		this.join_date = join_date;
		this.absence_date = absence_date;
		this.rehabi_date = rehabi_date;
		this.resign_date = resign_date;
	}

	@Override
	public String toString() {
		return "EmployeeVO [emp_id=" + emp_id + ", emp_pw=" + emp_pw + ", emp_name=" + emp_name + ", emp_email="
				+ emp_email + ", emp_birth=" + emp_birth + ", emp_gender=" + emp_gender + ", emp_phone=" + emp_phone
				+ ", emp_tel=" + emp_tel + ", emp_address=" + emp_address + ", emp_image=" + emp_image
				+ ", emp_department=" + emp_department + ", emp_position=" + emp_position + ", emp_status=" + emp_status
				+ ", join_date=" + join_date + ", absence_date=" + absence_date + ", rehabi_date=" + rehabi_date
				+ ", resign_date=" + resign_date + "]";
	}

}
