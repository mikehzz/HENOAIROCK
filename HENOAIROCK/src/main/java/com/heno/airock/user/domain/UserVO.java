package com.heno.airock.user.domain;

import com.heno.airock.cmn.DTO;

public class UserVO extends DTO{
	private String email  ;//회원id
	private String name    ;//이름
	private String passwd  ;//비번
	private String reg_dt; //등록일
	
	public UserVO() {}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public UserVO(String email, String name, String passwd, String reg_dt) {
		super();
		this.email = email;
		this.name = name;
		this.passwd = passwd;
		this.reg_dt = reg_dt;
	}

	@Override
	public String toString() {
		return "UserVO [email=" + email + ", name=" + name + ", passwd=" + passwd + ", reg_dt=" + reg_dt + "]";
	}
	
	
	
	
	

}
