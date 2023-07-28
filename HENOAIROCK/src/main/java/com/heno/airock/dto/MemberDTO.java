package com.heno.airock.dto;

public class MemberDTO {
	private String user_id;
	private String password;
	private String name;
	private String nickname;
	private String member_dt;
	private String birth;
	private String profile_img;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMember_dt() {
		return member_dt;
	}
	public void setMember_dt(String member_dt) {
		this.member_dt = member_dt;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public MemberDTO(String user_id, String password, String name, String nickname, String member_dt, String birth,
			String profile_img) {
		super();
		this.user_id = user_id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.member_dt = member_dt;
		this.birth = birth;
		this.profile_img = profile_img;
	}
	@Override
	public String toString() {
		return "MemberDTO [user_id=" + user_id + ", password=" + password + ", name=" + name + ", nickname=" + nickname
				+ ", member_dt=" + member_dt + ", birth=" + birth + ", profile_img=" + profile_img + "]";
	}
	
	
	
}
