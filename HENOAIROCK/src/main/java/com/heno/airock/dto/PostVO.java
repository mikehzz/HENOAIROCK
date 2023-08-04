package com.heno.airock.dto;

import com.heno.airock.cmn.DTO;

public class PostVO extends DTO{
	private String postSeq;
	private String userId;
	private String postTitle;
	private String postContents;
	private int readCnt;
	private int likeCnt;
	private String updateDt;
	private String postDt;
	private String postDiv;
	
	public PostVO() {}

	public String getPostSeq() {
		return postSeq;
	}

	public void setPostSeq(String postSeq) {
		this.postSeq = postSeq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContents() {
		return postContents;
	}

	public void setPostContents(String postContents) {
		this.postContents = postContents;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public String getUpdateDt() {
		return updateDt;
	}

	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}

	public String getPostDt() {
		return postDt;
	}

	public void setPostDt(String postDt) {
		this.postDt = postDt;
	}

	public String getPostDiv() {
		return postDiv;
	}

	public void setPostDiv(String postDiv) {
		this.postDiv = postDiv;
	}

	public PostVO(String postSeq, String userId, String postTitle, String postContents, int readCnt, int likeCnt,
			String updateDt, String postDt, String postDiv) {
		super();
		this.postSeq = postSeq;
		this.userId = userId;
		this.postTitle = postTitle;
		this.postContents = postContents;
		this.readCnt = readCnt;
		this.likeCnt = likeCnt;
		this.updateDt = updateDt;
		this.postDt = postDt;
		this.postDiv = postDiv;
	}

	@Override
	public String toString() {
		return "PostVO [postSeq=" + postSeq + ", userId=" + userId + ", postTitle=" + postTitle + ", postContents="
				+ postContents + ", readCnt=" + readCnt + ", likeCnt=" + likeCnt + ", updateDt=" + updateDt
				+ ", postDt=" + postDt + ", postDiv=" + postDiv + "]";
	}

	
}


