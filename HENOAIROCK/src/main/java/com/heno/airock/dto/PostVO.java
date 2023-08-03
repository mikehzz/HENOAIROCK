package com.heno.airock.dto;

import com.heno.airock.cmn.DTO;

public class PostVO extends DTO{
	private String post_seq;
	private String user_id;
	private String post_title;
	private String post_contents;
	private int read_cnt;
	private int like_cnt;
	private String update_dt;
	private String post_dt;
	private String post_div;
	
	public PostVO() {}

	public String getPost_seq() {
		return post_seq;
	}

	public void setPost_seq(String post_seq) {
		this.post_seq = post_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_contents() {
		return post_contents;
	}

	public void setPost_contents(String post_contents) {
		this.post_contents = post_contents;
	}

	public int getRead_cnt() {
		return read_cnt;
	}

	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}

	public String getUpdate_dt() {
		return update_dt;
	}

	public void setUpdate_dt(String update_dt) {
		this.update_dt = update_dt;
	}

	public String getPost_dt() {
		return post_dt;
	}

	public void setPost_dt(String post_dt) {
		this.post_dt = post_dt;
	}

	public String getPost_div() {
		return post_div;
	}

	public void setPost_div(String post_div) {
		this.post_div = post_div;
	}

	public PostVO(String post_seq, String user_id, String post_title, String post_contents, int read_cnt, int like_cnt,
			String update_dt, String post_dt, String post_div) {
		super();
		this.post_seq = post_seq;
		this.user_id = user_id;
		this.post_title = post_title;
		this.post_contents = post_contents;
		this.read_cnt = read_cnt;
		this.like_cnt = like_cnt;
		this.update_dt = update_dt;
		this.post_dt = post_dt;
		this.post_div = post_div;
	}

	@Override
	public String toString() {
		return "PostVO [post_seq=" + post_seq + ", user_id=" + user_id + ", post_title=" + post_title
				+ ", post_contents=" + post_contents + ", read_cnt=" + read_cnt + ", like_cnt=" + like_cnt
				+ ", update_dt=" + update_dt + ", post_dt=" + post_dt + ", post_div=" + post_div + "]";
	}
	
	
	
	
	
	
}


