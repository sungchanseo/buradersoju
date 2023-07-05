package com.itwillbs.domain;

public class EmployeeVO {
	private String emp_id;
	private String emp_pw;
	private String emp_name;
	private String emp_email;
	private String emp_birth;
	private String emp_gender;
	private String emp_phone;
	private String emp_tel;
	private String emp_address;
	private String emp_address_detail;
	private String emp_image;
	private String emp_department;
	private String emp_position;
	private String emp_status;
	private String join_date;
	private String absence_date;
	private String rehabi_date;
	private String resign_date;
	private String emp_hidden;

	public EmployeeVO() {

	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
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

	public String getEmp_address_detail() {
		return emp_address_detail;
	}

	public void setEmp_address_detail(String emp_address_detail) {
		this.emp_address_detail = emp_address_detail;
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

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getAbsence_date() {
		return absence_date;
	}

	public void setAbsence_date(String absence_date) {
		this.absence_date = absence_date;
	}

	public String getRehabi_date() {
		return rehabi_date;
	}

	public void setRehabi_date(String rehabi_date) {
		this.rehabi_date = rehabi_date;
	}

	public String getResign_date() {
		return resign_date;
	}

	public void setResign_date(String resign_date) {
		this.resign_date = resign_date;
	}

	public String getEmp_hidden() {
		return emp_hidden;
	}

	public void setEmp_hidden(String emp_hidden) {
		this.emp_hidden = emp_hidden;
	}

	public EmployeeVO(String emp_id, String emp_pw, String emp_name, String emp_email, String emp_birth,
			String emp_gender, String emp_phone, String emp_tel, String emp_address, String emp_address_detail,
			String emp_image, String emp_department, String emp_position, String emp_status, String join_date,
			String absence_date, String rehabi_date, String resign_date, String emp_hidden) {
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
		this.emp_address_detail = emp_address_detail;
		this.emp_image = emp_image;
		this.emp_department = emp_department;
		this.emp_position = emp_position;
		this.emp_status = emp_status;
		this.join_date = join_date;
		this.absence_date = absence_date;
		this.rehabi_date = rehabi_date;
		this.resign_date = resign_date;
		this.emp_hidden = emp_hidden;
	}

	@Override
	public String toString() {
		return "EmployeeVO [emp_id=" + emp_id + ", emp_pw=" + emp_pw + ", emp_name=" + emp_name + ", emp_email="
				+ emp_email + ", emp_birth=" + emp_birth + ", emp_gender=" + emp_gender + ", emp_phone=" + emp_phone
				+ ", emp_tel=" + emp_tel + ", emp_address=" + emp_address + ", emp_address_detail=" + emp_address_detail
				+ ", emp_image=" + emp_image + ", emp_department=" + emp_department + ", emp_position=" + emp_position
				+ ", emp_status=" + emp_status + ", join_date=" + join_date + ", absence_date=" + absence_date
				+ ", rehabi_date=" + rehabi_date + ", resign_date=" + resign_date + ", emp_hidden=" + emp_hidden + "]";
	}

}
