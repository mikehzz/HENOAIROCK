package com.heno.airock.dto;

public class MusicHeartDTO extends MusicVO {
	private String likeSeq;
	
	
	public MusicHeartDTO () {}
	
	public String getLikeSeq() {
		return likeSeq;
	}
	public void setLikeSeq(String likeSeq) {
		this.likeSeq = likeSeq;
	}

	public void setUserId(String userId) {
        super.setUserId(userId);
    }

    public String getUserId() {
        return super.getUserId();
    }
    
    public void setMusicId(String musicId) {
    	super.setMusicId(musicId);
    }
    
    public String getMusicId() {
    	return super.getMusicId();
    }


	@Override
	public String toString() {
		return "MusicHeartDTO [likeSeq=" + likeSeq + "]";
	}

	
    
    
	
}
