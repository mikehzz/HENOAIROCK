package com.heno.airock.dto;


public class MyPlayListVO extends MemberDTO{

	private String title;
	private String artist;
	private String albumImg;
	private String feeling;
	private String album;
	private String ytLink;
	
	public MyPlayListVO() {}

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

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}



    public void setUserId(String userId) {
        super.setUserId(userId);
    }

    public String getUserId() {
        return super.getUserId();
    }


	public String getYtLink() {
		return ytLink;
	}

	public void setYtLink(String ytLink) {
		this.ytLink = ytLink;
	}

	@Override
	public String toString() {
		return "MyPlayListVO [title=" + title + ", artist=" + artist + ", albumImg=" + albumImg + ", feeling=" + feeling
				+ ", album=" + album + ", ytLink=" + ytLink + ", toString()=" + super.toString() + "]";
	}

}
