package com.heno.airock.dto;

import com.heno.airock.cmn.DTO;

public class MusicVO extends DTO {
	private String music_id	  ;
	private String title	  ;
	private String album	  ;
	private String artist	  ;
	private String lyrics	  ;
	private String genre	  ;
	private String feeling	  ;
	private String album_path ;
	private String yt_link	  ;
	private String public_dt  ;
	
	public MusicVO() {}

	public MusicVO(String music_id, String title, String album, String artist, String lyrics, String genre,
			String feeling, String album_path, String yt_link, String public_dt) {
		super();
		this.music_id = music_id;
		this.title = title;
		this.album = album;
		this.artist = artist;
		this.lyrics = lyrics;
		this.genre = genre;
		this.feeling = feeling;
		this.album_path = album_path;
		this.yt_link = yt_link;
		this.public_dt = public_dt;
	}

	public String getMusic_id() {
		return music_id;
	}

	public void setMusic_id(String music_id) {
		this.music_id = music_id;
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

	public String getAlbum_path() {
		return album_path;
	}

	public void setAlbum_path(String album_path) {
		this.album_path = album_path;
	}

	public String getYt_link() {
		return yt_link;
	}

	public void setYt_link(String yt_link) {
		this.yt_link = yt_link;
	}

	public String getPublic_dt() {
		return public_dt;
	}

	public void setPublic_dt(String public_dt) {
		this.public_dt = public_dt;
	}

	@Override
	public String toString() {
		return "MusicVO [music_id=" + music_id + ", title=" + title + ", album=" + album + ", artist=" + artist
				+ ", lyrics=" + lyrics + ", genre=" + genre + ", feeling=" + feeling + ", album_path=" + album_path
				+ ", yt_link=" + yt_link + ", public_dt=" + public_dt + "]";
	}
	
	
	
}
