package com.heno.airock.dto;


public class MyPlayListVO extends MemberDTO{
	private String title;
	private String artist;
	private String albumImg;
	private String feeling;

	public MyPlayListVO() {}

	public MyPlayListVO(String title, String artist, String albumImg, String feeling) {
		super();
		this.title = title;
		this.artist = artist;
		this.albumImg = albumImg;
		this.feeling = feeling;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getAlbumImg() {
		return albumImg;
	}

	public void setAlbumImg(String albumImg) {
		this.albumImg = albumImg;
	}

	public String getFeeling() {
		return feeling;
	}

	public void setFeeling(String feeling) {
		this.feeling = feeling;
	}

    public void setUserId(String user_id) {
        // MemberDTO 클래스로부터 상속받은 setUserId 메서드를 호출하여 설정
        super.setUserId(user_id);
    }
    
	public String getUserId() {
		return getUserId();
	} 
    
	@Override
	public String toString() {
		return "MyPlayListVO [title=" + title + ", artist=" + artist + ", albumImg=" + albumImg + ", feeling=" + feeling
				+ ", toString()=" + super.toString() + "]";
	}
	
}
