package com.heno.airock.service;

import org.springframework.stereotype.Service;

import com.heno.airock.dto.MusicHeartDTO;
import com.heno.airock.member.repository.MusicLikeCntRepository;

@Service
public class MusicLikeCntService {
	private final MusicLikeCntRepository mlcRepository;
	
	public MusicLikeCntService(MusicLikeCntRepository mlcRepository) {
		this.mlcRepository = mlcRepository;
	}
	
	
}
