package com.heno.airock.dto;

public class MemberDTO {
	private String email;
	private String password;
	private String name;
	private String nickname;
	private String memberdt;
	private String birth;
	private String profileimg;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getMemberdt() {
		return memberdt;
	}
	public void setMemberdt(String memberdt) {
		this.memberdt = memberdt;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	public MemberDTO(String email, String password, String name, String nickname, String memberdt, String birth,
			String profileimg) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.memberdt = memberdt;
		this.birth = birth;
		this.profileimg = profileimg;
	}
	@Override
	public String toString() {
		return "MemberDTO [email=" + email + ", password=" + password + ", name=" + name + ", nickname=" + nickname
				+ ", memberdt=" + memberdt + ", birth=" + birth + ", profileimg=" + profileimg + "]";
	}
	
	
	
}
