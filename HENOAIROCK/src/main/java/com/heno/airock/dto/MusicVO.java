package com.heno.airock.dto;

import com.heno.airock.cmn.DTO;

public class MusicVO extends MemberDTO {
	private String musicId	  ;
	private String title	  ;
	private String album	  ;
	private String artist	  ;
	private String lyrics	  ;
	private String genre	  ;
	private String feeling	  ;
	private String albumPath  ;
	private String ytLink	  ;
	private String publicDt   ;
	private int likeSeq		  ;
	
	public MusicVO() {}

	public MusicVO(String musicId, String title, String album, String artist, String lyrics, String genre,
			String feeling, String albumPath, String ytLink, String publicDt) {
		super();
		this.musicId = musicId;
		this.title = title;
		this.album = album;
		this.artist = artist;
		this.lyrics = lyrics;
		this.genre = genre;
		this.feeling = feeling;
		this.albumPath = albumPath;
		this.ytLink = ytLink;
		this.publicDt = publicDt;
	}

	public String getMusicId() {
		return musicId;
	}

	public void setMusicId(String musicId) {
		this.musicId = musicId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getLyrics() {
		return lyrics;
	}

	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getFeeling() {
		return feeling;
	}

	public void setFeeling(String feeling) {
		this.feeling = feeling;
	}

	public String getAlbumPath() {
		return albumPath;
	}

	public void setAlbumPath(String albumPath) {
		this.albumPath = albumPath;
	}

	public String getYtLink() {
		return ytLink;
	}

	public void setYtLink(String ytLink) {
		this.ytLink = ytLink;
	}

	public String getPublicDt() {
		return publicDt;
	}

	public void setPublicDt(String publicDt) {
		this.publicDt = publicDt;
	}
	
    public void setUserId(String userId) {
        super.setUserId(userId);
    }

    public String getUserId() {
        return super.getUserId();
    }

	@Override
	public String toString() {
		return "MusicVO [musicId=" + musicId + ", title=" + title + ", album=" + album + ", artist=" + artist
				+ ", lyrics=" + lyrics + ", genre=" + genre + ", feeling=" + feeling + ", albumPath=" + albumPath
				+ ", ytLink=" + ytLink + ", publicDt=" + publicDt + "]";
	}

}
