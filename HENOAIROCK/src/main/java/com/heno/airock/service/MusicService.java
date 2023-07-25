package com.heno.airock.service;

import org.springframework.stereotype.Service;

import com.heno.airock.member.repository.MusicRepository;

@Service
public class MusicService {
	private final MusicRepository musicRepository;
	
	public MusicService(MusicRepository musicRepository) {
		this.musicRepository = musicRepository;
	}
}	
