package com.heno.airock.dto;

public class MemberDTO {
	private String email;
	private String passwd;
	private String name;
	private String reg_dt;
	private String gender;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public MemberDTO(String email, String passwd, String name, String reg_dt, String gender) {
		super();
		this.email = email;
		this.passwd = passwd;
		this.name = name;
		this.reg_dt = reg_dt;
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "memberDTO [email=" + email + ", passwd=" + passwd + ", name=" + name + ", reg_dt=" + reg_dt
				+ ", gender=" + gender + "]";
	}
	
	
}
